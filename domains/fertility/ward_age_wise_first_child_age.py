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
TARGET_TABLE = "acme_ward_age_wise_first_child_birth_age"

# Define age group mapping for first childbirth
def map_to_age_group(age):
    """Map exact age to age group enum value for first childbirth."""
    try:
        age = int(age)
        if 15 <= age <= 19:
            return "AGE_15_19"
        elif 20 <= age <= 24:
            return "AGE_20_24"
        elif 25 <= age <= 29:
            return "AGE_25_29"
        elif 30 <= age <= 34:
            return "AGE_30_34"
        elif 35 <= age <= 39:
            return "AGE_35_39"
        elif 40 <= age <= 44:
            return "AGE_40_44"
        elif 45 <= age <= 49:
            return "AGE_45_49"
        else:
            return None  # Outside our defined age groups
    except (ValueError, TypeError):
        return None  # Age could not be converted to int

def create_insert_data(ward_number, age_group, population):
    """
    Create a data dictionary for insertion specific to first child birth age.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'first_child_birth_age_group': age_group,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to first child birth age.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, first_child_birth_age_group, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['first_child_birth_age_group']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    )
    ON CONFLICT (ward_number, first_child_birth_age_group) 
    DO NOTHING;
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_age_wise_first_child_birth_age table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    -- First create the enum type if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_type WHERE typname = 'first_child_birth_age_group'
    ) THEN
        CREATE TYPE first_child_birth_age_group AS ENUM (
            'AGE_15_19',
            'AGE_20_24',
            'AGE_25_29',
            'AGE_30_34',
            'AGE_35_39',
            'AGE_40_44',
            'AGE_45_49'
        );
    END IF;

    -- Then create the table if it doesn't exist
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE {TARGET_TABLE} (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            first_child_birth_age_group first_child_birth_age_group NOT NULL,
            population INTEGER NOT NULL,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW(),
            UNIQUE(ward_number, first_child_birth_age_group)
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

def extract_first_child_age_data(source_conn):
    """Extract data on women's age at first childbirth from source database."""
    logger.info("Extracting first child birth age data")
    
    # Query to get ward, first delivery age and count
    query = """
    SELECT 
        ward_no,
        first_delivery_age,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        gender = 'महिला' AND
        first_delivery_age IS NOT NULL AND
        first_delivery_age > 0
    GROUP BY 
        ward_no, first_delivery_age
    ORDER BY 
        ward_no, first_delivery_age;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted first child birth age data with {len(df)} records")
    
    return df

def transform_first_child_age_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming first child birth age data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map delivery age to age groups
    df['age_group'] = df['first_delivery_age'].apply(map_to_age_group)
    
    # Filter out rows where age couldn't be mapped to our groups
    df = df[df['age_group'].notnull()]
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward and age group to sum populations
    grouped_df = df.groupby(['ward_no', 'age_group'])['population'].sum().reset_index()
    
    logger.info(f"Transformed first child birth age data with {len(grouped_df)} ward-age group combinations")
    
    return grouped_df

def load_first_child_age_data(df, target_conn, generate_sql=True):
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
            age_group=row['age_group'],
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

def process_first_child_age(source_conn, target_conn, generate_sql=True):
    """Process ward-age-wise first child birth age data from extraction to loading."""
    logger.info("Processing ward-age-wise first child birth age data")
    
    try:
        # Extract data
        df = extract_first_child_age_data(source_conn)
        
        # Transform data
        transformed_df = transform_first_child_age_data(df)
        
        # Load data
        load_first_child_age_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-age-wise first child birth age data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-age-wise first child birth age data: {e}")
        return False
