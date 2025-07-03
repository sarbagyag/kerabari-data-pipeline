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

# Disability status mappings
DISABILITY_MAPPING = {
    'छ': True,
    'छैन': False,
    
    # English variants
    'yes': True,
    'no': False,
    
    # Handle nulls and empty strings
    None: False,
    '': False
}

TARGET_TABLE = 'acme_ward_wise_disabled_population'

def has_disability(disability_status):
    """Map disability status values to boolean."""
    if not disability_status or pd.isna(disability_status):
        return False
    
    # Try direct mapping
    mapped_value = DISABILITY_MAPPING.get(disability_status)
    if mapped_value is not None:
        return mapped_value
    
    # Try lowercase matching
    disability_status_lower = str(disability_status).lower().strip()
    if disability_status_lower in ['छ', 'yes', 'true', '1']:
        return True
    
    # Default
    return False

def extract_disability_data(source_conn):
    """Extracts disability data from the database."""
    logger.info("Extracting disability data now")

    query = """
    SELECT
        ward_no,
        is_disabled AS disability_status 
    FROM
        synthetic_survey_kerabari_individual
    WHERE
        is_disabled IS NOT NULL
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of disability data")
    return df

def transform_disability_data(df):
    logger.info("Transforming disability data now")

    # Ensure ward_no is integer type
    df['ward_no'] = pd.to_numeric(df['ward_no'], errors='coerce').fillna(0).astype(int)
    
    # Map disability status to boolean
    df['has_disability'] = df['disability_status'].apply(has_disability)
    
    # Group by ward and count disabled persons
    disabled_counts = df[df['has_disability']].groupby('ward_no').size().reset_index(name='disabled_population')
    
    # Make sure all wards are included (even those with zero disabled population)
    all_wards = pd.DataFrame({'ward_no': df['ward_no'].unique()})
    result_df = all_wards.merge(disabled_counts, on='ward_no', how='left').fillna(0)
    result_df['disabled_population'] = result_df['disabled_population'].astype(int)
    
    # Sort by ward number
    result_df = result_df.sort_values('ward_no')
    
    logger.info(f"Transformed data into {len(result_df)} ward-wise disability records")
    return result_df

def create_insert_data(ward_number, disabled_population):
    """Create a data dictionary for insertion specific to disability data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'disabled_population': int(disabled_population),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to disability data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, disabled_population, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        {data['disabled_population']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_disabled_population table if it doesn't exist."""
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
            disabled_population INTEGER NOT NULL,
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

def load_disability_data(df, target_conn, generate_sql=True):
    """Load the transformed disability data into the target database."""
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
            disabled_population=row['disabled_population']
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

def process_ward_wise_disabled_population(source_conn, target_conn, generate_sql=True):
    """Process ward-wise disabled population data from extraction to loading."""
    logger.info("Processing ward-wise disabled population data")
    
    try:
        # Extract data
        df = extract_disability_data(source_conn)
        
        # Transform data
        transformed_df = transform_disability_data(df)
        
        # Load data
        load_disability_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise disabled population data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise disabled population data: {e}")
        return False
