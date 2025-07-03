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
TARGET_TABLE = "acme_ward_wise_religion_population"

def map_religion_type(nepali_religion):
    """
    Map Nepali religion names to standardized enum values.
    """
    mapping = {
        'हिन्दु': 'HINDU',
        'बौद्ध मार्गी': 'BUDDHIST',
        'किराँत': 'KIRANT',
        'क्रिश्चियन': 'CHRISTIAN',
        'ईस्लाम': 'ISLAM',
        'प्रकृति': 'NATURE',
        'बोन': 'BON',
        'जैन': 'JAIN',
        'बहाई': 'BAHAI',
        'शिख': 'SIKH',
        'उल्लेख नभएको': 'OTHER',
        'अन्य': 'OTHER'
    }
    
    # Clean up the input string by removing whitespace
    clean_religion = nepali_religion.strip() if isinstance(nepali_religion, str) else nepali_religion
    
    # Return the mapped value if available, otherwise return 'OTHER'
    return mapping.get(clean_religion, 'OTHER')

def create_insert_data(ward_number, religion_type, population):
    """
    Create a data dictionary for insertion specific to religion population.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'religion_type': religion_type,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to religion population.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, religion_type, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['religion_type']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_religion_population table if it doesn't exist.
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
            religion_type VARCHAR(100) NOT NULL,
            population INTEGER,
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

def extract_religion_population_data(source_conn):
    """Extract religion population data from source database."""
    logger.info("Extracting religion population data")
    
    # Query to get ward and religion counts
    query = """
    SELECT 
        ward_no, 
        religion,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        religion IS NOT NULL
    GROUP BY 
        ward_no, religion
    ORDER BY 
        ward_no, religion;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted religion population data with {len(df)} ward-religion combinations")
    
    return df

def transform_religion_population_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming religion population data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map Nepali religion names to standardized enum values
    df['religion_type_mapped'] = df['religion'].apply(map_religion_type)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward and mapped religion to sum populations
    # (in case multiple Nepali terms map to same enum)
    grouped_df = df.groupby(['ward_no', 'religion_type_mapped'])['population'].sum().reset_index()
    
    logger.info(f"Transformed into {len(grouped_df)} ward-religion combinations")
    
    return grouped_df

def load_religion_population_data(df, target_conn, generate_sql=True):
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
            religion_type=row['religion_type_mapped'],
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
        sql_file_path = os.path.join(DEMOGRAPHICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_religion_population(source_conn, target_conn, generate_sql=True):
    """Process ward-wise religion population data from extraction to loading."""
    logger.info("Processing ward-wise religion population data")
    
    try:
        # Extract data
        df = extract_religion_population_data(source_conn)
        
        # Transform data
        transformed_df = transform_religion_population_data(df)
        
        # Load data
        load_religion_population_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise religion population data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise religion population data: {e}")
        return False
