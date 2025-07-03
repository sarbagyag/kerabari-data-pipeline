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
TARGET_TABLE = "acme_ward_wise_school_dropout"

# Define school dropout cause mappings based on the provided enum values
SCHOOL_BARRIER_MAPPING = {
    # Map from Nepali to standardized English values
    "अरु पढ्ने ठाउिँ नभएकोले": "LIMITED_SPACE",
    "धेरै महँगो भएकोले": "EXPENSIVE",
    "धेरै टाढा भएकोले": "FAR",
    "घरमा काम सघाउनु परेकोले": "HOUSE_HELP",
    "बाबु/आमाले नचाहेकोले": "UNWILLING_PARENTS",
    "चाहेजति पढिसकेकोले": "WANTED_STUDY_COMPLETED",
    "विवाह भएकोले": "MARRIAGE",
    "काम शुर गरेको/जागिर पाएर": "EMPLOYMENT",
    "अन्य": "OTHER",
    
    # Additional mappings for common terms in English
    "business": "BUSINESS",
    "private job": "PRIVATE_JOB",
    "government job": "GOVERNMENTAL_JOB",
    "study": "STUDY",
    "work": "WORK",
    "dependent": "DEPENDENT",
    "conflict": "CONFLICT",
    "unknown": "UNKNOWN",
    
    # Handle nulls and empty strings
    None: "UNKNOWN",
    "": "UNKNOWN"
}

def map_school_barrier(barrier):
    """
    Map school barrier/dropout cause to standardized enum values.
    """
    if not barrier or pd.isna(barrier):
        return "UNKNOWN"
    
    # Try direct mapping
    standardized = SCHOOL_BARRIER_MAPPING.get(barrier)
    if standardized:
        return standardized
    
    # Try lowercase matching for flexibility
    barrier_lower = str(barrier).lower().strip()
    for key, value in SCHOOL_BARRIER_MAPPING.items():
        if key and isinstance(key, str) and str(key).lower() == barrier_lower:
            return value
    
    # Check for keywords in the barrier string
    if "पढ्ने ठाउिँ नभएको" in barrier_lower or "limited space" in barrier_lower:
        return "LIMITED_SPACE"
    elif "महँगो" in barrier_lower or "expensive" in barrier_lower:
        return "EXPENSIVE"
    elif "टाढा" in barrier_lower or "far" in barrier_lower:
        return "FAR"
    elif "काम सघाउनु" in barrier_lower or "house help" in barrier_lower:
        return "HOUSE_HELP"
    elif "बाबु/आमाले नचाहेको" in barrier_lower or "parents" in barrier_lower:
        return "UNWILLING_PARENTS"
    elif "पढिसकेको" in barrier_lower or "completed" in barrier_lower:
        return "WANTED_STUDY_COMPLETED"
    elif "विवाह" in barrier_lower or "marriage" in barrier_lower:
        return "MARRIAGE"
    elif "जागिर" in barrier_lower or "employment" in barrier_lower or "job" in barrier_lower:
        return "EMPLOYMENT"
    elif "business" in barrier_lower or "व्यापार" in barrier_lower:
        return "BUSINESS"
    elif "work" in barrier_lower or "काम" in barrier_lower:
        return "WORK"
    
    # Default for unmatched values
    logger.warning(f"School barrier cause '{barrier}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def create_insert_data(ward_number, cause, population):
    """
    Create a data dictionary for insertion specific to school dropout.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'cause': cause,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to school dropout.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, cause, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['cause']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_school_dropout table if it doesn't exist.
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
            cause VARCHAR(100) NOT NULL,
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

def extract_school_dropout_data(source_conn):
    """Extract school dropout data from source database."""
    logger.info("Extracting school dropout data")
    
    # Query to get ward, school_barrier and population count
    query = """
    SELECT 
        ward_no, 
        school_barrier,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        school_barrier IS NOT NULL
    GROUP BY 
        ward_no, school_barrier
    ORDER BY 
        ward_no, school_barrier;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted school dropout data with {len(df)} ward-barrier combinations")
    
    return df

def transform_school_dropout_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming school dropout data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map school barrier to standardized cause values
    df['cause_mapped'] = df['school_barrier'].apply(map_school_barrier)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward and mapped cause to sum populations
    grouped_df = df.groupby(['ward_no', 'cause_mapped'])['population'].sum().reset_index()
    
    logger.info(f"Transformed school dropout data with {len(grouped_df)} ward-cause combinations")
    
    return grouped_df

def load_school_dropout_data(df, target_conn, generate_sql=True):
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
            cause=row['cause_mapped'],
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

def process_school_dropout(source_conn, target_conn, generate_sql=True):
    """Process ward-wise school dropout data from extraction to loading."""
    logger.info("Processing ward-wise school dropout data")
    
    try:
        # Extract data
        df = extract_school_dropout_data(source_conn)
        
        # Transform data
        transformed_df = transform_school_dropout_data(df)
        
        # Load data
        load_school_dropout_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise school dropout data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise school dropout data: {e}")
        return False
