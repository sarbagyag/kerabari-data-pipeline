import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import PHYSICAL_SQL_DIR

# Setting up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'   
)

logger = logging.getLogger(__name__)

# Road status type mappings
ROAD_STATUS_TYPE_MAPPING = {
    'कालोपत्रे/पक्की ढलान सडक': 'BLACK_TOPPED',
    'ग्राभेल सडक': 'GRAVELED',
    'धुले (कच्ची) सडक': 'DIRT',
    'गोरेटो बाटो': 'GORETO',
    'अन्य ': 'OTHER',

    # English variants
    'black topped': 'BLACK_TOPPED',
    'graveled': 'GRAVELED',
    'dirt': 'DIRT',
    'goreto': 'GORETO',
    'other': 'OTHER',
    
    # Handle nulls and empty strings
    None: 'OTHER',
    '': 'OTHER'
}

TARGET_TABLE = 'acme_ward_wise_road_status'

def map_road_status(road_status):
    """Map road status values to standardized enum values."""
    if not road_status or pd.isna(road_status):
        return "OTHER"
    
    # Try direct mapping
    standardized = ROAD_STATUS_TYPE_MAPPING.get(road_status)
    if standardized:
        return standardized
    
    # Try lowercase matching
    road_status_lower = str(road_status).lower().strip()
    for key, value in ROAD_STATUS_TYPE_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == road_status_lower:
            return value
    
    # Default
    logger.warning(f"Road status '{road_status}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def extract_road_status_data(source_conn):
    """Extracts road status data from the database."""
    logger.info("Extracting road status data now")

    query="""
    SELECT
        tmp_ward_number,
        road_status,
        COUNT(*) as households
    FROM
        synthetic_survey_kerabari_building
    WHERE
        road_status IS NOT NULL
    GROUP BY
        tmp_ward_number, road_status
    ORDER BY
        tmp_ward_number, road_status
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of road status data")
    return df

def transform_road_status_data(df):
    logger.info("Transforming road status data now")

    # Ensure tmp_ward_number is integer type
    df['tmp_ward_number'] = df['tmp_ward_number'].astype(int)
    
    # Map road status to standardized values
    df['road_status_mapped'] = df['road_status'].apply(map_road_status)
    
    # Ensure households is integer type
    df['households'] = df['households'].astype(int)
    
    # Group by ward and mapped road status to sum households
    grouped_df = df.groupby(['tmp_ward_number', 'road_status_mapped'])['households'].sum().reset_index()
    
    logger.info(f"Transformed data into {len(grouped_df)} ward-road status combinations")
    return grouped_df

def create_insert_data(ward_number, road_status, households):
    """Create a data dictionary for insertion specific to road status data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'road_status': road_status,
        'households': int(households),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to road status data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, road_status, households, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['road_status']}',
        {data['households']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_road_status table if it doesn't exist."""
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
            road_status VARCHAR(100) NOT NULL,
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

def load_road_status_data(df, target_conn, generate_sql=True):
    """Load the transformed road status data into the target database."""
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
            ward_number=row['tmp_ward_number'],
            road_status=row['road_status_mapped'],
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

def process_ward_wise_road_status(source_conn, target_conn, generate_sql=True):
    """Process ward-wise road status data from extraction to loading."""
    logger.info("Processing ward-wise road status data")
    
    try:
        # Extract data
        df = extract_road_status_data(source_conn)
        
        # Transform data
        transformed_df = transform_road_status_data(df)
        
        # Load data
        load_road_status_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise road status data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise road status data: {e}")
        return False
