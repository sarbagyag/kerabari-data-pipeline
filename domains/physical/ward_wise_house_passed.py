import pandas as pd
import logging
import os
import ast
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import PHYSICAL_SQL_DIR

#setting up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s-%(name)-%(levelname)s-%(message)s'
)

logger=logging.getLogger(__name__)

#Targe table name definition
TARGET_TABLE = 'acme_ward_wise_house_map_passed'

def extract_house_passed_data(source_conn):
    """Extracts house passed data from the database."""
    logger.info("Extracting house passed data now")

    query="""
    SELECT
        tmp_ward_number,
        is_house_passed,
        is_map_archived
    FROM
        survey_kerabari_buildings
    ORDER BY
        tmp_ward_number,
        is_house_passed,
        is_map_archived
    """

    #Execute the query
    df=execute_query(source_conn,query)
    logger.info(f"Extracted {len(df)} rows of house passed data")
    return df

def transform_house_passed_data(df):
    logger.info("Transforming house passed data now")

    # Create a new DataFrame for the transformed data
    transformed_df = pd.DataFrame()

    # Group by ward_no and count statuses
    result = df.groupby('ward_no').apply(lambda x: {
        'PASSED': sum((x['is_house_passed'] == 'छ') & (x['is_map_archived'] == 'छ')),
        'ARCHIVED': sum((x['is_house_passed'] == 'छैन') & (x['is_map_archived'] == 'छ')),
        'NEITHER_PASSED_NOR_ARCHIVED': sum((x['is_house_passed'] == 'छैन') & (x['is_map_archived'] == 'छैन'))
    }).reset_index()

    # Prepare data for the new format
    transformed_data = []
    
    for _, row in result.iterrows():
        ward_no = row['ward_no']
        status_dict = row[0]
        
        # Create a row for each status type
        for status_type, count in status_dict.items():
            if count > 0:  # Only include statuses with households
                transformed_data.append({
                    'id': generate_uuid(),
                    'ward_number': ward_no,
                    'map_passed_status': status_type,
                    'households': count,
                    'created_at': get_current_timestamp(),
                    'updated_at': get_current_timestamp()
                })
    
    transformed_df = pd.DataFrame(transformed_data)
    
    logger.info(f"Transformed data into {len(transformed_df)} status-wise rows")
    return transformed_df

def create_insert_data(ward_number, map_passed_status, households):
    """Create a data dictionary for insertion specific to house passed data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'map_passed_status': map_passed_status,
        'households': int(households),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to house passed data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, map_passed_status, households, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['map_passed_status']}',
        {data['households']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_house_map_passed table if it doesn't exist."""
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
            map_passed_status VARCHAR(100) NOT NULL,
            households INTEGER NOT NULL,
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

def load_house_passed_data(df, target_conn, generate_sql=True):
    """Load the transformed house passed data into the target database."""
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
            ward_number=row['ward_number'],
            map_passed_status=row['map_passed_status'],
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
        sql_file_path = os.path.join(PHYSICAL_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
        logger.info(f"SQL file generated at {sql_file_path}")
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_ward_wise_house_passed(source_conn, target_conn,generate_sql=True):
    logger.info("Processing ward wise house passed data now")

    try:
        df=extract_house_passed_data(source_conn)

        #transform the data
        transformed_df=transform_house_passed_data(df)

        #load_the_data
        load_house_passed_data(transformed_df, target_conn, generate_sql)
    
        logger.info("Completed processing ward wise house passed data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward wise house passed data: {e}")
        return False
