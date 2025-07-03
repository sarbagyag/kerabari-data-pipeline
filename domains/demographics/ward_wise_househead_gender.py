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
TARGET_TABLE = "acme_ward_wise_househead_gender"

def map_gender(nepali_gender):
    """
    Map Nepali gender terms to standardized enum values.
    """
    mapping = {
        'पुरुष': 'MALE',
        'महिला': 'FEMALE',
        'अन्य': 'OTHER'
    }
    
    # Clean up the input string by removing whitespace
    clean_gender = nepali_gender.strip() if isinstance(nepali_gender, str) else nepali_gender
    
    # Return the mapped value if available, otherwise return 'OTHER'
    return mapping.get(clean_gender, 'OTHER')

def create_insert_data(ward_number, gender, population, ward_name=None):
    """
    Create a data dictionary for insertion specific to househead gender.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'ward_name': ward_name,
        'gender': gender,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to househead gender.
    Uses parameterized queries to prevent SQL injection.
    """
    # Escape single quotes in string values
    def escape_sql_string(value):
        if value is None:
            return "NULL"
        if isinstance(value, str):
            return f"'{value.replace("'", "''")}'"
        return str(value)
    
    ward_name_value = escape_sql_string(data['ward_name'])
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, ward_name, gender, population, updated_at, created_at)
    VALUES (
        {escape_sql_string(data['id'])},
        {data['ward_number']},
        {ward_name_value},
        {escape_sql_string(data['gender'])},
        {data['population']},
        {escape_sql_string(data['updated_at'])},
        {escape_sql_string(data['created_at'])}
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_househead_gender table if it doesn't exist.
    """
    return f"""
-- Set UTF-8 encoding for this script
SET client_encoding = 'UTF8';

-- Create gender enum type if not exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'gender') THEN
        CREATE TYPE gender AS ENUM ('MALE', 'FEMALE', 'OTHER');
    END IF;
END
$$;

-- Create {TARGET_TABLE} table if not exists
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}') THEN
        CREATE TABLE {TARGET_TABLE} (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            ward_name VARCHAR(100),
            gender gender NOT NULL,
            population INTEGER NOT NULL DEFAULT 0,
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW()
        );
        
        -- Create index for faster lookups by ward number and gender
        CREATE INDEX idx_{TARGET_TABLE}_ward_gender ON {TARGET_TABLE}(ward_number, gender);
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

