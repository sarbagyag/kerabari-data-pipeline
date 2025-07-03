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

# Water purification method mappings
WATER_PURIFICATION_MAPPING = {
    'उमाल्ने': 'BOILING',
    'फिल्टर गर्ने': 'FILTERING',
    'औषधी (पियुष आदि) राख्ने': 'CHEMICAL_PIYUSH',
    'केही नगर्ने/सिधै खाने': 'NO_ANY_FILTERING',
    'अन्य विधि अपनाउने (जस्तै सोडिस)': 'OTHER',
    
    # English variants
    'boiling': 'BOILING',
    'filtering': 'FILTERING',
    'chemical piyush': 'CHEMICAL_PIYUSH',
    'no any filtering': 'NO_ANY_FILTERING',
    'other': 'OTHER',
    
    # Handle nulls and empty strings
    None: 'NO_ANY_FILTERING',
    '': 'NO_ANY_FILTERING'
}

TARGET_TABLE = 'acme_ward_wise_water_purification'

def map_water_purification(purification_method):
    """Map water purification values to standardized enum values."""
    # Check for null values properly
    if pd.isna(purification_method) or purification_method is None or purification_method == '':
        return "NO_ANY_FILTERING"
    
    # Handle array elements (in case explode didn't fully handle it)
    if isinstance(purification_method, list):
        if len(purification_method) == 0:
            return "NO_ANY_FILTERING"
        purification_method = purification_method[0]  # Take the first element
    
    # Remove any enclosing quotes and extra spaces
    if isinstance(purification_method, str):
        purification_method = purification_method.strip().strip('"\'').strip()
    
    # Try direct mapping
    standardized = WATER_PURIFICATION_MAPPING.get(purification_method)
    if standardized:
        return standardized
    
    # Try lowercase matching
    purification_method_lower = str(purification_method).lower().strip()
    for key, value in WATER_PURIFICATION_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == purification_method_lower:
            return value
    
    # Default
    logger.warning(f"Water purification method '{purification_method}' not found in mapping. Using 'NO_ANY_FILTERING' as default.")
    return "NO_ANY_FILTERING"

