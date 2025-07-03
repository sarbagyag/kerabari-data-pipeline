import pandas as pd
import logging
import os
import uuid
from datetime import datetime
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
TARGET_TABLE = "acme_ward_wise_household_income_source"

def map_income_source(nepali_source):
    """
    Map Nepali income source names to standardized enum values specific to income sources.
    
    This is domain-specific logic for income sources aligned with the occupations enum.
    """
    mapping = {
        'नोकरी/जागिर': 'JOB',
        'सरकारी नोकरी / जागिर': 'GOVERNMENTAL_JOB',
        'गैरसरकारी नोकरी / जागिर': 'NON_GOVERNMENTAL_JOB',
        'कृषि': 'AGRICULTURE',
        'पशुपालन': 'ANIMAL_HUSBANDRY',
        'व्यापार व्यवसाय': 'BUSINESS',
        'व्यापार': 'BUSINESS',
        'उद्योग': 'INDUSTRY',
        'उद्योग, व्यापार, कृषि': 'INDUSTRY',
        'वैदेशिक रोजगारी': 'FOREIGN_EMPLOYMENT',
        'वैदेशिक रोजगारी ': 'FOREIGN_EMPLOYMENT',  # Note the trailing space
        'ज्याला मजदुरी': 'LABOUR',
        'ज्याला/ मजदुरी': 'LABOUR',
        'अन्य रोजगारी': 'OTHER_EMPLOYMENT',
        'अन्य स्वरोजगार': 'OTHER_SELF_EMPLOYMENT',
        'अन्य बेरोजगार': 'OTHER_UNEMPLOYMENT',
        'अन्य (खुलाउने)': 'OTHER',
        'अन्य': 'OTHER',
        'विद्यार्थी': 'STUDENT',
        'गृहणी': 'HOUSEHOLDER'
    }
    
    # Clean up the input string by removing whitespace
    clean_source = nepali_source.strip() if isinstance(nepali_source, str) else nepali_source
    
    # Return the mapped value if available, otherwise return 'OTHER'
    return mapping.get(clean_source, 'OTHER')

def create_insert_data(ward_number, income_source, households):
    """
    Create a data dictionary for insertion specific to income sources.
    
    This is domain-specific logic for income sources.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'income_source': income_source,
        'households': int(households),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to income sources.
    
    This is domain-specific logic for income sources.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, income_source, households, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['income_source']}',
        {data['households']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_household_income_source table if it doesn't exist.
    
    This is domain-specific logic for income sources.
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
            income_source TEXT NOT NULL,
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

def extract_income_source_data(source_conn):
    """Extract household income source data from source database."""
    logger.info("Extracting household income source data")
    
    # Query to get ward and income sources for each household
    query = """
    SELECT 
        ward_no, 
        income_sources
    FROM 
        synthetic_survey_kerabari_family
    WHERE 
        income_sources IS NOT NULL AND array_length(income_sources, 1) > 0;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} household records with income sources")
    
    return df

def transform_income_source_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming household income source data")
    
    # Explode the income_sources array into rows
    exploded_df = df.explode('income_sources')
    
    # Map Nepali income sources to standardized enum values
    exploded_df['income_source_mapped'] = exploded_df['income_sources'].apply(map_income_source)
    
    # Group by ward and income source to count households
    grouped_df = exploded_df.groupby(['ward_no', 'income_source_mapped']).size().reset_index(name='households')
    
    logger.info(f"Transformed into {len(grouped_df)} ward-income source combinations")
    
    return grouped_df

def load_income_source_data(grouped_df, target_conn, generate_sql=True):
    """Load the transformed data into the target database and optionally generate SQL file."""
    logger.info(f"Preparing to load data into {TARGET_TABLE}")
    
    # Check if table exists and has data
    if table_exists(target_conn, TARGET_TABLE) and table_has_data(target_conn, TARGET_TABLE):
        logger.info(f"Table {TARGET_TABLE} already exists and has data. Skipping insertion.")
        return False
    
    # Prepare insert data
    insert_data = []
    insert_statements = []
    
    for _, row in grouped_df.iterrows():
        # Create data dictionary
        data = create_insert_data(
            ward_number=row['ward_no'],
            income_source=row['income_source_mapped'],
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
        logger.info("""Yo yo yo: ${ECONOMICS_SQL_DIR}""")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_income_sources(source_conn, target_conn, generate_sql=True):
    """Process household income sources data from extraction to loading."""
    logger.info("Processing household income sources data")
    
    try:
        # Extract data
        df = extract_income_source_data(source_conn)
        
        # Transform data
        transformed_df = transform_income_source_data(df)
        
        # Load data
        load_income_source_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing household income sources data")
        return True
    except Exception as e:
        logger.error(f"Error processing household income sources data: {e}")
        return False
