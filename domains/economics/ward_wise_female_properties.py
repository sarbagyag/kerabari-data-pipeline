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

TARGET_TABLE = "acme_ward_wise_female_properties"

# Enum mapping
PROPERTY_TYPE_MAP = {
    'घरमात्र भएको': 'HOUSE_ONLY',
    'जग्गा मात्र भएको': 'LAND_ONLY',
    'घर र जग्गा दुवै भएको': 'BOTH_HOUSE_AND_LAND',
    'घर र जग्गा दुवै नभएको': 'NEITHER_HOUSE_NOR_LAND',
}

def map_property_type(nepali_type):
    clean_type = nepali_type.strip() if isinstance(nepali_type, str) else nepali_type
    return PROPERTY_TYPE_MAP.get(clean_type, 'UNKNOWN')

def create_insert_data(ward_number, ward_name, property_type, ownership_type, count, population):
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'ward_name': ward_name if ward_name else None,
        'property_type': property_type,
        'ownership_type': ownership_type if ownership_type else None,
        'count': int(count),
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, ward_name, property_type, ownership_type, count, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        {repr(data['ward_name']) if data['ward_name'] else 'NULL'},
        '{data['property_type']}',
        {repr(data['ownership_type']) if data['ownership_type'] else 'NULL'},
        {data['count']},
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
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
            ward_name VARCHAR(100),
            property_type VARCHAR(100) NOT NULL,
            ownership_type VARCHAR(50),
            count INTEGER DEFAULT 0 NOT NULL,
            population INTEGER DEFAULT 0 NOT NULL,
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

def extract_female_properties_data(source_conn):
    logger.info("Extracting female properties data")
    query = """
    SELECT 
        ward_no, 
        female_properties,
        COUNT(*) as count,
        COUNT(DISTINCT id) as population
    FROM 
        synthetic_survey_kerabari_family
    WHERE 
        female_properties IS NOT NULL AND female_properties != ''
    GROUP BY 
        ward_no, female_properties
    ORDER BY 
        ward_no, female_properties;
    """
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} ward-property combinations")
    return df

def transform_female_properties_data(df):
    logger.info("Transforming female properties data")
    df['property_type'] = df['female_properties'].apply(map_property_type)
    df['count'] = df['count'].astype(int)
    df['population'] = df['population'].astype(int)
    logger.info(f"Transformed into {len(df)} records")
    return df

def load_female_properties_data(df, target_conn, generate_sql=True):
    logger.info(f"Preparing to load data into {TARGET_TABLE}")
    if table_exists(target_conn, TARGET_TABLE) and table_has_data(target_conn, TARGET_TABLE):
        logger.info(f"Table {TARGET_TABLE} already exists and has data. Skipping insertion.")
        return False
    insert_data = []
    insert_statements = []
    for _, row in df.iterrows():
        data = create_insert_data(
            ward_number=row['ward_no'],
            ward_name=row.get('ward_name'),
            property_type=row['property_type'],
            ownership_type=row.get('ownership_type'),
            count=row['count'],
            population=row['population']
        )
        insert_data.append(data)
        statement = generate_insert_statement(data)
        insert_statements.append(statement)
    if generate_sql:
        full_sql_script = []
        full_sql_script.append(generate_table_create_statement())
        full_sql_script.extend(insert_statements)
        full_sql_script.append(generate_closing_statement())
        sql_file_path = os.path.join(ECONOMICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        save_sql_to_file(full_sql_script, sql_file_path)
    success = insert_data_to_db(target_conn, insert_statements)
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    return success

def process_female_properties(source_conn, target_conn, generate_sql=True):
    logger.info("Processing ward-wise female properties data")
    try:
        df = extract_female_properties_data(source_conn)
        transformed_df = transform_female_properties_data(df)
        load_female_properties_data(transformed_df, target_conn, generate_sql)
        logger.info("Completed processing ward-wise female properties data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise female properties data: {e}")
        return False
