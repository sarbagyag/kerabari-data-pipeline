import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import SOCIAL_SQL_DIR

# Setting up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'   
)

logger = logging.getLogger(__name__)

# Gender mappings
GENDER_MAPPING = {
    'पुरुष': 'MALE',
    'महिला': 'FEMALE',
    'अन्य': 'OTHER',
    
    # English variants
    'male': 'MALE',
    'female': 'FEMALE',
    'other': 'OTHER',
    
    # Handle nulls and empty strings
    None: 'OTHER',
    '': 'OTHER'
}

# Define elderly age threshold (60 years and above in Nepal)
ELDERLY_AGE_THRESHOLD = 60

# Marital status indicating widowed
WIDOWED_STATUS = ['विधुर/विधवा', 'widowed', 'widow', 'विधवा']

TARGET_TABLE = 'acme_ward_wise_old_age_population_and_single_women'

def map_gender(gender):
    """Map gender values to standardized enum values."""
    if not gender or pd.isna(gender):
        return "OTHER"
    
    # Try direct mapping
    standardized = GENDER_MAPPING.get(gender)
    if standardized:
        return standardized
    
    # Try lowercase matching
    gender_lower = str(gender).lower().strip()
    for key, value in GENDER_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == gender_lower:
            return value
    
    # Default
    logger.warning(f"Gender '{gender}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def is_widowed(marital_status):
    """Check if a person is widowed based on marital status."""
    if not marital_status or pd.isna(marital_status):
        return False
    
    marital_status_lower = str(marital_status).lower().strip()
    return any(status.lower() in marital_status_lower for status in WIDOWED_STATUS)

def extract_population_data(source_conn):
    """Extracts old age population and single women data from the database."""
    logger.info("Extracting old age population and single women data now")

    query = """
    SELECT
        ward_no,
        gender,
        age,
        marital_status
    FROM
        synthetic_survey_kerabari_individual
    WHERE
        age IS NOT NULL
    """

    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} individual records")
    return df

def transform_population_data(df):
    logger.info("Transforming population data now")

    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map gender to standardized values
    df['gender_mapped'] = df['gender'].apply(map_gender)
    
    # Convert age to numeric values
    df['age'] = pd.to_numeric(df['age'], errors='coerce')
    
    # Create indicator columns
    df['is_elderly'] = df['age'] >= ELDERLY_AGE_THRESHOLD
    df['is_widowed'] = df['marital_status'].apply(is_widowed)
    df['is_single_woman'] = (df['gender_mapped'] == 'FEMALE') & df['is_widowed']
    
    # Group by ward and calculate aggregates
    result_data = []
    for ward, group in df.groupby('ward_no'):
        male_elderly = sum((group['gender_mapped'] == 'MALE') & group['is_elderly'])
        female_elderly = sum((group['gender_mapped'] == 'FEMALE') & group['is_elderly'])
        single_women = sum(group['is_single_woman'])
        
        result_data.append({
            'ward_no': ward,
            'male_old_age_population': male_elderly,
            'female_old_age_population': female_elderly,
            'single_women_population': single_women
        })
    
    result_df = pd.DataFrame(result_data)
    logger.info(f"Transformed data into {len(result_df)} ward-wise population records")
    return result_df

def create_insert_data(ward_number, male_elderly, female_elderly, single_women):
    """Create a data dictionary for insertion specific to old age and single women data."""
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'male_old_age_population': int(male_elderly),
        'female_old_age_population': int(female_elderly),
        'single_women_population': int(single_women),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """Generate an SQL insert statement from a data dictionary specific to old age and single women data."""
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, male_old_age_population, female_old_age_population, single_women_population, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        {data['male_old_age_population']},
        {data['female_old_age_population']},
        {data['single_women_population']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """Generate SQL to create the ward_wise_old_age_population_and_single_women table if it doesn't exist."""
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
            male_old_age_population INTEGER NOT NULL,
            female_old_age_population INTEGER NOT NULL,
            single_women_population INTEGER NOT NULL,
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

def load_population_data(df, target_conn, generate_sql=True):
    """Load the transformed old age and single women data into the target database."""
    logger.info(f"Loading data into {TARGET_TABLE}")

    # Check if table exists and has data
    if table_exists(target_conn, TARGET_TABLE) and table_has_data(target_conn, TARGET_TABLE):
        logger.info(f"Table {TARGET_TABLE} already exists and has data. Skipping insertion.")
        return False

    # Prepare insert data and statements
    insert_data = []
    insert_statements = []

    for _, row in df.iterrows():
        # Create data dictionary
        data = create_insert_data(
            ward_number=row['ward_no'],
            male_elderly=row['male_old_age_population'],
            female_elderly=row['female_old_age_population'],
            single_women=row['single_women_population']
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
        sql_file_path = os.path.join(SOCIAL_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
        logger.info(f"SQL file generated at {sql_file_path}")
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_ward_wise_old_male_female_and_single_woman(source_conn, target_conn, generate_sql=True):
    """Process ward-wise old age population and single women data from extraction to loading."""
    logger.info("Processing ward-wise old age population and single women data")
    
    try:
        # Extract data
        df = extract_population_data(source_conn)
        
        # Transform data
        transformed_df = transform_population_data(df)
        
        # Load data
        load_population_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise old age population and single women data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise old age population and single women data: {e}")
        return False
