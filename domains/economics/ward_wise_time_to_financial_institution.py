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
TARGET_TABLE = "acme_ward_wise_time_to_financial_institution"

def map_time_range(time_value):
    """
    Map time values to standardized time range enum values.
    """
    if pd.isna(time_value) or time_value == '' or time_value is None:
        return 'unknown'
    
    # Convert to string and clean
    time_str = str(time_value).strip().lower()
    
    # Map based on common time ranges
    if 'मिनेट' in time_str or 'minute' in time_str:
        try:
            # Extract numeric value
            numeric_part = ''.join(filter(str.isdigit, time_str))
            if numeric_part:
                minutes = int(numeric_part)
                if minutes <= 15:
                    return 'under_15_minutes'
                elif minutes <= 30:
                    return '15_to_30_minutes'
                elif minutes <= 60:
                    return '30_to_60_minutes'
                else:
                    return 'over_1_hour'
        except:
            pass
    elif 'घण्टा' in time_str or 'hour' in time_str:
        return 'over_1_hour'
    
    return 'unknown'

def create_insert_data(ward_number, time_range, households):
    """
    Create a data dictionary for insertion specific to time to financial institution.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'time_range': time_range,
        'households': int(households),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to time to financial institution.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, time_range, households, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['time_range']}',
        {data['households']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_time_to_financial_institution table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE {TARGET_TABLE} (
            id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
            ward_number INTEGER NOT NULL CHECK (ward_number >= 1 AND ward_number <= 9),
            time_range VARCHAR(25) NOT NULL,
            households INTEGER NOT NULL DEFAULT 0 CHECK (households >= 0),
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

def extract_time_to_financial_institution_data(source_conn):
    """Extract time to financial institution data from source database."""
    logger.info("Extracting time to financial institution data")
    
    # Query to get households and their time to reach financial institution
    query = """
    SELECT 
        ward_no,
        time_to_bank_financial_institution
    FROM 
        synthetic_survey_kerabari_family
    WHERE 
        ward_no IS NOT NULL
        AND time_to_bank_financial_institution IS NOT NULL;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} household records with time to financial institution information")
    
    return df

def transform_time_to_financial_institution_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming time to financial institution data")
    
    # Handle empty dataframe
    if df.empty:
        # Create empty dataframe with expected columns
        grouped_df = pd.DataFrame(columns=['ward_no', 'time_range', 'households'])
        logger.warning("No time to financial institution data found in source database")
    else:
        # Map time values to standardized time ranges
        df['time_range'] = df['time_to_bank_financial_institution'].apply(map_time_range)
        
        # Group by ward and time range to count households
        grouped_df = df.groupby(['ward_no', 'time_range']).size().reset_index(name='households')
        
        # Ensure all wards 1-9 are represented with all time ranges
        all_wards = range(1, 10)
        time_ranges = ['under_15_minutes', '15_to_30_minutes', '30_to_60_minutes', 'over_1_hour', 'unknown']
        
        # Create complete ward-time_range combinations
        complete_combinations = []
        for ward in all_wards:
            for time_range in time_ranges:
                complete_combinations.append({'ward_no': ward, 'time_range': time_range})
        
        complete_df = pd.DataFrame(complete_combinations)
        
        # Merge with actual data, filling missing combinations with 0
        grouped_df = complete_df.merge(grouped_df, on=['ward_no', 'time_range'], how='left').fillna(0)
        grouped_df['households'] = grouped_df['households'].astype(int)
    
    logger.info(f"Transformed into {len(grouped_df)} ward-time range combinations")
    
    return grouped_df

def load_time_to_financial_institution_data(df, target_conn, generate_sql=True):
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
            time_range=row['time_range'],
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

def process_time_to_financial_institution(source_conn, target_conn, generate_sql=True):
    """Process ward-wise time to financial institution data from extraction to loading."""
    logger.info("Processing ward-wise time to financial institution data")
    
    try:
        # Extract data
        df = extract_time_to_financial_institution_data(source_conn)
        
        # Transform data
        transformed_df = transform_time_to_financial_institution_data(df)
        
        # Load data
        load_time_to_financial_institution_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise time to financial institution data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise time to financial institution data: {e}")
        return False
