import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import FERTILITY_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_ward_wise_delivery_place"

# Define delivery place type mappings based on provided enums
delivery_place_MAPPING = {
    # Map from Nepali to standardized English values
    "घरमा": "HOUSE",
    "सरकारी स्वास्थ्य संस्थामा": "GOVERNMENTAL_HEALTH_INSTITUTION",
    "नीजी स्वास्थ्य संस्थामा": "PRIVATE_HEALTH_INSTITUTION",
    "अन्य": "OTHER",
    
    # Additional variations for better matching
    "घर": "HOUSE",
    "home": "HOUSE",
    "house": "HOUSE",
    "hospital": "GOVERNMENTAL_HEALTH_INSTITUTION",
    "govt hospital": "GOVERNMENTAL_HEALTH_INSTITUTION",
    "government hospital": "GOVERNMENTAL_HEALTH_INSTITUTION",
    "स्वास्थ्य चौकी": "GOVERNMENTAL_HEALTH_INSTITUTION",
    "स्वास्थ्य केन्द्र": "GOVERNMENTAL_HEALTH_INSTITUTION",
    "private hospital": "PRIVATE_HEALTH_INSTITUTION",
    "clinic": "PRIVATE_HEALTH_INSTITUTION",
    "नीजी क्लिनिक": "PRIVATE_HEALTH_INSTITUTION",
    "नीजी अस्पताल": "PRIVATE_HEALTH_INSTITUTION",
    
    # Handle nulls and empty strings
    None: "OTHER",
    "": "OTHER"
}

def map_recent_delivery_location(place):
    """
    Map delivery place to standardized enum values.
    """
    # Check for null values properly
    if pd.isna(place) or place is None or place == '':
        return "OTHER"
    
    # Handle array elements (in case explode didn't fully handle it)
    if isinstance(place, list):
        if len(place) == 0:
            return "OTHER"
        place = place[0]  # Take the first element
    
    # Try direct mapping
    standardized = delivery_place_MAPPING.get(place)
    if standardized:
        return standardized
    
    # Try lowercase matching for flexibility
    place_lower = str(place).lower().strip()
    for key, value in delivery_place_MAPPING.items():
        if key and isinstance(key, str) and str(key).lower() == place_lower:
            return value
    
    # Check for keywords in the place string
    if "घर" in place_lower or "home" in place_lower or "house" in place_lower:
        return "HOUSE"
    elif "सरकारी" in place_lower or "government" in place_lower or "स्वास्थ्य चौकी" in place_lower:
        return "GOVERNMENTAL_HEALTH_INSTITUTION"
    elif "नीजी" in place_lower or "private" in place_lower or "clinic" in place_lower:
        return "PRIVATE_HEALTH_INSTITUTION"
    
    # Default for unmatched values
    logger.warning(f"Delivery place '{place}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def create_insert_data(ward_number, delivery_place, population):
    """
    Create a data dictionary for insertion specific to delivery place.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'delivery_place': delivery_place,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to delivery place.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, delivery_place, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['delivery_place']}'::delivery_place_type,
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_delivery_place table if it doesn't exist.
    """
    return f"""
-- Create enum type if it doesn't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'delivery_place_type') THEN
        CREATE TYPE delivery_place_type AS ENUM (
            'HOUSE',
            'GOVERNMENTAL_HEALTH_INSTITUTION',
            'PRIVATE_HEALTH_INSTITUTION',
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
            delivery_place delivery_place_type NOT NULL,
            population INTEGER NOT NULL,
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

def extract_recent_delivery_location_data(source_conn):
    """Extract delivery place data from source database."""
    logger.info("Extracting delivery place data")
    
    # Query to get ward, recent_delivery_location and population count
    query = """
    SELECT 
        ward_no,
        recent_delivery_location,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        recent_delivery_location IS NOT NULL
        AND gender = 'महिला'  -- Only count female records
        AND recent_delivery_location != ''
        AND recent_delivery_location!=' '
    GROUP BY 
        ward_no, recent_delivery_location
    ORDER BY 
        ward_no, recent_delivery_location;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted delivery place data for {len(df)} ward-place combinations")
    
    return df

def transform_recent_delivery_location_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming delivery place data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map delivery place to standardized values
    df['recent_delivery_location_mapped'] = df['recent_delivery_location'].apply(map_recent_delivery_location)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward and mapped delivery place to sum populations
    grouped_df = df.groupby(['ward_no', 'recent_delivery_location_mapped'])['population'].sum().reset_index()
    
    logger.info(f"Transformed delivery place data with {len(grouped_df)} ward-place combinations")
    
    return grouped_df

def load_recent_delivery_location_data(df, target_conn, generate_sql=True):
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
            delivery_place=row['recent_delivery_location_mapped'],
            population=row['population']
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
        sql_file_path = os.path.join(FERTILITY_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_recent_delivery_location(source_conn, target_conn, generate_sql=True):
    """Process ward-wise delivery place data from extraction to loading."""
    logger.info("Processing ward-wise delivery place data")
    
    try:
        # Extract data
        df = extract_recent_delivery_location_data(source_conn)
        
        # Transform data
        transformed_df = transform_recent_delivery_location_data(df)
        
        # Load data
        load_recent_delivery_location_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise delivery place data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise delivery place data: {e}")
        return False
