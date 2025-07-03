import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import PHYSICAL_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Base type mappings
BASE_TYPE_MAPPING = {
    'ढलान पिल्लरसहितको': 'CONCRETE_PILLAR',
    'सिमेन्टको जोडाइ भएको इँटा/ढुङ्गा': 'CEMENT_JOINED',
    'माटोको जोडाइ भएको इँटा/ढुङ्गा': 'MUD_JOINED',
    'काठको खम्बा गाडेको': 'WOOD_POLE',
    'अन्य (खुलाउने)': 'OTHER',

    # English variants
    'concrete pillar': 'CONCRETE_PILLAR',
    'cement joined': 'CEMENT_JOINED',
    'mud joined': 'MUD_JOINED',
    'wooden pole': 'WOOD_POLE',
    'wood pole': 'WOOD_POLE',
    'other': 'OTHER',
    
    # Handle nulls and empty strings
    None: 'OTHER',
    '': 'OTHER'
}

TARGET_TABLE = 'acme_ward_wise_household_base'

def map_base_type(base_type):
    """Map base type values to standardized enum values."""
    if not base_type or pd.isna(base_type):
        return "OTHER"
    
    # Try direct mapping
    standardized = BASE_TYPE_MAPPING.get(base_type)
    if standardized:
        return standardized
    
    # Try lowercase matching
    base_type_lower = str(base_type).lower().strip()
    for key, value in BASE_TYPE_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == base_type_lower:
            return value
    
    # Default
    logger.warning(f"Base type '{base_type}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def extract_household_base_data(source_conn):
    """Extracts household base data from the database."""
    logger.info("Extracting household base data now")

    query = """
    SELECT
        ward_id,
        base,
        COUNT(*) as households
    FROM
        synthetic_survey_kerabari_building
    WHERE
        base IS NOT NULL
        AND ward_id IS NOT NULL
    GROUP BY
        ward_id, base
    ORDER BY
        ward_id, base
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of household base data")
    return df

def transform_household_base_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming household base data now")

    # Validate input DataFrame
    if df is None or df.empty:
        logger.warning("No data to transform")
        return pd.DataFrame()

    # Ensure required columns exist
    required_columns = ['ward_id', 'base', 'households']
    missing_columns = [col for col in required_columns if col not in df.columns]
    if missing_columns:
        logger.error(f"Missing required columns: {missing_columns}")
        return pd.DataFrame()

    # Remove rows with null values in required columns
    df = df.dropna(subset=required_columns)
    
    if df.empty:
        logger.warning("No valid data after removing null values")
        return pd.DataFrame()

    # Rename ward_id to ward_no for consistency
    df = df.rename(columns={'ward_id': 'ward_no'})
    
    # Ensure ward_no is integer type - handle NA/inf values
    df['ward_no'] = pd.to_numeric(df['ward_no'], errors='coerce')
    df = df.dropna(subset=['ward_no'])
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map base types to standardized values
    df['base_type_mapped'] = df['base'].apply(map_base_type)
    
    # Ensure households is integer type - handle NA/inf values
    df['households'] = pd.to_numeric(df['households'], errors='coerce')
    df = df.dropna(subset=['households'])
    df['households'] = df['households'].astype(int)
    
    # Remove rows with invalid data
    df = df.dropna(subset=['ward_no', 'base_type_mapped', 'households'])
    
    if df.empty:
        logger.warning("No valid data after type conversion")
        return pd.DataFrame()
    
    # Group by ward and mapped base type to sum households
    grouped_df = df.groupby(['ward_no', 'base_type_mapped'])['households'].sum().reset_index()
    
    logger.info(f"Transformed data into {len(grouped_df)} ward-base type combinations")
    return grouped_df

def create_insert_data(ward_number, base_type, households):
    """Create a data dictionary for insertion specific to household base data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'base_type': base_type,
        'households': int(households),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to household base data."""
    # Escape single quotes in string values
    def escape_sql_string(value):
        if value is None:
            return "NULL"
        if isinstance(value, str):
            return f"'{value.replace("'", "''")}'"
        return str(value)
    
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, base_type, households, created_at, updated_at)
    VALUES (
        {escape_sql_string(data['id'])},
        {data['ward_number']},
        {escape_sql_string(data['base_type'])},
        {data['households']},
        {escape_sql_string(data['created_at'])},
        {escape_sql_string(data['updated_at'])}
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_household_base table if it doesn't exist."""
    return f"""
-- Set UTF-8 encoding for this script
SET client_encoding = 'UTF8';

-- Create base_type enum type if not exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'base_type') THEN
        CREATE TYPE base_type AS ENUM ('CONCRETE_PILLAR', 'CEMENT_JOINED', 'MUD_JOINED', 'WOOD_POLE', 'OTHER');
    END IF;
END
$$;

-- Create {TARGET_TABLE} table if not exists
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE {TARGET_TABLE} (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            base_type base_type NOT NULL,
            households INTEGER NOT NULL DEFAULT 0,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
        
        -- Create index for faster lookups by ward number and base type
        CREATE INDEX idx_{TARGET_TABLE}_ward_base ON {TARGET_TABLE}(ward_number, base_type);
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

def load_household_base_data(df, target_conn, generate_sql=True):
    """Load the transformed household base data into the target database."""
    logger.info(f"Loading data into {TARGET_TABLE}")

    # Validate input DataFrame
    if df is None or df.empty:
        logger.warning("No data to load")
        return False

    # Check if table exists and has data
    if table_exists(target_conn, TARGET_TABLE) and table_has_data(target_conn, TARGET_TABLE):
        logger.info(f"Table {TARGET_TABLE} already exists and has data. Skipping insertion.")
        return True  # Return True since this is a successful state

    # Prepare insert data and statements
    insert_data = []
    insert_statements = []

    for _, row in df.iterrows():
        try:
            # Create data dictionary
            data = create_insert_data(
                ward_number=row['ward_no'],
                base_type=row['base_type_mapped'],
                households=row['households']
            )
            insert_data.append(data)
            
            # Generate SQL statement
            statement = generate_insert_statement(data)
            insert_statements.append(statement)
        except Exception as e:
            logger.error(f"Error processing row {row}: {e}")
            continue

    if not insert_statements:
        logger.warning("No valid insert statements generated")
        return False

    # Save SQL to file if requested
    if generate_sql:
        try:
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
        except Exception as e:
            logger.error(f"Error saving SQL file: {e}")
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_ward_wise_household_base(source_conn, target_conn, generate_sql=True):
    """Process ward-wise household base data from extraction to loading."""
    logger.info("Processing ward-wise household base data")
    
    try:
        # Extract data
        df = extract_household_base_data(source_conn)
        
        if df is None or df.empty:
            logger.warning("No data extracted from source")
            return False
        
        # Transform data
        transformed_df = transform_household_base_data(df)
        
        if transformed_df.empty:
            logger.warning("No data after transformation")
            return False
        
        # Load data
        success = load_household_base_data(transformed_df, target_conn, generate_sql)
        
        if success:
            logger.info("Completed processing ward-wise household base data")
        else:
            logger.error("Failed to load ward-wise household base data")
        
        return success
    except Exception as e:
        logger.error(f"Error processing ward-wise household base data: {e}")
        return False