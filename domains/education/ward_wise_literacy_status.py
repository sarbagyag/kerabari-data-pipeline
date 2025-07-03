import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import EDUCATION_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_ward_wise_literacy_status"

# Define literacy type mappings based on the provided enum values
LITERACY_TYPE_MAPPING = {
    # Primary Nepali terms from the specification
    "पढ्न लेख्न जानेको": "BOTH_READING_AND_WRITING",
    "पढ्न मात्र जानेको": "READING_ONLY",
    "पढ्न लेख्न नजानेका": "ILLITERATE",
    
    # Additional variations for better matching
    "पढ्न र लेख्न दुवै": "BOTH_READING_AND_WRITING",
    "पढ्न र लेख्न": "BOTH_READING_AND_WRITING",
    "पढ्न र लेख्न सक्ने": "BOTH_READING_AND_WRITING",
    "लेख्न पढ्न दुवै जान्ने": "BOTH_READING_AND_WRITING",
    "साक्षर": "BOTH_READING_AND_WRITING",
    
    "पढ्न मात्र": "READING_ONLY",
    "पढ्न मात्र सक्ने": "READING_ONLY",
    "पढ्न जान्ने": "READING_ONLY",
    
    "पढ्न र लेख्न नसक्ने": "ILLITERATE",
    "निरक्षर": "ILLITERATE",
    "साक्षर नभएको": "ILLITERATE",
    "लेखपढ नजान्ने": "ILLITERATE",
    
    # Default values for None or empty strings
    None: "ILLITERATE",
    "": "ILLITERATE"
}

def map_literacy_type(literacy_status):
    """
    Map literacy status to standardized enum values.
    """
    if not literacy_status or pd.isna(literacy_status):
        return "ILLITERATE"
    
    # Try direct mapping
    standardized = LITERACY_TYPE_MAPPING.get(literacy_status)
    if standardized:
        return standardized
    
    # Try lowercase matching for flexibility
    status_lower = str(literacy_status).lower().strip()
    for key, value in LITERACY_TYPE_MAPPING.items():
        if key and isinstance(key, str) and str(key).lower() == status_lower:
            return value
    
    # Check for keywords
    if "पढ्न" in status_lower and "लेख्न" in status_lower and "जानेको" in status_lower:
        return "BOTH_READING_AND_WRITING"
    elif "पढ्न" in status_lower and "मात्र" in status_lower and "जानेको" in status_lower:
        return "READING_ONLY"
    elif "पढ्न" in status_lower and "लेख्न" in status_lower and "नजानेका" in status_lower:
        return "ILLITERATE"
    
    # Default for unmatched values
    logger.warning(f"Literacy status '{literacy_status}' not found in mapping. Using ILLITERATE as default.")
    return "ILLITERATE"

def create_insert_data(ward_number, literacy_type, population):
    """
    Create a data dictionary for insertion specific to literacy status.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'literacy_type': literacy_type,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to literacy status.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, literacy_type, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['literacy_type']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_literacy_status table if it doesn't exist.
    """
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
            literacy_type VARCHAR(100) NOT NULL,
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

def extract_literacy_status_data(source_conn):
    """Extract literacy status data from source database."""
    logger.info("Extracting literacy status data")
    
    # Query to get ward, literacy_status and population count
    query = """
    SELECT 
        ward_no, 
        literacy_status,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    GROUP BY 
        ward_no, literacy_status
    ORDER BY 
        ward_no, literacy_status;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted literacy status data with {len(df)} ward-literacy combinations")
    
    return df

def transform_literacy_status_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming literacy status data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map literacy status to standardized values
    df['literacy_type_mapped'] = df['literacy_status'].apply(map_literacy_type)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward and mapped literacy type to sum populations
    grouped_df = df.groupby(['ward_no', 'literacy_type_mapped'])['population'].sum().reset_index()
    
    logger.info(f"Transformed literacy status data with {len(grouped_df)} ward-literacy combinations")
    
    return grouped_df

def load_literacy_status_data(df, target_conn, generate_sql=True):
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
            literacy_type=row['literacy_type_mapped'],
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
        sql_file_path = os.path.join(EDUCATION_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_literacy_status(source_conn, target_conn, generate_sql=True):
    """Process ward-wise literacy status data from extraction to loading."""
    logger.info("Processing ward-wise literacy status data")
    
    try:
        # Extract data
        df = extract_literacy_status_data(source_conn)
        
        # Transform data
        transformed_df = transform_literacy_status_data(df)
        
        # Load data
        load_literacy_status_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise literacy status data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise literacy status data: {e}")
        return False
