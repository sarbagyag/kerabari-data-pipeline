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
TARGET_TABLE = "acme_ward_wise_households_in_agriculture"

def create_insert_data(ward_number, involved_in_agriculture, non_involved_in_agriculture):
    """
    Create a data dictionary for insertion.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'involved_in_agriculture': int(involved_in_agriculture),
        'non_involved_in_agriculture': int(non_involved_in_agriculture),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, involved_in_agriculture, non_involved_in_agriculture, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        {data['involved_in_agriculture']},
        {data['non_involved_in_agriculture']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the table if it doesn't exist.
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
            involved_in_agriculture INTEGER NOT NULL CHECK (involved_in_agriculture >= 0),
            non_involved_in_agriculture INTEGER NOT NULL CHECK (non_involved_in_agriculture >= 0),
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

def extract_agricultural_households_data(source_conn):
    """Extract agricultural households data from source database."""
    logger.info("Extracting agricultural households data")
    
    # Query to get unique families per ward involved in agriculture
    agricultural_query = """
    SELECT 
        ward_no,
        family_id
    FROM 
        kerabari_agricultural_land
    WHERE 
        ward_no IS NOT NULL AND family_id IS NOT NULL;
    """
    
    # Query to get total households per ward from synthetic_survey_kerabari_family
    total_households_query = """
    SELECT 
        ward_no,
        COUNT(DISTINCT id) as total_households
    FROM 
        staging_kerabari_family
    WHERE 
        ward_no IS NOT NULL AND id IS NOT NULL
    GROUP BY ward_no;
    """
    
    # Execute the queries
    agricultural_df = execute_query(source_conn, agricultural_query)
    total_households_df = execute_query(source_conn, total_households_query)
    logger.info(f"Extracted {len(agricultural_df)} agricultural land records")
    logger.info(f"Extracted total households data for {len(total_households_df)} wards")
    
    return agricultural_df, total_households_df

def transform_agricultural_households_data(agricultural_df, total_households_df):
    """Transform the extracted data to count involved and non-involved households per ward."""
    logger.info("Transforming agricultural households data")
    
    # Count unique families per ward involved in agriculture
    involved_df = agricultural_df.groupby('ward_no')['family_id'].nunique().reset_index()
    involved_df.columns = ['ward_no', 'involved_in_agriculture']
    
    # Merge with total households data
    merged_df = total_households_df.merge(involved_df, on='ward_no', how='left')
    
    # Fill NaN values with 0 for wards with no agricultural involvement
    merged_df['involved_in_agriculture'] = merged_df['involved_in_agriculture'].fillna(0).astype(int)
    
    # Calculate non-involved households per ward
    merged_df['non_involved_in_agriculture'] = merged_df['total_households'] - merged_df['involved_in_agriculture']
    
    # Select only the required columns
    transformed_df = merged_df[['ward_no', 'involved_in_agriculture', 'non_involved_in_agriculture']].copy()
    
    logger.info(f"Transformed into {len(transformed_df)} ward-wise household counts")
    logger.info(f"Total involved households: {transformed_df['involved_in_agriculture'].sum()}")
    logger.info(f"Total non-involved households: {transformed_df['non_involved_in_agriculture'].sum()}")
    
    return transformed_df

def load_agricultural_households_data(df, target_conn, generate_sql=True):
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
            involved_in_agriculture=row['involved_in_agriculture'],
            non_involved_in_agriculture=row['non_involved_in_agriculture']
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

def process_agricultural_households(source_conn, target_conn, generate_sql=True):
    """Process ward-wise households in agriculture data from extraction to loading."""
    logger.info("Processing ward-wise households in agriculture data")
    
    try:
        # Extract data
        agricultural_df, total_households_df = extract_agricultural_households_data(source_conn)
        
        # Transform data
        transformed_df = transform_agricultural_households_data(agricultural_df, total_households_df)
        
        # Load data
        load_agricultural_households_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise households in agriculture data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise households in agriculture data: {e}")
        return False
