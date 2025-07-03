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

# Target table name
TARGET_TABLE = "acme_ward_wise_cooking_fuel"

# Define cooking fuel mappings based on the provided enum values
COOKING_FUEL_MAPPING = {
    # Primary Nepali terms from the specification
    "काठ/दाउरा/कोइला": "WOOD",
    "एल.पी. ग्याँस": "LP_GAS",
    "मट्टितेल": "KEROSENE",
    "विद्युत": "ELECTRICITY",
    "गोबर ग्याँस/बायोग्याँस": "BIOGAS",
    "गोबर/गुँइठा": "DUNGCAKE",
    "अन्य": "OTHER",
    
    # Additional English variations for flexibility
    "wood": "WOOD",
    "firewood": "WOOD",
    "coal": "WOOD",
    "lp gas": "LP_GAS",
    "lpg": "LP_GAS",
    "kerosene": "KEROSENE",
    "electricity": "ELECTRICITY",
    "electric": "ELECTRICITY",
    "biogas": "BIOGAS",
    "gobar gas": "BIOGAS",
    "dung cake": "DUNGCAKE",
    "cow dung": "DUNGCAKE",
    "guitha": "DUNGCAKE",
    "other": "OTHER",
    
    # Handle nulls and empty strings
    None: "OTHER",
    "": "OTHER"
}

def map_cooking_fuel(fuel):
    """
    Map cooking fuel values to standardized enum values.
    """
    if not fuel or pd.isna(fuel):
        return "OTHER"
    
    # Try direct mapping
    standardized = COOKING_FUEL_MAPPING.get(fuel)
    if standardized:
        return standardized
    
    # Try lowercase matching for flexibility
    fuel_lower = str(fuel).lower().strip()
    for key, value in COOKING_FUEL_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == fuel_lower:
            return value
    
    # Check for keywords in the string
    if any(wood in fuel_lower for wood in ["काठ", "दाउरा", "कोइला", "wood", "fire"]):
        return "WOOD"
    elif "ग्याँस" in fuel_lower or "gas" in fuel_lower:
        if any(bio in fuel_lower for bio in ["गोबर", "biogas", "gobar"]):
            return "BIOGAS"
        else:
            return "LP_GAS"
    elif "मट्टितेल" in fuel_lower or "kerosene" in fuel_lower:
        return "KEROSENE"
    elif "विद्युत" in fuel_lower or "electr" in fuel_lower:
        return "ELECTRICITY"
    elif any(dung in fuel_lower for dung in ["गोबर", "गुँइठा", "dung"]):
        return "DUNGCAKE"
    
    # Default for unmatched values
    logger.warning(f"Cooking fuel '{fuel}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def create_insert_data(ward_number, cooking_fuel, households):
    """
    Create a data dictionary for insertion specific to cooking fuel.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'cooking_fuel': cooking_fuel,
        'households': int(households),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to cooking fuel.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, cooking_fuel, households, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['cooking_fuel']}',
        {data['households']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_cooking_fuel table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'cooking_fuel_type'
    ) THEN
        CREATE TYPE cooking_fuel_type AS ENUM (
            'WOOD',
            'LP_GAS',
            'KEROSENE',
            'ELECTRICITY',
            'BIOGAS',
            'DUNGCAKE',
            'OTHER'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE {TARGET_TABLE} (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            cooking_fuel cooking_fuel_type NOT NULL,
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

def extract_cooking_fuel_data(source_conn):
    """Extract cooking fuel data from source database."""
    logger.info("Extracting cooking fuel data")
    
    # Query to get ward, primary_cooking_fuel and household count
    query = """
    SELECT 
        ward_no, 
        primary_cooking_fuel,
        COUNT(*) as households
    FROM 
        synthetic_survey_kerabari_family
    WHERE 
        primary_cooking_fuel IS NOT NULL
    GROUP BY 
        ward_no, primary_cooking_fuel
    ORDER BY 
        ward_no, primary_cooking_fuel;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted cooking fuel data with {len(df)} ward-fuel combinations")
    
    return df

def transform_cooking_fuel_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming cooking fuel data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map cooking fuel to standardized values
    df['cooking_fuel_mapped'] = df['primary_cooking_fuel'].apply(map_cooking_fuel)
    
    # Ensure households is integer type
    df['households'] = df['households'].astype(int)
    
    # Group by ward and mapped cooking fuel to sum households
    grouped_df = df.groupby(['ward_no', 'cooking_fuel_mapped'])['households'].sum().reset_index()
    
    logger.info(f"Transformed cooking fuel data with {len(grouped_df)} ward-fuel combinations")
    
    return grouped_df

def load_cooking_fuel_data(df, target_conn, generate_sql=True):
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
            cooking_fuel=row['cooking_fuel_mapped'],
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
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_cooking_fuel(source_conn, target_conn, generate_sql=True):
    """Process ward-wise cooking fuel data from extraction to loading."""
    logger.info("Processing ward-wise cooking fuel data")
    
    try:
        # Extract data
        df = extract_cooking_fuel_data(source_conn)
        
        # Transform data
        transformed_df = transform_cooking_fuel_data(df)
        
        # Load data
        load_cooking_fuel_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise cooking fuel data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise cooking fuel data: {e}")
        return False
