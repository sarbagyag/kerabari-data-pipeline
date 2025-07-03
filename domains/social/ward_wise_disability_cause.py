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

# Disability cause mappings
DISABILITY_CAUSE_MAPPING = {
    'जन्मजात': 'congenital',
    'दुर्घटना': 'accident',
    'कुपोषण': 'malnutrition',
    'रोगको कारण': 'disease',
    'द्वन्द्वको कारण': 'conflict',
    'अन्य(खुलाऊनुहोस्)': 'other',
    
    # English variants
    'congenital': 'congenital',
    'accident': 'accident',
    'malnutrition': 'malnutrition',
    'disease': 'disease',
    'conflict': 'conflict',
    'other': 'other',
    
    # Handle nulls and empty strings
    None: 'unknown',
    '': 'unknown'
}

TARGET_TABLE = 'acme_ward_wise_disability_cause'

def map_disability_cause(cause):
    """Map disability cause values to standardized categories."""
    if not cause or pd.isna(cause):
        return 'unknown'
    
    # Try direct mapping
    mapped_value = DISABILITY_CAUSE_MAPPING.get(cause)
    if mapped_value is not None:
        return mapped_value
    
    # Try lowercase matching
    cause_lower = str(cause).lower().strip()
    for key, value in DISABILITY_CAUSE_MAPPING.items():
        if key and str(key).lower() == cause_lower:
            return value
    
    # Default to other for unmapped causes
    return 'other'

def extract_disability_cause_data(source_conn):
    """Extracts disability cause data from the database."""
    logger.info("Extracting disability cause data now")

    query = """
    SELECT
        ward_no,
        disability_cause,
        is_disabled
    FROM
        synthetic_survey_kerabari_individual
    WHERE
        is_disabled = 'छ'
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of disability cause data")
    return df

def transform_disability_cause_data(df):
    logger.info("Transforming disability cause data now")

    # Ensure ward_no is integer type
    df['ward_no'] = pd.to_numeric(df['ward_no'], errors='coerce').fillna(0).astype(int)
    
    # Map disability causes to standardized categories
    df['mapped_cause'] = df['disability_cause'].apply(map_disability_cause)
    
    # Group by ward and disability cause, count occurrences
    cause_counts = df.groupby(['ward_no', 'mapped_cause']).size().reset_index(name='population')
    
    logger.info(f"Transformed data into {len(cause_counts)} ward-wise disability cause records")
    return cause_counts

def create_insert_data(ward_number, disability_cause, population):
    """Create a data dictionary for insertion specific to disability cause data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'disability_cause': disability_cause,
        'population': int(population),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to disability cause data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, disability_cause, population, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['disability_cause']}',
        {data['population']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_disability_cause table if it doesn't exist."""
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
            disability_cause TEXT NOT NULL,
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

def load_disability_cause_data(df, target_conn, generate_sql=True):
    """Load the transformed disability cause data into the target database."""
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
            disability_cause=row['mapped_cause'],
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

def process_ward_wise_disability_cause(source_conn, target_conn, generate_sql=True):
    """Process ward-wise disability cause data from extraction to loading."""
    logger.info("Processing ward-wise disability cause data")
    
    try:
        # Extract data
        df = extract_disability_cause_data(source_conn)
        
        # Transform data
        transformed_df = transform_disability_cause_data(df)
        
        # Load data
        load_disability_cause_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise disability cause data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise disability cause data: {e}")
        return False