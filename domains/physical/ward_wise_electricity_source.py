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
TARGET_TABLE = "acme_ward_wise_electricity_source"

# Define electricity source mappings based on the provided enum values
ELECTRICITY_SOURCE_MAPPING = {
    # Primary sources
    "विद्युत": "ELECTRICITY",
    "सोलार": "SOLAR",
    "मट्टितेल": "KEROSENE",
    "बायोग्याँस": "BIOGAS",
    "अन्य (खुलाउने)": "OTHER",
  
    
    # Additional English variations for flexibility
    "electricity": "ELECTRICITY",
    "grid": "ELECTRICITY",
    "solar": "SOLAR",
    "kerosene": "KEROSENE",
    "biogas": "BIOGAS",
    "gobar gas": "BIOGAS",
    "other": "OTHER",
    
    # Handle nulls and empty strings
    None: "OTHER",
    "": "OTHER"
}

def map_electricity_source(source):
    """
    Map electricity source values to standardized enum values.
    """
    if not source or pd.isna(source):
        return "OTHER"
    
    # Try direct mapping
    standardized = ELECTRICITY_SOURCE_MAPPING.get(source)
    if standardized:
        return standardized
    
    # Try lowercase matching for flexibility
    source_lower = str(source).lower().strip()
    for key, value in ELECTRICITY_SOURCE_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == source_lower:
            return value
    
    # Check for keywords in the string
    if "विद्युत" in source_lower or "electricity" in source_lower or "grid" in source_lower:
        return "ELECTRICITY"
    elif "सौर्य" in source_lower or "solar" in source_lower:
        return "SOLAR"
    elif "मट्टितेल" in source_lower or "kerosene" in source_lower:
        return "KEROSENE"
    elif "गोबर" in source_lower or "बायोग्याँस" in source_lower or "biogas" in source_lower:
        return "BIOGAS"
    
    # Default for unmatched values
    logger.warning(f"Electricity source '{source}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def create_insert_data(ward_number, electricity_source, households):
    """
    Create a data dictionary for insertion specific to electricity source.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'electricity_source': electricity_source,
        'households': int(households),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to electricity source.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, electricity_source, households, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['electricity_source']}',
        {data['households']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_electricity_source table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'electricity_source_type'
    ) THEN
        CREATE TYPE electricity_source_type AS ENUM (
            'ELECTRICITY',
            'SOLAR',
            'KEROSENE',
            'BIOGAS',
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
            electricity_source electricity_source_type NOT NULL,
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

def extract_electricity_source_data(source_conn):
    """Extract electricity source data from source database."""
    logger.info("Extracting electricity source data")
    
    # Query to get ward, primary_energy_source and household count
    query = """
    SELECT 
        ward_no, 
        primary_energy_source,
        COUNT(*) as households
    FROM 
        synthetic_survey_kerabari_family
    WHERE 
        primary_energy_source IS NOT NULL
    GROUP BY 
        ward_no, primary_energy_source
    ORDER BY 
        ward_no, primary_energy_source;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted electricity source data with {len(df)} ward-source combinations")
    
    return df

def transform_electricity_source_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming electricity source data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map electricity source to standardized values
    df['electricity_source_mapped'] = df['primary_energy_source'].apply(map_electricity_source)
    
    # Ensure households is integer type
    df['households'] = df['households'].astype(int)
    
    # Group by ward and mapped electricity source to sum households
    grouped_df = df.groupby(['ward_no', 'electricity_source_mapped'])['households'].sum().reset_index()
    
    logger.info(f"Transformed electricity source data with {len(grouped_df)} ward-source combinations")
    
    return grouped_df

def load_electricity_source_data(df, target_conn, generate_sql=True):
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
            electricity_source=row['electricity_source_mapped'],
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

def process_electricity_source(source_conn, target_conn, generate_sql=True):
    """Process ward-wise electricity source data from extraction to loading."""
    logger.info("Processing ward-wise electricity source data")
    
    try:
        # Extract data
        df = extract_electricity_source_data(source_conn)
        
        # Transform data
        transformed_df = transform_electricity_source_data(df)
        
        # Load data
        load_electricity_source_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise electricity source data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise electricity source data: {e}")
        return False
