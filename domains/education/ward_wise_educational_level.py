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
TARGET_TABLE = "acme_ward_wise_educational_level"

def map_educational_level(nepali_level):
    """
    Map Nepali education level names to standardized enum values.
    """
    mapping = {
        'बालविकास केन्द्र / मंटेस्वोरी': 'CHILD_DEVELOPMENT_CENTER',
        'नर्सरी/केजी ': 'NURSERY',
        'कक्षा १ ': '1',
        'कक्षा २ ': '2',
        'कक्षा ३ ': '3',
        'कक्षा ४ ': '4',
        'कक्षा ५ ': '5',
        'कक्षा ६ ': '6',
        'कक्षा ७ ': '7',
        'कक्षा ८ ': '8',
        'कक्षा ९ ': '9',
        'कक्षा १० ': '10',
        'एसईई/एसएलसी/सो सरह ': 'SLC_LEVEL',
        'कक्षा १२ वा PCL वा सो सरह ': 'CLASS_12_LEVEL',
        'स्नातक वा सो सरह ': 'BACHELOR_LEVEL',
        'स्नातकोत्तर वा सो सरह ': 'MASTERS_LEVEL',
        'पीएचडी वा सो सरह ': 'PHD_LEVEL',
        'अनौपचारिक शिक्षा ': 'INFORMAL_EDUCATION',
        'साक्षर ': 'EDUCATED',
        'अन्य ': 'OTHER',
        'थाहा नभएको ': 'UNKNOWN',
    }
    # Do not strip, match exactly as in enum
    return mapping.get(nepali_level, 'UNKNOWN')

def create_insert_data(ward_number, educational_level_type, population):
    """
    Create a data dictionary for insertion specific to educational level.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'educational_level_type': educational_level_type,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to educational level.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, educational_level_type, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['educational_level_type']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_educational_level table if it doesn't exist.
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
            educational_level_type VARCHAR(100) NOT NULL,
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

def extract_educational_level_data(source_conn):
    """Extract educational level data from source database."""
    logger.info("Extracting educational level data")
    
    # Query to get ward and education levels for individuals
    query = """
    SELECT 
        ward_no, 
        educational_level,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        educational_level IS NOT NULL
    GROUP BY 
        ward_no, educational_level
    ORDER BY 
        ward_no, educational_level;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} ward-education level combinations")
    
    return df

def transform_educational_level_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming educational level data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map Nepali education levels to standardized enum values
    df['educational_level_mapped'] = df['educational_level'].apply(map_educational_level)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward and mapped education level to sum populations 
    # (in case multiple Nepali terms map to same enum)
    grouped_df = df.groupby(['ward_no', 'educational_level_mapped'])['population'].sum().reset_index()
    
    logger.info(f"Transformed into {len(grouped_df)} ward-education level combinations")
    
    return grouped_df

def load_educational_level_data(df, target_conn, generate_sql=True):
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
            educational_level_type=row['educational_level_mapped'],
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

def process_educational_level(source_conn, target_conn, generate_sql=True):
    """Process ward-wise educational level data from extraction to loading."""
    logger.info("Processing ward-wise educational level data")
    
    try:
        # Extract data
        df = extract_educational_level_data(source_conn)
        
        # Transform data
        transformed_df = transform_educational_level_data(df)
        
        # Load data
        load_educational_level_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise educational level data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise educational level data: {e}")
        return False
