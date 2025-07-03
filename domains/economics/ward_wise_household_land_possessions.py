import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import ECONOMICS_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_ward_wise_household_land_possessions"

def create_insert_data(ward_number, households):
    """
    Create a data dictionary for insertion specific to household land possessions.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'households': int(households),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to household land possessions.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, households, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        {data['households']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_household_land_possessions table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE {TARGET_TABLE} (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL,
            households INTEGER NOT NULL DEFAULT 0 CHECK (households >= 0),
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

def extract_land_possession_data(source_conn):
    """Extract household land possession data from source database."""
    logger.info("Extracting household land possession data")
    
    # Query to get ward and count of households with private land ownership
    # Check if land_ownership contains 'निजी' in case it's an array
    query = """
    SELECT 
        tmp_ward_number, 
        COUNT(*) as households
    FROM 
        synthetic_survey_kerabari_building
    WHERE 
        land_ownership IS NOT NULL
        AND (
            land_ownership = 'निजी' 
            OR (
                -- Handle case where land_ownership is an array
                land_ownership::text LIKE '%निजी%'
            )
        )
    GROUP BY 
        tmp_ward_number
    ORDER BY 
        tmp_ward_number;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted household land possession data for {len(df)} wards with {df['households'].sum()} total households")
    
    return df

def transform_land_possession_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming household land possession data")
    
    # Ensure tmp_ward_number is integer type
    df['tmp_ward_number'] = df['tmp_ward_number'].astype(int)
    
    # Ensure households is integer type
    df['households'] = df['households'].astype(int)
    
    logger.info(f"Transformed household land possession data for {len(df)} wards")
    
    return df

def load_land_possession_data(df, target_conn, generate_sql=True):
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
            ward_number=row['tmp_ward_number'],
            households=row['households']
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
        sql_file_path = os.path.join(ECONOMICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_household_land_possessions(source_conn, target_conn, generate_sql=True):
    """Process ward-wise household land possessions data from extraction to loading."""
    logger.info("Processing ward-wise household land possessions data")
    
    try:
        # Extract data
        df = extract_land_possession_data(source_conn)
        
        # Transform data
        transformed_df = transform_land_possession_data(df)
        
        # Load data
        load_land_possession_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise household land possessions data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise household land possessions data: {e}")
        return False
