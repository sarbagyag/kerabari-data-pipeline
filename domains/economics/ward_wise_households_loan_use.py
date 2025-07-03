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
TARGET_TABLE = "acme_ward_wise_households_loan_use"

def map_loan_use(nepali_loan_use):
    """
    Map Nepali loan use types to standardized enum values.
    """
    mapping = {
        'व्यापार/उद्योग व्यवसायको लागि': 'BUSINESS',
        'कृषि व्यवसायको लागि': 'AGRICULTURE',
        'घर बनाउन/जग्गा जमिन किन्न': 'HOME_CONSTRUCTION',
        'जन्म/मृत्यु/विवाह/व्रतबन्धको लागि': 'CEREMONY',
        'चाडपर्व मनाउन': 'CEREMONY',
        'औषधी उपचारको लागि': 'HEALTH_TREATMENT',
        'शैक्षिक शुल्क तिर्न तथा शैक्षिक सामाग्री किन्न': 'EDUCATION',
        'घरायसी उपभोग गर्न': 'HOUSEHOLD_EXPENSES',
        'परिवारका सदस्यलाई विदेश पठाउन': 'FOREIGN_EMPLOYMENT',
        'अन्य प्रयोजनका लागि': 'OTHER',
        'अन्य': 'OTHER'
    }
    
    # Clean up the input string by removing whitespace
    clean_loan_use = nepali_loan_use.strip() if isinstance(nepali_loan_use, str) else nepali_loan_use
    
    # Return the mapped value if available, otherwise return 'OTHER'
    return mapping.get(clean_loan_use, 'OTHER')

def create_insert_data(ward_number, loan_use, households):
    """
    Create a data dictionary for insertion specific to loan use.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'loan_use': loan_use,
        'households': int(households),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to loan use.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, loan_use, households, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['loan_use']}',
        {data['households']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_households_loan_use table if it doesn't exist.
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
            ward_number INTEGER NOT NULL,
            loan_use TEXT NOT NULL,
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

def extract_loan_use_data(source_conn):
    """Extract households loan use data from source database."""
    logger.info("Extracting households loan use data")
    
    # Query to get ward and loan use purposes for households
    query = """
    SELECT 
        ward_no, 
        loan_use
    FROM 
        synthetic_survey_kerabari_family
    WHERE 
        loaned_organizations IS NOT NULL 
        AND NOT ('ऋण नलिएको' = ANY(loaned_organizations))
        AND loan_use IS NOT NULL;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} household records with loan use information")
    
    return df

def transform_loan_use_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming households loan use data")
    
    # Explode the loan_uses array if it's an array
    if df.empty:
        # Create empty dataframe with expected columns
        grouped_df = pd.DataFrame(columns=['ward_no', 'loan_use_mapped', 'households'])
        logger.warning("No loan use data found in source database")
    else:
        # Check if loan_uses is an array type
        if isinstance(df['loan_use'].iloc[0], list):
            exploded_df = df.explode('loan_use')
        else:
            # If not array, just use as is
            exploded_df = df.copy()
            exploded_df.rename(columns={'loan_use': 'loan_use'}, inplace=True)
        
        # Map Nepali loan uses to standardized enum values
        exploded_df['loan_use_mapped'] = exploded_df['loan_use'].apply(map_loan_use)

        # Group by ward and loan use to count households
        grouped_df = exploded_df.groupby(['ward_no', 'loan_use_mapped']).size().reset_index(name='households')
    
    logger.info(f"Transformed into {len(grouped_df)} ward-loan use combinations")
    
    return grouped_df

def load_loan_use_data(df, target_conn, generate_sql=True):
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
            loan_use=row['loan_use_mapped'],
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

def process_households_loan_use(source_conn, target_conn, generate_sql=True):
    """Process ward-wise households loan use data from extraction to loading."""
    logger.info("Processing ward-wise households loan use data")
    
    try:
        # Extract data
        df = extract_loan_use_data(source_conn)
        
        # Transform data
        transformed_df = transform_loan_use_data(df)
        
        # Load data
        load_loan_use_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise households loan use data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise households loan use data: {e}")
        return False
