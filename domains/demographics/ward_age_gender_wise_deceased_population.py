import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import DEMOGRAPHICS_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_ward_age_gender_wise_deceased_population"

# Define gender mappings
GENDER_STATUS = {
    "पुरुष": "MALE",
    "महिला": "FEMALE",
    "male": "MALE",
    "female": "FEMALE",
    "other": "OTHER",
    "not stated": "NOT_STATED",
    "unknown": "NOT_STATED",
    "": "NOT_STATED"
}

def map_age_group(age):
    """
    Map age to standardized age groups.
    """
    if age is None:
        return None
    
    try:
        age_val = int(age)
        if age_val < 5:
            return 'AGE_0_4'
        elif age_val < 10:
            return 'AGE_5_9'
        elif age_val < 15:
            return 'AGE_10_14'
        elif age_val < 20:
            return 'AGE_15_19'
        elif age_val < 25:
            return 'AGE_20_24'
        elif age_val < 30:
            return 'AGE_25_29'
        elif age_val < 35:
            return 'AGE_30_34'
        elif age_val < 40:
            return 'AGE_35_39'
        elif age_val < 45:
            return 'AGE_40_44'
        elif age_val < 50:
            return 'AGE_45_49'
        elif age_val < 55:
            return 'AGE_50_54'
        elif age_val < 60:
            return 'AGE_55_59'
        elif age_val < 65:
            return 'AGE_60_64'
        elif age_val < 70:
            return 'AGE_65_69'
        elif age_val < 75:
            return 'AGE_70_74'
        else:
            return 'AGE_75_AND_ABOVE'
    except (ValueError, TypeError):
        return None

def map_gender_status(gender):
    """
    Map gender to standardized values.
    """
    if not gender or pd.isna(gender):
        return "NOT_STATED"
    
    gender_str = str(gender).strip()
    return GENDER_STATUS.get(gender_str, "NOT_STATED")

def create_insert_data(ward_number, age_group, gender, deceased_count):
    """
    Create a data dictionary for insertion specific to deceased population.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'age_group': age_group,
        'gender': gender,
        'deceased_count': int(deceased_count),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to deceased population.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, age_group, gender, deceased_count, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['age_group']}',
        '{data['gender']}',
        {data['deceased_count']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_age_gender_wise_deceased_population table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE {TARGET_TABLE} (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            age_group VARCHAR(100) NOT NULL,
            gender VARCHAR(100) NOT NULL,
            deceased_count INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
    END IF;
END
$$;

-- Insert data only if table is empty
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM {TARGET_TABLE}) THEN
"""

def generate_closing_statement():
    """Generate the closing SQL statement for conditional insert."""
    return """
    END IF;
END
$$;
"""

def extract_deceased_population_data(source_conn):
    """Extract deceased population data from source database."""
    logger.info("Extracting deceased population data")
    
    # Query to get ward, age, and gender counts from kerabari_death table
    query = """
    SELECT 
        ward_no, 
        deceased_age,
        deceased_gender,
        COUNT(*) as deceased_count
    FROM 
        survey_kerabari_death
    WHERE 
        deceased_age IS NOT NULL
        AND deceased_gender IS NOT NULL
        AND ward_no IS NOT NULL
    GROUP BY 
        ward_no, deceased_age, deceased_gender
    ORDER BY 
        ward_no, deceased_age, deceased_gender;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted deceased population data with {len(df)} ward-age-gender combinations")
    
    return df

def transform_deceased_population_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming deceased population data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map age to age groups
    df['age_group'] = df['deceased_age'].apply(map_age_group)
    
    # Map gender to standardized values
    df['gender_mapped'] = df['deceased_gender'].apply(map_gender_status)
    
    # Remove rows with missing age_group
    df = df.dropna(subset=['age_group'])
    
    # Group by ward, age group, and gender to sum deceased counts
    result_data = []
    
    # Get unique combinations of ward, age group, and gender
    ward_age_gender = df.groupby(['ward_no', 'age_group', 'gender_mapped']).agg({
        'deceased_count': 'sum'
    }).reset_index()
    
    for _, row in ward_age_gender.iterrows():
        result_data.append({
            'ward_no': row['ward_no'],
            'age_group': row['age_group'],
            'gender': row['gender_mapped'],
            'deceased_count': row['deceased_count']
        })
    
    result_df = pd.DataFrame(result_data)
    logger.info(f"Transformed deceased population data with {len(result_df)} ward-age-gender combinations")
    
    return result_df

def load_deceased_population_data(df, target_conn, generate_sql=True):
    """Load the transformed data into the target database and optionally generate SQL file."""
    logger.info(f"Preparing to load data into {TARGET_TABLE}")
    
    # Check if table exists and has data
    if table_exists(target_conn, TARGET_TABLE) and table_has_data(target_conn, TARGET_TABLE):
        logger.info(f"Table {TARGET_TABLE} already exists and has data. Skipping insertion.")
        return False
    
    # Prepare insert data
    insert_data = []
    insert_statements = []
    
    for _, row in df.iterrows():
        # Create data dictionary
        data = create_insert_data(
            ward_number=row['ward_no'],
            age_group=row['age_group'],
            gender=row['gender'],
            deceased_count=row['deceased_count']
        )
        insert_data.append(data)
        
        # Generate SQL statement
        statement = generate_insert_statement(data)
        insert_statements.append(statement)
    
    # Save SQL to file if requested
    if generate_sql:
        # Create the full SQL script with create table and conditional insertion
        full_sql_script = []
        full_sql_script.append(generate_table_create_statement())
        full_sql_script.extend(insert_statements)
        full_sql_script.append(generate_closing_statement())
        
        # Define the output file path
        sql_file_path = os.path.join(DEMOGRAPHICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_deceased_population(source_conn, target_conn, generate_sql=True):
    """Process ward-age-gender-wise deceased population data from extraction to loading."""
    logger.info("Processing ward-age-gender-wise deceased population data")
    
    try:
        # Extract data
        df = extract_deceased_population_data(source_conn)
        
        # Transform data
        transformed_df = transform_deceased_population_data(df)
        
        # Load data
        load_deceased_population_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-age-gender-wise deceased population data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-age-gender-wise deceased population data: {e}")
        return False
