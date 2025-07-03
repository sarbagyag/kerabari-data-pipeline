import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import ECONOMICS_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_ward_wise_land_ownership"

# Define land ownership type mappings
LAND_OWNERSHIP_MAPPING = {
    "निजी": "PRIVATE",
    "गुठी": "GUTHI",
    "सार्वजनिक/ऐलानी": "PUBLIC_EILANI",
    "गाउँ ब्लक": "VILLAGE_BLOCK",
    "अन्य (खुलाउने)": "OTHER",
    "": "NOT_STATED",
    "unknown": "NOT_STATED"
}

def map_land_ownership_type(ownership):
    """
    Map land ownership to standardized values.
    """
    if not ownership or pd.isna(ownership):
        return "NOT_STATED"
    
    ownership_str = str(ownership).strip()
    return LAND_OWNERSHIP_MAPPING.get(ownership_str, "NOT_STATED")

def safe_int_convert(value):
    """
    Safely convert a value to integer, handling NaN and None values.
    """
    if pd.isna(value) or value is None:
        return 0
    try:
        return int(value)
    except (ValueError, TypeError):
        return 0

def create_insert_data(ward_number, land_ownership_type, households):
    """
    Create a data dictionary for insertion specific to land ownership.
    """
    return {
        'id': generate_uuid(),
        'ward_number': safe_int_convert(ward_number),
        'land_ownership_type': land_ownership_type,
        'households': safe_int_convert(households),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to land ownership.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, land_ownership_type, households, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['land_ownership_type']}',
        {data['households']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the acme_ward_wise_land_ownership table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE public.{TARGET_TABLE} (
            id varchar(36) NOT NULL,
            ward_number int4 NOT NULL,
            land_ownership_type varchar(50) NOT NULL,
            households int4 NOT NULL,
            updated_at timestamp DEFAULT now() NULL,
            created_at timestamp DEFAULT now() NULL,
            CONSTRAINT {TARGET_TABLE}_pkey PRIMARY KEY (id)
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

def extract_land_ownership_data(source_conn):
    """Extract land ownership data from source database."""
    logger.info("Extracting land ownership data")
    
    # Query to get ward_id and land_ownership counts
    query = """
    SELECT 
        ward_id, 
        land_ownership,
        COUNT(*) as households
    FROM 
        synthetic_survey_kerabari_building
    WHERE 
        ward_id IS NOT NULL
        AND land_ownership IS NOT NULL
    GROUP BY 
        ward_id, land_ownership
    ORDER BY 
        ward_id, land_ownership;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted land ownership data with {len(df)} ward-ownership combinations")
    
    return df

def transform_land_ownership_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming land ownership data")
    
    # Filter out rows with NaN ward_id values
    df = df.dropna(subset=['ward_id'])
    
    # Ensure ward_id is integer type
    df['ward_id'] = df['ward_id'].astype(int)
    
    # Map land ownership to standardized values
    df['land_ownership_mapped'] = df['land_ownership'].apply(map_land_ownership_type)
    
    # Group by ward_id and land ownership type to sum households
    result_data = []
    
    # Get unique combinations of ward_id and land ownership type
    ward_ownership = df.groupby(['ward_id', 'land_ownership_mapped']).agg({
        'households': 'sum'
    }).reset_index()
    
    for _, row in ward_ownership.iterrows():
        ward_id = row['ward_id']
        land_ownership_type = row['land_ownership_mapped']
        households = row['households']
        
        # Ensure households value is valid
        if pd.isna(households) or households < 0:
            households = 0
        
        result_data.append({
            'ward_id': ward_id,
            'land_ownership_type': land_ownership_type,
            'households': households
        })
    
    result_df = pd.DataFrame(result_data)
    logger.info(f"Transformed land ownership data with {len(result_df)} ward-ownership combinations")
    
    return result_df

def load_land_ownership_data(df, target_conn, generate_sql=True):
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
        # Skip rows with invalid ward_id
        if pd.isna(row['ward_id']) or row['ward_id'] is None:
            logger.warning(f"Skipping row with invalid ward_id: {row}")
            continue
            
        # Create data dictionary
        data = create_insert_data(
            ward_number=row['ward_id'],
            land_ownership_type=row['land_ownership_type'],
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
        sql_file_path = os.path.join(ECONOMICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_land_ownership(source_conn, target_conn, generate_sql=True):
    """Process ward-wise land ownership data from extraction to loading."""
    logger.info("Processing ward-wise land ownership data")
    
    try:
        # Extract data
        df = extract_land_ownership_data(source_conn)
        
        # Transform data
        transformed_df = transform_land_ownership_data(df)
        
        # Load data
        load_land_ownership_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise land ownership data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise land ownership data: {e}")
        return False
