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

# Time to financial institution mappings
TIME_TO_FINANCIAL_ORG_MAPPING = {
    '१५ मिनेटभित्र': 'UNDER_15_MIN',
    '३० मिनेटभित्र': 'UNDER_30_MIN',
    '१ घण्टाभित्र': 'UNDER_1_HOUR',
    '१ घण्टाभन्दा बढी ': '1_HOUR_OR_MORE',

    # English variants
    'under 15 min': 'UNDER_15_MIN',
    'under 30 min': 'UNDER_30_MIN',
    'under 1 hour': 'UNDER_1_HOUR',
    '1 hour or more': '1_HOUR_OR_MORE',
    
    # Handle nulls and empty strings
    None: 'UNDER_15_MIN',
    '': 'UNDER_15_MIN'
}

TARGET_TABLE = 'ward_wise_time_to_financial_organization'

def map_time_to_financial_org(time_value):
    """Map time to financial organization values to standardized enum values."""
    if not time_value or pd.isna(time_value):
        return "UNDER_15_MIN"  # Default assumption
    
    # Try direct mapping
    standardized = TIME_TO_FINANCIAL_ORG_MAPPING.get(time_value)
    if standardized:
        return standardized
    
    # Try lowercase matching
    time_value_lower = str(time_value).lower().strip()
    for key, value in TIME_TO_FINANCIAL_ORG_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == time_value_lower:
            return value
    
    # Default
    logger.warning(f"Time value '{time_value}' not found in mapping. Using 'UNDER_15_MIN' as default.")
    return "UNDER_15_MIN"

def extract_time_to_financial_org_data(source_conn):
    """Extracts time to financial organization data from the database."""
    logger.info("Extracting time to financial organization data now")

    query="""
    SELECT
        ward_number,
        time_to_financial_organization,
        COUNT(*) as households
    FROM
        staging_kerabari_buildings
    WHERE
        time_to_financial_organization IS NOT NULL
    GROUP BY
        ward_number, time_to_financial_organization
    ORDER BY
        ward_number, time_to_financial_organization
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of time to financial organization data")
    return df

def transform_time_to_financial_org_data(df):
    logger.info("Transforming time to financial organization data now")

    # Ensure ward_number is integer type
    df['ward_number'] = df['ward_number'].astype(int)
    
    # Map time values to standardized values
    df['time_mapped'] = df['time_to_financial_organization'].apply(map_time_to_financial_org)
    
    # Ensure households is integer type
    df['households'] = df['households'].astype(int)
    
    # Group by ward and mapped time value to sum households
    grouped_df = df.groupby(['ward_number', 'time_mapped'])['households'].sum().reset_index()
    
    logger.info(f"Transformed data into {len(grouped_df)} ward-time combinations")
    return grouped_df

def create_insert_data(ward_number, time_value, households):
    """Create a data dictionary for insertion specific to time to financial organization data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'time_to_financial_organization_type': time_value,
        'households': int(households),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to time to financial organization data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, time_to_financial_organization_type, households, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['time_to_financial_organization_type']}'::time_to_financial_organization_type_enum,
        {data['households']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_time_to_financial_organization table if it doesn't exist."""
    return f"""
-- Create enum type if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'time_to_financial_organization_type_enum') THEN
        CREATE TYPE time_to_financial_organization_type_enum AS ENUM (
            'UNDER_15_MIN',
            'UNDER_30_MIN', 
            'UNDER_1_HOUR',
            '1_HOUR_OR_MORE'
        );
    END IF;
END
$$;

-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE {TARGET_TABLE} (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            time_to_financial_organization_type time_to_financial_organization_type_enum NOT NULL,
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

def load_time_to_financial_org_data(df, target_conn, generate_sql=True):
    """Load the transformed time to financial organization data into the target database."""
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
            time_value=row['time_mapped'],
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

def process_ward_wise_time_to_financial_org(source_conn, target_conn, generate_sql=True):
    """Process ward-wise time to financial organization data from extraction to loading."""
    logger.info("Processing ward-wise time to financial organization data")
    
    try:
        # Extract data
        df = extract_time_to_financial_org_data(source_conn)
        
        # Transform data
        transformed_df = transform_time_to_financial_org_data(df)
        
        # Load data
        load_time_to_financial_org_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise time to financial organization data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise time to financial organization data: {e}")
        return False
