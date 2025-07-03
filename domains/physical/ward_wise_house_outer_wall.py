import pandas as pd
import logging
import os
import psycopg2
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import PHYSICAL_SQL_DIR

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Wall type mappings
WALL_TYPE_MAPPING = {
    'सिमेन्टको जोडाइ भएको इँटा/ढुङ्गा': 'CEMENT_JOINED',
    'काँचो इँटा': 'UNBAKED_BRICK',
    'माटोको जोडाइ भएको इँटा/ढुङ्गा': 'MUD_JOINED',
    'जस्ता/टिन/च्यादर': 'TIN',
    'बाँसजन्य सामग्री': 'BAMBOO',
    'काठ/फल्याक': 'WOOD',
    'प्रि फ्याब': 'PREFAB',
    'अन्य (खुलाउने)': 'OTHER',
    # English variants
    'cement joined': 'CEMENT_JOINED',
    'unbaked brick': 'UNBAKED_BRICK',
    'mud joined': 'MUD_JOINED',
    'tin': 'TIN',
    'bamboo': 'BAMBOO',
    'wood': 'WOOD',
    'prefab': 'PREFAB',
    'other': 'OTHER',
    None: 'OTHER',
    '': 'OTHER'
}

TARGET_TABLE = 'acme_ward_wise_household_outer_wall'

def map_wall_type(wall_type):
    if not wall_type or pd.isna(wall_type):
        return 'OTHER'
    standardized = WALL_TYPE_MAPPING.get(wall_type)
    if standardized:
        return standardized
    wall_type_lower = str(wall_type).lower().strip()
    for key, value in WALL_TYPE_MAPPING.items():
        if key and isinstance(key, str) and key.lower() == wall_type_lower:
            return value
    logger.warning(f"Wall type '{wall_type}' not found in mapping. Using 'OTHER' as default.")
    return 'OTHER'

def extract_house_outer_wall_data(source_conn):
    logger.info("Extracting house outer wall data now")
    query = """
    SELECT
        ward_id,
        outer_wall,
        COUNT(*) as households
    FROM
        synthetic_survey_kerabari_building
    WHERE
        outer_wall IS NOT NULL
    GROUP BY
        ward_id, outer_wall
    ORDER BY
        ward_id, outer_wall
    """
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} rows of house outer wall data")
    return df

def transform_house_outer_wall_data(df):
    logger.info("Transforming house outer wall data now")
    
    # Clean the data by removing rows with NA or infinite values
    initial_count = len(df)
    df = df.dropna(subset=['ward_id', 'households'])
    df = df[df['ward_id'].notna() & df['households'].notna()]
    
    # Remove infinite values
    df = df[~df['ward_id'].isin([float('inf'), float('-inf')])]
    df = df[~df['households'].isin([float('inf'), float('-inf')])]
    
    cleaned_count = len(df)
    if initial_count != cleaned_count:
        logger.warning(f"Removed {initial_count - cleaned_count} rows with NA or infinite values")
    
    # Convert to integers safely
    df['ward_id'] = df['ward_id'].astype(int)
    df['wall_type_mapped'] = df['outer_wall'].apply(map_wall_type)
    df['households'] = df['households'].astype(int)
    
    # Group by ward_id and wall_type_mapped, summing households
    grouped_df = df.groupby(['ward_id', 'wall_type_mapped'])['households'].sum().reset_index()
    logger.info(f"Transformed data into {len(grouped_df)} ward-wall type combinations")
    return grouped_df

def create_insert_data(ward_number, wall_type, households):
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'wall_type': wall_type,
        'households': int(households),
        'created_at': get_current_timestamp(),
        'updated_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, wall_type, households, created_at, updated_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['wall_type']}',
        {data['households']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
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
            wall_type VARCHAR(100) NOT NULL,
            households INTEGER NOT NULL,
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
    return """
    END IF;
END
$$;
"""

def load_house_outer_wall_data(df, target_conn, generate_sql=True):
    logger.info(f"Loading data into {TARGET_TABLE}")
    if table_exists(target_conn, TARGET_TABLE) and table_has_data(target_conn, TARGET_TABLE):
        logger.info(f"Table {TARGET_TABLE} already exists and has data. Skipping insertion.")
        return False
    insert_data = []
    insert_statements = []
    for _, row in df.iterrows():
        data = create_insert_data(
            ward_number=row['ward_id'],
            wall_type=row['wall_type_mapped'],
            households=row['households']
        )
        insert_data.append(data)
        statement = generate_insert_statement(data)
        insert_statements.append(statement)
    if generate_sql:
        full_sql_script = []
        full_sql_script.append(generate_table_create_statement())
        full_sql_script.extend(insert_statements)
        full_sql_script.append(generate_closing_statement())
        sql_file_path = os.path.join(PHYSICAL_SQL_DIR, f"{TARGET_TABLE}.sql")
        save_sql_to_file(full_sql_script, sql_file_path)
        logger.info(f"SQL file generated at {sql_file_path}")
    success = insert_data_to_db(target_conn, insert_statements)
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    return success

def process_ward_wise_house_outer_wall(source_conn, target_conn, generate_sql=True):
    logger.info("Processing ward-wise house outer wall data")
    try:
        df = extract_house_outer_wall_data(source_conn)
        transformed_df = transform_house_outer_wall_data(df)
        load_house_outer_wall_data(transformed_df, target_conn, generate_sql)
        logger.info("Completed processing ward-wise house outer wall data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise house outer wall data: {e}")
        return False

if __name__ == "__main__":
    # For standalone testing only
    import os
    
    # Configuration from environment variables
    source_config = {
        "host": os.getenv("SOURCE_DB_HOST", "localhost"),
        "database": os.getenv("SOURCE_DB_NAME", "lungri_db"),
        "user": os.getenv("SOURCE_DB_USER", "postgres"),
        "password": os.getenv("SOURCE_DB_PASSWORD", "postgres")
    }
    
    target_config = {
        "host": os.getenv("TARGET_DB_HOST", "localhost"),
        "database": os.getenv("TARGET_DB_NAME", "lungri_db"),
        "user": os.getenv("TARGET_DB_USER", "postgres"),
        "password": os.getenv("TARGET_DB_PASSWORD", "postgres")
    }
    
    source_conn = psycopg2.connect(**source_config)  # type: ignore
    target_conn = psycopg2.connect(**target_config)  # type: ignore
    
    try:
        process_ward_wise_house_outer_wall(source_conn, target_conn, generate_sql=False)
    finally:
        source_conn.close()
        target_conn.close()