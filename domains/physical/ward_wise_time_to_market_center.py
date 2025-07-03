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
TARGET_TABLE = "acme_ward_wise_time_to_market_center"

# Define time to market center mappings based on the provided enum values
TIME_MARKET_MAPPING = {
    # Primary Nepali terms from the specification
    "१५ मिनेटभित्र": "UNDER_15_MIN",
    "३० मिनेटभित्र": "UNDER_30_MIN",
    "१ घण्टाभित्र": "UNDER_1_HOUR",
    "१ घण्टाभन्दा बढी": "1_HOUR_OR_MORE",
    
    # Additional English variations
    "under 15 minutes": "UNDER_15_MIN",
    "under 30 minutes": "UNDER_30_MIN",
    "under 1 hour": "UNDER_1_HOUR",
    "1 hour or more": "1_HOUR_OR_MORE",
    
    # Numeric ranges
    "0-15": "UNDER_15_MIN",
    "16-30": "UNDER_30_MIN", 
    "31-60": "UNDER_1_HOUR",
    "60+": "1_HOUR_OR_MORE",
    
    # Default values for None or empty strings
    None: "1_HOUR_OR_MORE",
    "": "1_HOUR_OR_MORE"
}

def map_time_to_market(time_value):
    """
    Map time to market center values to standardized enum values.
    """
    if not time_value or pd.isna(time_value):
        return "1_HOUR_OR_MORE"
    
    # If input is already a categorized string
    if isinstance(time_value, str):
        # Try direct mapping
        standardized = TIME_MARKET_MAPPING.get(time_value)
        if standardized:
            return standardized
        
        # Try lowercase matching for flexibility
        time_lower = time_value.lower().strip()
        for key, value in TIME_MARKET_MAPPING.items():
            if key and isinstance(key, str) and key.lower() == time_lower:
                return value
                
        # Check for keywords in the string
        if "15" in time_lower or "१५" in time_value:
            return "UNDER_15_MIN"
        elif "30" in time_lower or "३०" in time_value:
            return "UNDER_30_MIN"
        elif "1 hour" in time_lower or "घण्टाभित्र" in time_value:
            return "UNDER_1_HOUR"
        elif "more" in time_lower or "बढी" in time_value:
            return "1_HOUR_OR_MORE"
    
    # Try to convert to int and categorize
    try:
        mins = int(time_value)
        if mins < 15:
            return "UNDER_15_MIN"
        elif mins < 30:
            return "UNDER_30_MIN"
        elif mins < 60:
            return "UNDER_1_HOUR"
        else:
            return "1_HOUR_OR_MORE"
    except (ValueError, TypeError):
        logger.warning(f"Could not convert time to minutes: {time_value}. Using default 1_HOUR_OR_MORE.")
        return "1_HOUR_OR_MORE"

def create_insert_data(ward_number, time_category, households):
    """
    Create a data dictionary for insertion specific to time to market center.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'time_to_market_center': time_category,
        'households': int(households),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to time to market center.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, time_to_market_center, households, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['time_to_market_center']}',
        {data['households']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_time_to_market_center table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'time_to_market_center_type'
    ) THEN
        CREATE TYPE time_to_market_center_type AS ENUM (
            'UNDER_15_MIN', 
            'UNDER_30_MIN', 
            'UNDER_1_HOUR', 
            '1_HOUR_OR_MORE'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE {TARGET_TABLE} (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            time_to_market_center time_to_market_center_type NOT NULL,
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

def extract_time_to_market_data(source_conn):
    """Extract time to market center data from source database."""
    logger.info("Extracting time to market center data")
    
    # Query to get ward, time_to_market_center and household count
    query = """
    SELECT 
        ward_number, 
        time_to_market,
        COUNT(*) as households
    FROM 
        staging_kerabari_buildings
    WHERE 
        time_to_market IS NOT NULL
    GROUP BY 
        ward_number, time_to_market
    ORDER BY 
        ward_number, time_to_market;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted time to market center data with {len(df)} ward-time combinations")
    
    return df

def transform_time_to_market_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming time to market center data")
    
    # Ensure ward_number is integer type
    df['ward_number'] = df['ward_number'].astype(int)
    
    # Map time to market center to standardized values
    df['time_category_mapped'] = df['time_to_market'].apply(map_time_to_market)
    
    # Ensure households is integer type
    df['households'] = df['households'].astype(int)
    
    # Group by ward and mapped time category to sum households
    grouped_df = df.groupby(['ward_number', 'time_category_mapped'])['households'].sum().reset_index()
    
    logger.info(f"Transformed time to market center data with {len(grouped_df)} ward-time category combinations")
    
    return grouped_df

def load_time_to_market_data(df, target_conn, generate_sql=True):
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
            ward_number=row['ward_number'],
            time_category=row['time_category_mapped'],
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

def process_time_to_market_center(source_conn, target_conn, generate_sql=True):
    """Process ward-wise time to market center data from extraction to loading."""
    logger.info("Processing ward-wise time to market center data")
    
    try:
        # Extract data
        df = extract_time_to_market_data(source_conn)
        
        # Transform data
        transformed_df = transform_time_to_market_data(df)
        
        # Load data
        load_time_to_market_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise time to market center data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise time to market center data: {e}")
        return False
