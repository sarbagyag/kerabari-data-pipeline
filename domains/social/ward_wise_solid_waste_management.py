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

# Solid waste management method mappings
SOLID_WASTE_MANAGEMENT_MAPPING = {
    'घरमा नै लिन आउँछ': 'HOME_COLLECTION',
    'फोहर थुपार्ने ठाउँमा/क्यानमा': 'WASTE_COLLECTING_PLACE',
    'आफ्नै घर कम्पाउण्ड भित्र (बाल्ने)': 'BURNING',
    'आफ्नै घर कम्पाउण्ड भित्र (गाड्ने/थुपार्ने)': 'DIGGING',
    'नदी वा खोल्सामा': 'RIVER',
    'सडक/सार्वजनिक स्थलमा': 'ROAD_OR_PUBLIC_PLACE',
    'कम्पोष्ट मल बनाउने': 'COMPOST_MANURE',
    'अन्य (खुलाउने)': 'OTHER',

    # English variants
    'home collection': 'HOME_COLLECTION',
    'waste collecting place': 'WASTE_COLLECTING_PLACE',
    'burning': 'BURNING',
    'digging': 'DIGGING',
    'river': 'RIVER',
    'road or public place': 'ROAD_OR_PUBLIC_PLACE',
    'compost manure': 'COMPOST_MANURE',
    'other': 'OTHER',
    
    # Handle nulls and empty strings
    None: 'OTHER',
    '': 'OTHER'
}

TARGET_TABLE = 'acme_ward_wise_solid_waste_management'

def map_solid_waste_management(waste_mgmt):
    """Map solid waste management values to standardized enum values."""
    if not waste_mgmt or pd.isna(waste_mgmt):
        return "OTHER"
    
    # Try direct mapping
    standardized = SOLID_WASTE_MANAGEMENT_MAPPING.get(waste_mgmt)
    if standardized:
        return standardized
    
    # Try lowercase matching
    waste_mgmt_lower = str(waste_mgmt).lower().strip()
    for key, value in SOLID_WASTE_MANAGEMENT_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == waste_mgmt_lower:
            return value
    
    # Default
    logger.warning(f"Solid waste management method '{waste_mgmt}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def extract_solid_waste_management_data(source_conn):
    """Extracts solid waste management data from the database."""
    logger.info("Extracting solid waste management data now")

    query="""
    SELECT
        ward_no,
        solid_waste,
        COUNT(*) as households
    FROM
        synthetic_survey_kerabari_family
    WHERE
        solid_waste IS NOT NULL
    GROUP BY
        ward_no, solid_waste
    ORDER BY
        ward_no, solid_waste
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of solid waste management data")
    return df

def transform_solid_waste_management_data(df):
    logger.info("Transforming solid waste management data now")

    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map solid waste management methods to standardized values
    df['waste_mgmt_mapped'] = df['solid_waste'].apply(map_solid_waste_management)
    
    # Ensure households is integer type
    df['households'] = df['households'].astype(int)
    
    # Group by ward and mapped waste management method to sum households
    grouped_df = df.groupby(['ward_no', 'waste_mgmt_mapped'])['households'].sum().reset_index()
    
    logger.info(f"Transformed data into {len(grouped_df)} ward-waste management combinations")
    return grouped_df

def create_insert_data(ward_number, waste_mgmt, households):
    """Create a data dictionary for insertion specific to solid waste management data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'solid_waste_management': waste_mgmt,
        'households': int(households),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to solid waste management data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, solid_waste_management, households, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['solid_waste_management']}',
        {data['households']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_solid_waste_management table if it doesn't exist."""
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
            solid_waste_management VARCHAR(100) NOT NULL,
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

def load_solid_waste_management_data(df, target_conn, generate_sql=True):
    """Load the transformed solid waste management data into the target database."""
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
            waste_mgmt=row['waste_mgmt_mapped'],
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

def process_ward_wise_solid_waste_management(source_conn, target_conn, generate_sql=True):
    """Process ward-wise solid waste management data from extraction to loading."""
    logger.info("Processing ward-wise solid waste management data")
    
    try:
        # Extract data
        df = extract_solid_waste_management_data(source_conn)
        
        # Transform data
        transformed_df = transform_solid_waste_management_data(df)
        
        # Load data
        load_solid_waste_management_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise solid waste management data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise solid waste management data: {e}")
        return False
