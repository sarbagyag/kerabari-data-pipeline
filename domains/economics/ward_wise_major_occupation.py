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
TARGET_TABLE = "acme_ward_wise_major_occupation"

def map_occupation(nepali_occupation):
    """
    Map Nepali occupation types to standardized enum values.
    """
    mapping = {
        'सरकारी नोकरी / जागिर': 'governmental_job',
        'गैरसरकारी नोकरी / जागिर': 'non_governmental_job',
        'ज्याला/ मजदुरी': 'labour',
        'वैदेशिक रोजगारी': 'foreign_employment',
        'व्यापार': 'business',
        'अन्य रोजगारी': 'other',
        'विद्यार्थी': 'student',
        'गृहणी': 'householder',
        'अन्य बेरोजगार': 'other_unemployment',
        'उद्योग, व्यापार, कृषि': 'industry',
        'पशुपालन': 'animal_husbandry',
        'अन्य स्वरोजगार': 'other_self_employment',
        'अन्य': 'other'
    }
    
    # Clean up the input string by removing whitespace
    clean_occupation = nepali_occupation.strip() if isinstance(nepali_occupation, str) else nepali_occupation
    
    # Return the mapped value if available, otherwise return 'OTHER'
    return mapping.get(clean_occupation, 'OTHER')

def create_insert_data(ward_number, occupation, population):
    """
    Create a data dictionary for insertion specific to major occupation.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'occupation': occupation,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to major occupation.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, occupation, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['occupation']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_major_occupation table if it doesn't exist.
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
            occupation TEXT NOT NULL,
            population INTEGER NOT NULL DEFAULT 0 CHECK (population >= 0),
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

def extract_major_occupation_data(source_conn):
    """Extract major occupation data from source database."""
    logger.info("Extracting major occupation data")
    
    # Query to get ward and major occupation for individuals
    query = """
    SELECT 
        ward_no, 
        primary_occupation,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        primary_occupation IS NOT NULL
    GROUP BY 
        ward_no, primary_occupation
    ORDER BY 
        ward_no, primary_occupation;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted occupation data with {len(df)} ward-occupation combinations")
    
    return df

def transform_major_occupation_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming major occupation data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map Nepali occupation types to standardized enum values
    df['occupation_mapped'] = df['primary_occupation'].apply(map_occupation)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward and mapped occupation to sum populations (in case multiple Nepali terms map to same enum)
    grouped_df = df.groupby(['ward_no', 'occupation_mapped'])['population'].sum().reset_index()
    
    logger.info(f"Transformed major occupation data with {len(grouped_df)} ward-occupation combinations")
    
    return grouped_df

def load_major_occupation_data(df, target_conn, generate_sql=True):
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
            occupation=row['occupation_mapped'],
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
        sql_file_path = os.path.join(ECONOMICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_major_occupation(source_conn, target_conn, generate_sql=True):
    """Process ward-wise major occupation data from extraction to loading."""
    logger.info("Processing ward-wise major occupation data")
    
    try:
        # Extract data
        df = extract_major_occupation_data(source_conn)
        
        # Transform data
        transformed_df = transform_major_occupation_data(df)
        
        # Load data
        load_major_occupation_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise major occupation data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise major occupation data: {e}")
        return False