def extract_water_purification_data(source_conn):
    """Extracts water purification data from the database."""
    logger.info("Extracting water purification data now")

    query = """
    SELECT
        ward_no,
        water_purification_methods,
        COUNT(*) as households
    FROM
        synthetic_survey_kerabari_family
    WHERE
        water_purification_methods IS NOT NULL
        AND ward_no IS NOT NULL
    GROUP BY
        ward_no, water_purification_methods
    ORDER BY
        ward_no, water_purification_methods
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of water purification data")
    
    # Handle arrays in water_purification_methods column by exploding them
    if not df.empty and 'water_purification_methods' in df.columns:
        # Check if water_purification_methods contains arrays
        if df['water_purification_methods'].apply(lambda x: isinstance(x, list)).any():
            logger.info("Found arrays in water_purification_methods column, exploding them...")
            # Log some examples of the arrays for debugging
            array_examples = df[df['water_purification_methods'].apply(lambda x: isinstance(x, list))].head(3)
            logger.info(f"Array examples: {array_examples['water_purification_methods'].tolist()}")
            
            # Explode the water_purification_methods column to flatten arrays
            df = df.explode('water_purification_methods')
            logger.info(f"After exploding arrays: {len(df)} rows")
        else:
            logger.info("No arrays found in water_purification_methods column")
    
    return df

def transform_water_purification_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming water purification data now")

    # Handle empty dataframe
    if df.empty:
        logger.warning("No water purification data found. Returning empty dataframe.")
        return pd.DataFrame(columns=['ward_no', 'water_purification_method', 'households'])

    # Ensure ward_no is integer type
    df['ward_no'] = pd.to_numeric(df['ward_no'], errors='coerce').fillna(0).astype(int)
    
    # Map purification methods to standardized values
    df['water_purification_method'] = df['water_purification_methods'].apply(map_water_purification)
    
    # Ensure households is integer type
    df['households'] = pd.to_numeric(df['households'], errors='coerce').fillna(0).astype(int)
    
    # Group by ward and mapped purification method to sum households
    grouped_df = df.groupby(['ward_no', 'water_purification_method'])['households'].sum().reset_index()
    
    logger.info(f"Transformed data into {len(grouped_df)} ward-purification method combinations")
    return grouped_df

def create_insert_data(ward_number, purification_method, households):
    """Create a data dictionary for insertion specific to water purification data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'water_purification_method': purification_method,
        'households': int(households),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to water purification data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, water_purification_method, households, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['water_purification_method']}'::water_purification_method_type,
        {data['households']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_water_purification table if it doesn't exist."""
    return f"""
-- Drop existing enum type if it exists (to handle value changes)
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'water_purification_method_type') THEN
        -- Check if the enum has the correct values
        IF NOT EXISTS (
            SELECT 1 FROM pg_enum 
            WHERE enumtypid = (SELECT oid FROM pg_type WHERE typname = 'water_purification_method_type')
            AND enumlabel = 'BOILING'
        ) THEN
            -- Drop the table first if it exists (since it references the enum)
            DROP TABLE IF EXISTS {TARGET_TABLE} CASCADE;
            -- Drop the enum type
            DROP TYPE water_purification_method_type CASCADE;
        END IF;
    END IF;
END
$$;

-- Create enum type if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'water_purification_method_type') THEN
        CREATE TYPE water_purification_method_type AS ENUM (
            'BOILING',
            'FILTERING',
            'CHEMICAL_PIYUSH',
            'NO_ANY_FILTERING',
            'OTHER'
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
            water_purification_method water_purification_method_type NOT NULL,
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

def check_and_fix_enum_type(target_conn):
    """Check if the enum type exists with correct values and fix if needed."""
    logger.info("Checking water_purification_method_type enum...")
    
    # Check if enum exists
    check_enum_query = """
    SELECT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'water_purification_method_type'
    );
    """
    
    enum_exists = execute_query(target_conn, check_enum_query).iloc[0, 0]
    
    if enum_exists:
        # Check if it has the correct values
        check_values_query = """
        SELECT enumlabel FROM pg_enum 
        WHERE enumtypid = (SELECT oid FROM pg_type WHERE typname = 'water_purification_method_type')
        ORDER BY enumsortorder;
        """
        
        enum_values = execute_query(target_conn, check_values_query)['enumlabel'].tolist()
        expected_values = ['BOILING', 'FILTERING', 'CHEMICAL_PIYUSH', 'NO_ANY_FILTERING', 'OTHER']
        
        if enum_values != expected_values:
            logger.warning(f"Enum type exists but has wrong values: {enum_values}")
            logger.info("Expected values: {expected_values}")
            logger.info("Will recreate enum type with correct values...")
            return False
        else:
            logger.info("Enum type exists with correct values")
            return True
    else:
        logger.info("Enum type does not exist, will create it")
        return False

def load_water_purification_data(df, target_conn, generate_sql=True):
    """Load the transformed water purification data into the target database."""
    logger.info(f"Loading data into {TARGET_TABLE}")

    # Check and fix enum type if needed
    enum_ok = check_and_fix_enum_type(target_conn)
    if not enum_ok:
        logger.info("Enum type needs to be recreated, will use SQL script with DROP/CREATE")

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
            purification_method=row['water_purification_method'],
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

def fix_enum_type_manually(target_conn):
    """Manually fix the enum type by dropping and recreating it."""
    logger.info("Manually fixing water_purification_method_type enum...")
    
    fix_queries = [
        f"DROP TABLE IF EXISTS {TARGET_TABLE} CASCADE;",
        "DROP TYPE IF EXISTS water_purification_method_type CASCADE;",
        """
        CREATE TYPE water_purification_method_type AS ENUM (
            'BOILING',
            'FILTERING',
            'CHEMICAL_PIYUSH',
            'NO_ANY_FILTERING',
            'OTHER'
        );
        """
    ]
    
    for query in fix_queries:
        try:
            execute_query(target_conn, query)
            logger.info(f"Executed: {query.strip()}")
        except Exception as e:
            logger.error(f"Error executing query: {e}")
            return False
    
    logger.info("Enum type fixed successfully")
    return True

def process_ward_wise_water_purification(source_conn, target_conn, generate_sql=True):
    """Process ward-wise water purification data from extraction to loading."""
    logger.info("Processing ward-wise water purification data")
    
    try:
        # Extract data
        df = extract_water_purification_data(source_conn)
        
        # Transform data
        transformed_df = transform_water_purification_data(df)
        
        # Load data
        load_water_purification_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise water purification data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise water purification data: {e}")
        # If it's an enum error, suggest manual fix
        if "invalid input value for enum" in str(e):
            logger.error("This appears to be an enum type mismatch. You can call fix_enum_type_manually(target_conn) to fix it.")
        return False
