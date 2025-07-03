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

# Roof type mappings
ROOF_TYPE_MAPPING = {
    'सिमेन्ट ढलान': 'CEMENT',
    'जस्ता/टिन': 'TIN',
    'टायल/खपडा/झिँगटी': 'TILE',
    'खर/पराल/छ्वाली': 'STRAW',
    'काठ/फल्याक': 'WOOD',
    'ढुङ्गा/स्लेट': 'STONE',
    'अन्य (खुलाउने)': 'OTHER',

    # English variants
    'cement': 'CEMENT',
    'tin': 'TIN',
    'tile': 'TILE',
    'straw': 'STRAW',
    'wood': 'WOOD',
    'stone': 'STONE',
    'other': 'OTHER',
    
    # Handle nulls and empty strings
    None: 'OTHER',
    '': 'OTHER'
}

TARGET_TABLE = 'acme_ward_wise_household_roof'

def map_roof_type(roof_type):
    """Map roof type values to standardized enum values."""
    if not roof_type or pd.isna(roof_type):
        return "OTHER"
    
    # Try direct mapping
    standardized = ROOF_TYPE_MAPPING.get(roof_type)
    if standardized:
        return standardized
    
    # Try lowercase matching
    roof_type_lower = str(roof_type).lower().strip()
    for key, value in ROOF_TYPE_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == roof_type_lower:
            return value
    
    # Default
    logger.warning(f"Roof type '{roof_type}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def extract_household_roof_data(source_conn):
    """Extracts household roof data from the database."""
    logger.info("Extracting household roof data now")

    query="""
    SELECT
        tmp_ward_number,
        roof,
        COUNT(*) as households
    FROM
        synthetic_survey_kerabari_building
    WHERE
        roof IS NOT NULL
    GROUP BY
        tmp_ward_number, roof
    ORDER BY
        tmp_ward_number, roof
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of household roof data")
    return df

def transform_household_roof_data(df):
    logger.info("Transforming household roof data now")

    # Ensure tmp_ward_number is integer type
    df['tmp_ward_number'] = df['tmp_ward_number'].astype(int)
    
    # Map roof types to standardized values
    df['roof_type_mapped'] = df['roof'].apply(map_roof_type)
    
    # Ensure households is integer type
    df['households'] = df['households'].astype(int)
    
    # Group by ward and mapped roof type to sum households
    grouped_df = df.groupby(['tmp_ward_number', 'roof_type_mapped'])['households'].sum().reset_index()
    
    logger.info(f"Transformed data into {len(grouped_df)} ward-roof type combinations")
    return grouped_df

def create_insert_data(ward_number, roof_type, households):
    """Create a data dictionary for insertion specific to household roof data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'roof_type': roof_type,
        'households': int(households),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to household roof data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, roof_type, households, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['roof_type']}',
        {data['households']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_household_roof table if it doesn't exist."""
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
            roof_type VARCHAR(100) NOT NULL,
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

def load_household_roof_data(df, target_conn, generate_sql=True):
    """Load the transformed household roof data into the target database."""
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
            roof_type=row['roof_type_mapped'],
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

def process_ward_wise_household_roof(source_conn, target_conn, generate_sql=True):
    """Process ward-wise household roof data from extraction to loading."""
    logger.info("Processing ward-wise household roof data")
    
    try:
        # Extract data
        df = extract_household_roof_data(source_conn)
        
        # Transform data
        transformed_df = transform_household_roof_data(df)
        
        # Load data
        load_household_roof_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise household roof data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise household roof data: {e}")
        return False
