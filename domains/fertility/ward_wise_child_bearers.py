import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import FERTILITY_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_ward_wise_child_bearers"

def create_insert_data(ward_number, child_bearers_count):
    """
    Create a data dictionary for insertion specific to child bearers.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'age_15_to_49_child_bearers': int(child_bearers_count),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to child bearers.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, age_15_to_49_child_bearers, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        {data['age_15_to_49_child_bearers']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_child_bearers table if it doesn't exist.
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
            ward_number INTEGER NOT NULL UNIQUE,
            age_15_to_49_child_bearers INTEGER NOT NULL,
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

def extract_child_bearers_data(source_conn):
    """Extract child bearers data from source database."""
    logger.info("Extracting child bearers data")
    
    # Query to get count of women aged 15-49 who have given birth, by ward
    query = """
    SELECT 
        ward_no,
        COUNT(*) as child_bearers_count
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        gender = 'महिला' AND
        age BETWEEN 15 AND 49 AND
        gave_live_birth = 'छ'
    GROUP BY 
        ward_no
    ORDER BY 
        ward_no;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted child bearers data for {len(df)} wards")
    
    return df

def transform_child_bearers_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming child bearers data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Ensure child_bearers_count is integer type
    df['child_bearers_count'] = df['child_bearers_count'].astype(int)
    
    logger.info(f"Transformed child bearers data with {len(df)} ward combinations")
    
    return df

def load_child_bearers_data(df, target_conn, generate_sql=True):
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
            child_bearers_count=row['child_bearers_count']
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
        sql_file_path = os.path.join(FERTILITY_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_child_bearers(source_conn, target_conn, generate_sql=True):
    """Process ward-wise child bearers data from extraction to loading."""
    logger.info("Processing ward-wise child bearers data")
    
    try:
        # Extract data
        df = extract_child_bearers_data(source_conn)
        
        # Transform data
        transformed_df = transform_child_bearers_data(df)
        
        # Load data
        load_child_bearers_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise child bearers data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise child bearers data: {e}")
        return False
