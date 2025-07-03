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
TARGET_TABLE = "acme_ward_age_wise_marital_status"

# Define age group mappings
AGE_GROUPS = {
    "0-14": "AGE_BELOW_15",
    "15-19": "AGE_15_19",
    "20-24": "AGE_20_24",
    "25-29": "AGE_25_29",
    "30-34": "AGE_30_34",
    "35-39": "AGE_35_39",
    "40-44": "AGE_40_44",
    "45-49": "AGE_45_49",
    "50-54": "AGE_50_54",
    "55-59": "AGE_55_59",
    "60-64": "AGE_60_64",
    "65-69": "AGE_65_69",
    "70-74": "AGE_70_74",
    "75+": "AGE_75_AND_ABOVE"
}

# Define marital status mappings
MARITAL_STATUS = {
    "single": "SINGLE",
    "unmarried": "SINGLE",
    "married": "MARRIED",
    "divorced": "DIVORCED",
    "widowed": "WIDOWED",
    "widow": "WIDOWED",
    "separated": "SEPARATED",
    "not stated": "NOT_STATED",
    "unknown": "NOT_STATED",
    "": "NOT_STATED"
}

def map_age_group(age):
    """
    Map age to standardized age groups.
    """
    try:
        age = int(age)
        if age < 15:
            return "AGE_BELOW_15"
        elif 15 <= age <= 19:
            return "AGE_15_19"
        elif 20 <= age <= 24:
            return "AGE_20_24"
        elif 25 <= age <= 29:
            return "AGE_25_29"
        elif 30 <= age <= 34:
            return "AGE_30_34"
        elif 35 <= age <= 39:
            return "AGE_35_39"
        elif 40 <= age <= 44:
            return "AGE_40_44"
        elif 45 <= age <= 49:
            return "AGE_45_49"
        elif 50 <= age <= 54:
            return "AGE_50_54"
        elif 55 <= age <= 59:
            return "AGE_55_59"
        elif 60 <= age <= 64:
            return "AGE_60_64"
        elif 65 <= age <= 69:
            return "AGE_65_69"
        elif 70 <= age <= 74:
            return "AGE_70_74"
        else:  # 75 and above
            return "AGE_75_AND_ABOVE"
    except (ValueError, TypeError):
        logger.warning(f"Could not convert age to int: {age}. Using default AGE_NOT_STATED.")
        return "AGE_NOT_STATED"

def map_marital_status(status):
    """
    Map marital status to standardized values.
    """
    if not status or pd.isna(status):
        return "NOT_STATED"
    
    status_lower = str(status).lower().strip()
    return MARITAL_STATUS.get(status_lower, "NOT_STATED")

def create_insert_data(ward_number, age_group, marital_status, population, male_pop, female_pop, other_pop):
    """
    Create a data dictionary for insertion specific to marital status.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'age_group': age_group,
        'marital_status': marital_status,
        'population': int(population),
        'male_population': int(male_pop) if male_pop is not None else None,
        'female_population': int(female_pop) if female_pop is not None else None,
        'other_population': int(other_pop) if other_pop is not None else None,
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to marital status.
    """
    # Handle NULL values for optional gender columns
    male_pop = f"{data['male_population']}" if data['male_population'] is not None else "NULL"
    female_pop = f"{data['female_population']}" if data['female_population'] is not None else "NULL"
    other_pop = f"{data['other_population']}" if data['other_population'] is not None else "NULL"
    
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, age_group, marital_status, population, male_population, female_population, other_population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['age_group']}',
        '{data['marital_status']}',
        {data['population']},
        {male_pop},
        {female_pop},
        {other_pop},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_age_wise_marital_status table if it doesn't exist.
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
            marital_status VARCHAR(100) NOT NULL,
            population INTEGER NOT NULL,
            male_population INTEGER,
            female_population INTEGER,
            other_population INTEGER,
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

def extract_marital_status_data(source_conn):
    """Extract marital status data from source database."""
    logger.info("Extracting marital status data")
    
    # Query to get ward, age, gender, and marital status counts
    query = """
    SELECT 
        ward_no, 
        age,
        gender,
        marital_status,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        age IS NOT NULL
        AND marital_status IS NOT NULL
    GROUP BY 
        ward_no, age, gender, marital_status
    ORDER BY 
        ward_no, age, gender, marital_status;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted marital status data with {len(df)} ward-age-status combinations")
    
    return df

def transform_marital_status_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming marital status data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map age to age groups
    df['age_group'] = df['age'].apply(map_age_group)
    
    # Map marital status to standardized values
    df['marital_status_mapped'] = df['marital_status'].apply(map_marital_status)
    
    # Convert gender to lowercase and standardize
    df['gender'] = df['gender'].fillna('unknown').str.lower()
    
    # Group by ward, age group, marital status and gender to sum populations
    result_data = []
    
    # Get unique combinations of ward, age group, and marital status
    ward_age_status = df.groupby(['ward_no', 'age_group', 'marital_status_mapped']).size().reset_index(name='count')
    
    for _, row in ward_age_status.iterrows():
        ward = row['ward_no']
        age_group = row['age_group']
        marital_status = row['marital_status_mapped']
        
        # Filter data for this combination
        subset = df[(df['ward_no'] == ward) & 
                    (df['age_group'] == age_group) & 
                    (df['marital_status_mapped'] == marital_status)]
        
        # Calculate total population and gender breakdown
        total_pop = subset['population'].sum()
        male_pop = subset[subset['gender'] == 'male']['population'].sum() or 0
        female_pop = subset[subset['gender'] == 'female']['population'].sum() or 0
        other_pop = subset[(subset['gender'] != 'male') & 
                           (subset['gender'] != 'female')]['population'].sum() or 0
        
        result_data.append({
            'ward_no': ward,
            'age_group': age_group,
            'marital_status': marital_status,
            'population': total_pop,
            'male_population': male_pop if male_pop > 0 else None,
            'female_population': female_pop if female_pop > 0 else None,
            'other_population': other_pop if other_pop > 0 else None
        })
    
    result_df = pd.DataFrame(result_data)
    logger.info(f"Transformed marital status data with {len(result_df)} ward-age-status combinations")
    
    return result_df

def load_marital_status_data(df, target_conn, generate_sql=True):
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
            marital_status=row['marital_status'],
            population=row['population'],
            male_pop=row['male_population'],
            female_pop=row['female_population'],
            other_pop=row['other_population']
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

def process_marital_status(source_conn, target_conn, generate_sql=True):
    """Process ward-age-wise marital status data from extraction to loading."""
    logger.info("Processing ward-age-wise marital status data")
    
    try:
        # Extract data
        df = extract_marital_status_data(source_conn)
        
        # Transform data
        transformed_df = transform_marital_status_data(df)
        
        # Load data
        load_marital_status_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-age-wise marital status data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-age-wise marital status data: {e}")
        return False