def extract_househead_gender_data(source_conn):
    """Extract household head gender data from source database by matching family heads with individuals."""
    logger.info("Extracting household head gender data")
    
    # First, let's try a simpler approach - exact name matching first
    query = """
    WITH exact_matches AS (
        SELECT DISTINCT
            f.ward_no,
            f.head_name,
            i.gender,
            1 as match_priority
        FROM 
            synthetic_survey_kerabari_family f
        INNER JOIN 
            synthetic_survey_kerabari_individual i 
            ON f.ward_no = i.ward_no 
            AND UPPER(TRIM(f.head_name)) = UPPER(TRIM(i.name))
        WHERE 
            f.head_name IS NOT NULL 
            AND i.name IS NOT NULL 
            AND i.gender IS NOT NULL
            AND TRIM(f.head_name) != ''
            AND TRIM(i.name) != ''
    ),
    partial_matches AS (
        SELECT DISTINCT
            f.ward_no,
            f.head_name,
            i.gender,
            2 as match_priority
        FROM 
            synthetic_survey_kerabari_family f
        INNER JOIN 
            synthetic_survey_kerabari_individual i 
            ON f.ward_no = i.ward_no 
            AND (
                UPPER(TRIM(f.head_name)) LIKE '%' || UPPER(TRIM(i.name)) || '%' OR
                UPPER(TRIM(i.name)) LIKE '%' || UPPER(TRIM(f.head_name)) || '%'
            )
        WHERE 
            f.head_name IS NOT NULL 
            AND i.name IS NOT NULL 
            AND i.gender IS NOT NULL
            AND TRIM(f.head_name) != ''
            AND TRIM(i.name) != ''
            AND NOT EXISTS (
                SELECT 1 FROM exact_matches e 
                WHERE e.ward_no = f.ward_no AND e.head_name = f.head_name
            )
    ),
    all_matches AS (
        SELECT ward_no, head_name, gender, match_priority FROM exact_matches
        UNION ALL
        SELECT ward_no, head_name, gender, match_priority FROM partial_matches
    ),
    ranked_matches AS (
        SELECT 
            ward_no,
            head_name,
            gender,
            ROW_NUMBER() OVER (PARTITION BY ward_no, head_name ORDER BY match_priority) as rn
        FROM all_matches
    )
    SELECT 
        ward_no,
        gender,
        COUNT(*) as population
    FROM 
        ranked_matches
    WHERE 
        rn = 1
    GROUP BY 
        ward_no, gender
    ORDER BY 
        ward_no, gender;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted household head gender data with {len(df)} ward-gender combinations")
    
    return df

def transform_househead_gender_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming household head gender data")
    
    # Validate input DataFrame
    if df is None or df.empty:
        logger.warning("No data to transform")
        return pd.DataFrame()
    
    # Ensure required columns exist
    required_columns = ['ward_no', 'gender', 'population']
    missing_columns = [col for col in required_columns if col not in df.columns]
    if missing_columns:
        logger.error(f"Missing required columns: {missing_columns}")
        return pd.DataFrame()
    
    # Remove rows with null values in required columns
    df = df.dropna(subset=required_columns)
    
    if df.empty:
        logger.warning("No valid data after removing null values")
        return pd.DataFrame()
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map Nepali gender terms to standardized enum values
    df['gender_mapped'] = df['gender'].apply(map_gender)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Remove rows with invalid data
    df = df.dropna(subset=['ward_no', 'gender_mapped', 'population'])
    
    logger.info(f"Transformed household head gender data with {len(df)} ward-gender combinations")
    
    return df

def load_househead_gender_data(df, target_conn, generate_sql=True):
    """Load the transformed data into the target database and optionally generate SQL file."""
    logger.info(f"Preparing to load data into {TARGET_TABLE}")
    
    # Validate input DataFrame
    if df is None or df.empty:
        logger.warning("No data to load")
        return False
    
    # Check if table exists and has data
    if table_exists(target_conn, TARGET_TABLE) and table_has_data(target_conn, TARGET_TABLE):
        logger.info(f"Table {TARGET_TABLE} already exists and has data. Skipping insertion.")
        return True  # Return True since this is a successful state
    
    # Prepare insert data
    insert_data = []
    insert_statements = []
    
    for _, row in df.iterrows():
        try:
            # Create data dictionary
            data = create_insert_data(
                ward_number=row['ward_no'],
                gender=row['gender_mapped'],
                population=row['population']
            )
            insert_data.append(data)
            
            # Generate SQL statement
            statement = generate_insert_statement(data)
            insert_statements.append(statement)
        except Exception as e:
            logger.error(f"Error processing row {row}: {e}")
            continue
    
    if not insert_statements:
        logger.warning("No valid insert statements generated")
        return False
    
    # Save SQL to file if requested
    if generate_sql:
        try:
            # Create the full SQL script with create table and conditional insertion
            full_sql_script = []
            full_sql_script.append(generate_table_create_statement())
            full_sql_script.extend(insert_statements)
            full_sql_script.append(generate_closing_statement())
            
            # Define the output file path
            sql_file_path = os.path.join(DEMOGRAPHICS_SQL_DIR, f"{TARGET_TABLE}.sql")
            
            # Save to file
            save_sql_to_file(full_sql_script, sql_file_path)
        except Exception as e:
            logger.error(f"Error saving SQL file: {e}")
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_househead_gender(source_conn, target_conn, generate_sql=True):
    """Process ward-wise household head gender data from extraction to loading."""
    logger.info("Processing ward-wise household head gender data")
    
    try:
        # Extract data
        df = extract_househead_gender_data(source_conn)
        
        if df is None or df.empty:
            logger.warning("No data extracted from source")
            return False
        
        # Transform data
        transformed_df = transform_househead_gender_data(df)
        
        if transformed_df.empty:
            logger.warning("No data after transformation")
            return False
        
        # Load data
        success = load_househead_gender_data(transformed_df, target_conn, generate_sql)
        
        if success:
            logger.info("Completed processing ward-wise household head gender data")
        else:
            logger.error("Failed to load ward-wise household head gender data")
        
        return success
    except Exception as e:
        logger.error(f"Error processing ward-wise household head gender data: {e}")
        return False
