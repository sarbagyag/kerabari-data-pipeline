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
TARGET_TABLE = "acme_ward_age_wise_population"

def get_age_group(age):
    """
    Map age to standardized age groups.
    """
    if age is None:
        return None
    
    try:
        age_val = int(age)
        if age_val < 5:
            return 'AGE_0_4'
        elif age_val < 10:
            return 'AGE_5_9'
        elif age_val < 15:
            return 'AGE_10_14'
        elif age_val < 20:
            return 'AGE_15_19'
        elif age_val < 25:
            return 'AGE_20_24'
        elif age_val < 30:
            return 'AGE_25_29'
        elif age_val < 35:
            return 'AGE_30_34'
        elif age_val < 40:
            return 'AGE_35_39'
        elif age_val < 45:
            return 'AGE_40_44'
        elif age_val < 50:
            return 'AGE_45_49'
        elif age_val < 55:
            return 'AGE_50_54'
        elif age_val < 60:
            return 'AGE_55_59'
        elif age_val < 65:
            return 'AGE_60_64'
        elif age_val < 70:
            return 'AGE_65_69'
        elif age_val < 75:
            return 'AGE_70_74'
        else:
            return 'AGE_75_AND_ABOVE'
    except (ValueError, TypeError):
        return None

def map_gender(nepali_gender):
    """
    Map Nepali gender terms to standardized enum values.
    """
    mapping = {
        'पुरुष': 'MALE',
        'महिला': 'FEMALE',
        'अन्य': 'OTHER'
    }
    
    # Clean up the input string
    clean_gender = nepali_gender.strip() if isinstance(nepali_gender, str) else nepali_gender
    
    # Return the mapped value if available, otherwise return 'OTHER'
    return mapping.get(clean_gender, 'OTHER')

def create_insert_data(ward_number, age_group, gender, population):
    """
    Create a data dictionary for insertion.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'age_group': age_group,
        'gender': gender,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, age_group, gender, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['age_group']}',
        '{data['gender']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_age_wise_population table if it doesn't exist.
    """
    return f"""
-- Set UTF-8 encoding for this script
SET client_encoding = 'UTF8';

-- Create age_group enum type if not exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'age_group') THEN
        CREATE TYPE age_group AS ENUM (
            'AGE_0_4',
            'AGE_5_9',
            'AGE_10_14',
            'AGE_15_19',
            'AGE_20_24',
            'AGE_25_29',
            'AGE_30_34',
            'AGE_35_39',
            'AGE_40_44',
            'AGE_45_49',
            'AGE_50_54',
            'AGE_55_59',
            'AGE_60_64',
            'AGE_65_69',
            'AGE_70_74',
            'AGE_75_AND_ABOVE'
        );
    END IF;
END
$$;

-- Create gender enum type if not exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'gender') THEN
        CREATE TYPE gender AS ENUM (
            'MALE',
            'FEMALE',
            'OTHER'
        );
    END IF;
END
$$;

-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE {TARGET_TABLE} (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            age_group age_group NOT NULL,
            gender gender NOT NULL,
            population INTEGER NOT NULL DEFAULT 0,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
        
        -- Create indexes for faster lookups
        CREATE INDEX idx_ward_age_gender ON {TARGET_TABLE}(ward_number, age_group, gender);
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
        RAISE NOTICE 'Ward age-wise population data inserted successfully';
    ELSE
        RAISE NOTICE 'Ward age-wise population data already exists, skipping insertion';
    END IF;
END
$$;
"""

def extract_age_wise_population_data(source_conn):
    """Extract age-wise population data from source database."""
    logger.info("Extracting age-wise population data")
    
    # Query to get ward, age, and gender for all individuals
    query = """
    SELECT 
        ward_no, 
        age,
        gender
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        age IS NOT NULL AND gender IS NOT NULL;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} individual records with age and gender information")
    
    return df

def transform_age_wise_population_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming age-wise population data")
    
    # Add age group column based on age
    df['age_group'] = df['age'].apply(get_age_group)
    
    # Map gender to standardized values
    df['gender_mapped'] = df['gender'].apply(map_gender)
    
    # Remove rows with missing age_group
    df = df.dropna(subset=['age_group'])
    
    # Group by ward, age group, and gender to count individuals
    grouped_df = df.groupby(['ward_no', 'age_group', 'gender_mapped']).size().reset_index(name='population')
    
    logger.info(f"Transformed into {len(grouped_df)} ward-age-gender combinations")
    
    return grouped_df

def load_age_wise_population_data(df, target_conn, generate_sql=True):
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
            gender=row['gender_mapped'],
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

def process_age_wise_population(source_conn, target_conn, generate_sql=True):
    """Process ward-age-wise population data from extraction to loading."""
    logger.info("Processing ward-age-wise population data")
    
    try:
        # Extract data
        df = extract_age_wise_population_data(source_conn)
        
        # Transform data
        transformed_df = transform_age_wise_population_data(df)
        
        # Load data
        load_age_wise_population_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-age-wise population data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-age-wise population data: {e}")
        return False
