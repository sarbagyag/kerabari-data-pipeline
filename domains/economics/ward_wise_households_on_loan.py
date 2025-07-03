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
TARGET_TABLE = "acme_ward_wise_households_on_loan"

def create_insert_data(ward_number, households):
    """
    Create a data dictionary for insertion specific to households on loan.
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
    Generate an SQL insert statement from a data dictionary specific to households on loan.
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
    Generate SQL to create the ward_wise_households_on_loan table if it doesn't exist.
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

def extract_households_on_loan_data(source_conn):
    """Extract households on loan data from source database."""
    logger.info("Extracting households on loan data")
    
    # Query to get ward and count of households with loan
    query = """
    SELECT 
        ward_no, 
        COUNT(*) as households
    FROM 
        synthetic_survey_kerabari_family
    WHERE 
        loaned_organizations IS NOT NULL 
        AND NOT ('ऋण नलिएको' = ANY(loaned_organizations))
    GROUP BY 
        ward_no
    ORDER BY 
        ward_no;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted households on loan data for {len(df)} wards")
    
    return df

def transform_households_on_loan_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming households on loan data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Ensure households is integer type
    df['households'] = df['households'].astype(int)
    
    logger.info(f"Transformed households on loan data for {len(df)} wards")
    
    return df

def load_households_on_loan_data(df, target_conn, generate_sql=True):
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

def process_households_on_loan(source_conn, target_conn, generate_sql=True):
    """Process ward-wise households on loan data from extraction to loading."""
    logger.info("Processing ward-wise households on loan data")
    
    try:
        # Extract data
        df = extract_households_on_loan_data(source_conn)
        
        # Transform data
        transformed_df = transform_households_on_loan_data(df)
        
        # Load data
        load_households_on_loan_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise households on loan data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise households on loan data: {e}")
        return False
