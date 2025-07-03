import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import DEMOGRAPHICS_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_ward_wise_birth_certificate_population"

# Define birth certificate status mappings
BIRTH_CERTIFICATE_STATUS = {
    "छ": "HAS_CERTIFICATE",
    "छैन": "NO_CERTIFICATE",
    "": "NOT_STATED",
    "unknown": "NOT_STATED"
}

def map_birth_certificate_status(status):
    """
    Map birth certificate status to standardized values.
    """
    if not status or pd.isna(status):
        return "NOT_STATED"
    
    status_str = str(status).strip()
    return BIRTH_CERTIFICATE_STATUS.get(status_str, "NOT_STATED")

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

def create_insert_data(ward_number, with_certificate, without_certificate):
    """
    Create a data dictionary for insertion specific to birth certificate status.
    """
    return {
        'ward_number': safe_int_convert(ward_number),
        'with_birth_certificate': safe_int_convert(with_certificate),
        'without_birth_certificate': safe_int_convert(without_certificate),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to birth certificate status.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (ward_number, with_birth_certificate, without_birth_certificate, updated_at, created_at)
    VALUES (
        {data['ward_number']},
        {data['with_birth_certificate']},
        {data['without_birth_certificate']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the acme_ward_wise_birth_certificate_population table if it doesn't exist.
    """
    return f"""
-- Enable pgcrypto extension for gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE public.{TARGET_TABLE} (
            id                       uuid PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number              int    NOT NULL CHECK (ward_number > 0),
            with_birth_certificate   int    NOT NULL CHECK (with_birth_certificate   >= 0),
            without_birth_certificate int   NOT NULL CHECK (without_birth_certificate >= 0),
            total_population_under_5 int
                GENERATED ALWAYS AS (with_birth_certificate + without_birth_certificate) STORED,
            updated_at               timestamptz NOT NULL DEFAULT now(),
            created_at               timestamptz NOT NULL DEFAULT now()
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

def extract_birth_certificate_data(source_conn):
    """Extract birth certificate data from source database for age <= 5."""
    logger.info("Extracting birth certificate data for age <= 5")
    
    # Query to get ward_no and birth certificate status counts for age <= 5
    query = """
    SELECT 
        ward_no, 
        has_birth_certificate,
        COUNT(*) as population
    FROM 
      staging_kerabari_individual
    WHERE 
        age <= 5
        AND ward_no IS NOT NULL
        AND has_birth_certificate IS NOT NULL
    GROUP BY 
        ward_no, has_birth_certificate
    ORDER BY 
        ward_no, has_birth_certificate;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted birth certificate data with {len(df)} ward_no-status combinations")
    
    return df

def transform_birth_certificate_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming birth certificate data")
    
    # Filter out rows with NaN ward_no values
    df = df.dropna(subset=['ward_no'])
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map birth certificate status to standardized values
    df['birth_cert_status_mapped'] = df['has_birth_certificate'].apply(map_birth_certificate_status)
    
    # Group by ward_no to sum populations by certificate status
    result_data = []
    
    # Get unique ward numbers
    unique_wards = df['ward_no'].unique()
    
    for ward_no in unique_wards:
        # Filter data for this ward
        ward_data = df[df['ward_no'] == ward_no]
        
        # Calculate counts for each certificate status
        with_certificate = ward_data[ward_data['birth_cert_status_mapped'] == 'HAS_CERTIFICATE']['population'].sum() or 0
        without_certificate = ward_data[ward_data['birth_cert_status_mapped'] == 'NO_CERTIFICATE']['population'].sum() or 0
        
        # Ensure all population values are valid numbers
        if pd.isna(with_certificate) or with_certificate < 0:
            with_certificate = 0
        if pd.isna(without_certificate) or without_certificate < 0:
            without_certificate = 0
        
        result_data.append({
            'ward_no': ward_no,
            'with_birth_certificate': with_certificate,
            'without_birth_certificate': without_certificate
        })
    
    result_df = pd.DataFrame(result_data)
    logger.info(f"Transformed birth certificate data with {len(result_df)} wards")
    
    return result_df

def load_birth_certificate_data(df, target_conn, generate_sql=True):
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
        # Skip rows with invalid ward_no
        if pd.isna(row['ward_no']) or row['ward_no'] is None:
            logger.warning(f"Skipping row with invalid ward_no: {row}")
            continue
            
        # Create data dictionary
        data = create_insert_data(
            ward_number=row['ward_no'],
            with_certificate=row['with_birth_certificate'],
            without_certificate=row['without_birth_certificate']
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
        sql_file_path = os.path.join(DEMOGRAPHICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_birth_certificate_population(source_conn, target_conn, generate_sql=True):
    """Process ward-wise birth certificate population data from extraction to loading."""
    logger.info("Processing ward-wise birth certificate population data")
    
    try:
        # Extract data
        df = extract_birth_certificate_data(source_conn)
        
        # Transform data
        transformed_df = transform_birth_certificate_data(df)
        
        # Load data
        load_birth_certificate_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise birth certificate population data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise birth certificate population data: {e}")
        return False
