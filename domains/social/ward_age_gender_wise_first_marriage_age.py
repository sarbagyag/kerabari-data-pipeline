import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import SOCIAL_SQL_DIR

# Setting up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'   
)

logger = logging.getLogger(__name__)

# Gender mappings
GENDER_MAPPING = {
    'पुरुष': 'MALE',
    'महिला': 'FEMALE',
    'अन्य': 'OTHER',
    
    # English variants
    'male': 'MALE',
    'female': 'FEMALE',
    'other': 'OTHER',
    
    # Handle nulls and empty strings
    None: 'OTHER',
    '': 'OTHER'
}

# Age group mappings for first marriage
AGE_GROUP_MAPPING = {
    (0, 14): 'AGE_0_14',
    (15, 19): 'AGE_15_19',
    (20, 24): 'AGE_20_24',
    (25, 29): 'AGE_25_29',
    (30, 34): 'AGE_30_34',
    (35, 39): 'AGE_35_39',
    (40, 44): 'AGE_40_44',
    (45, 49): 'AGE_45_49',
    (50, 54): 'AGE_50_54',
    (55, 59): 'AGE_55_59',
    (60, 999): 'AGE_60_AND_ABOVE',
    
    # Handle nulls or invalid values
    None: None
}

TARGET_TABLE = 'acme_ward_age_gender_wise_first_marriage_age'

def map_gender(gender):
    """Map gender values to standardized enum values."""
    if not gender or pd.isna(gender):
        return "OTHER"
    
    # Try direct mapping
    standardized = GENDER_MAPPING.get(gender)
    if standardized:
        return standardized
    
    # Try lowercase matching
    gender_lower = str(gender).lower().strip()
    for key, value in GENDER_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == gender_lower:
            return value
    
    # Default
    logger.warning(f"Gender '{gender}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def get_age_group(age):
    """Convert age to appropriate age group enum value."""
    if pd.isna(age) or not age:
        return None
    
    try:
        age = int(age)
        for (lower, upper), group in AGE_GROUP_MAPPING.items():
            if lower <= age <= upper:
                return group
    except (ValueError, TypeError):
        logger.warning(f"Invalid age value: {age}")
    
    return None

def extract_marriage_age_data(source_conn):
    """Extracts first marriage age data from the database."""
    logger.info("Extracting first marriage age data now")

    query = """
    SELECT
        ward_no,
        gender,
        married_age,
        COUNT(*) as population
    FROM
        synthetic_survey_kerabari_individual
    WHERE
        married_age IS NOT NULL
        AND married_age > 0
        AND marital_status NOT IN ('unmarried', 'विवाह नभएको')
    GROUP BY
        ward_no, gender, married_age
    ORDER BY
        ward_no, gender, married_age
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of first marriage age data")
    return df

def transform_marriage_age_data(df):
    logger.info("Transforming first marriage age data now")

    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map gender to standardized values
    df['gender_mapped'] = df['gender'].apply(map_gender)
    
    # Convert marriage_age to appropriate age groups
    df['first_marriage_age_group'] = df['married_age'].apply(get_age_group)
    
    # Drop rows with None age group (invalid ages)
    df = df.dropna(subset=['first_marriage_age_group'])
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward, gender, and age group to sum population
    grouped_df = df.groupby(['ward_no', 'gender_mapped', 'first_marriage_age_group'])['population'].sum().reset_index()
    
    logger.info(f"Transformed data into {len(grouped_df)} ward-gender-age group combinations")
    return grouped_df

def create_insert_data(ward_number, gender, age_group, population):
    """Create a data dictionary for insertion specific to first marriage age data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'gender': gender,
        'first_marriage_age_group': age_group,
        'population': int(population),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to first marriage age data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, gender, first_marriage_age_group, population, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['gender']}',
        '{data['first_marriage_age_group']}',
        {data['population']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_age_gender_wise_first_marriage_age table if it doesn't exist."""
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
            first_marriage_age_group VARCHAR(100) NOT NULL,
            gender VARCHAR(50) NOT NULL,
            population INTEGER NOT NULL,
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

def load_marriage_age_data(df, target_conn, generate_sql=True):
    """Load the transformed first marriage age data into the target database."""
    logger.info(f"Loading data into {TARGET_TABLE}")

    # Check if table exists and has data
    if table_exists(target_conn, TARGET_TABLE) and table_has_data(target_conn, TARGET_TABLE):
        logger.info(f"Table {TARGET_TABLE} already exists and has data. Skipping insertion.")
        return False

    # Prepare insert data and statements
    insert_data = []
    insert_statements = []

    for _, row in df.iterrows():
        # Create data dictionary
        data = create_insert_data(
            ward_number=row['ward_no'],
            gender=row['gender_mapped'],
            age_group=row['first_marriage_age_group'],
            population=row['population']
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
        sql_file_path = os.path.join(SOCIAL_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
        logger.info(f"SQL file generated at {sql_file_path}")
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_ward_age_gender_wise_first_marriage_age(source_conn, target_conn, generate_sql=True):
    """Process ward-age-gender-wise first marriage age data from extraction to loading."""
    logger.info("Processing ward-age-gender-wise first marriage age data")
    
    try:
        # Extract data
        df = extract_marriage_age_data(source_conn)
        
        # Transform data
        transformed_df = transform_marriage_age_data(df)
        
        # Load data
        load_marriage_age_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-age-gender-wise first marriage age data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-age-gender-wise first marriage age data: {e}")
        return False
