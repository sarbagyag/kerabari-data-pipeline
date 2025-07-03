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

# Toilet type mappings
TOILET_TYPE_MAPPING = {
    'फ्लस भएको (सेप्टिक ट्याङ्क)': 'FLUSH_WITH_SEPTIC_TANK',
    'साधारण': 'NORMAL',
    'सार्वजनिक': 'PUBLIC_EILANI',
    'चर्पी नभएको': 'NO_TOILET',
    'अन्य (खुलाउने)': 'OTHER',

    # English variants
    'flush with septic tank': 'FLUSH_WITH_SEPTIC_TANK',
    'normal': 'NORMAL',
    'public': 'PUBLIC_EILANI',
    'no toilet': 'NO_TOILET',
    'other': 'OTHER',
    
    # Handle nulls and empty strings
    None: 'NO_TOILET',
    '': 'NO_TOILET'
}

TARGET_TABLE = 'acme_ward_wise_toilet_type'

def map_toilet_type(toilet_type):
    """Map toilet type values to standardized enum values."""
    if not toilet_type or pd.isna(toilet_type):
        return "NO_TOILET"
    
    # Try direct mapping
    standardized = TOILET_TYPE_MAPPING.get(toilet_type)
    if standardized:
        return standardized
    
    # Try lowercase matching
    toilet_type_lower = str(toilet_type).lower().strip()
    for key, value in TOILET_TYPE_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == toilet_type_lower:
            return value
    
    # Default
    logger.warning(f"Toilet type '{toilet_type}' not found in mapping. Using 'NO_TOILET' as default.")
    return "NO_TOILET"

def extract_toilet_type_data(source_conn):
    """Extracts toilet type data from the database."""
    logger.info("Extracting toilet type data now")

    query="""
    SELECT
        ward_no,
        toilet_type,
        COUNT(*) as households
    FROM
        synthetic_survey_kerabari_family
    WHERE
        toilet_type IS NOT NULL
    GROUP BY
        ward_no, toilet_type
    ORDER BY
        ward_no, toilet_type
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of toilet type data")
    return df

def transform_toilet_type_data(df):
    logger.info("Transforming toilet type data now")

    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map toilet types to standardized values
    df['toilet_type_mapped'] = df['toilet_type'].apply(map_toilet_type)
    
    # Ensure households is integer type
    df['households'] = df['households'].astype(int)
    
    # Group by ward and mapped toilet type to sum households
    grouped_df = df.groupby(['ward_no', 'toilet_type_mapped'])['households'].sum().reset_index()
    
    logger.info(f"Transformed data into {len(grouped_df)} ward-toilet type combinations")
    return grouped_df

def create_insert_data(ward_number, toilet_type, households):
    """Create a data dictionary for insertion specific to toilet type data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'toilet_type': toilet_type,
        'households': int(households),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to toilet type data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, toilet_type, households, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['toilet_type']}',
        {data['households']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_toilet_type table if it doesn't exist."""
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
            toilet_type VARCHAR(100) NOT NULL,
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

def load_toilet_type_data(df, target_conn, generate_sql=True):
    """Load the transformed toilet type data into the target database."""
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
            toilet_type=row['toilet_type_mapped'],
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
        sql_file_path = os.path.join(SOCIAL_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
        logger.info(f"SQL file generated at {sql_file_path}")
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_ward_wise_toilet_type(source_conn, target_conn, generate_sql=True):
    """Process ward-wise toilet type data from extraction to loading."""
    logger.info("Processing ward-wise toilet type data")
    
    try:
        # Extract data
        df = extract_toilet_type_data(source_conn)
        
        # Transform data
        transformed_df = transform_toilet_type_data(df)
        
        # Load data
        load_toilet_type_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise toilet type data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise toilet type data: {e}")
        return False