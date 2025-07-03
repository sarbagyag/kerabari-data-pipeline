import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import ECONOMICS_SQL_DIR
from decimal import Decimal

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_ward_wise_irrigated_area"

MAX_DECIMAL = Decimal('99999999.99')
def cap_value(x):
    try:
        d = Decimal(str(x))
        if d > MAX_DECIMAL:
            logger.warning(f"Value {d} exceeds max allowed {MAX_DECIMAL}, capping.")
            return MAX_DECIMAL
        return d
    except Exception:
        return Decimal('0.00')

def create_insert_data(ward_number, irrigated_area_hectares, unirrigated_area_hectares):
    """
    Create a data dictionary for insertion specific to ward wise irrigated area.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'irrigated_area_hectares': float(irrigated_area_hectares),
        'unirrigated_area_hectares': float(unirrigated_area_hectares),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to ward wise irrigated area.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, irrigated_area_hectares, unirrigated_area_hectares, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        {data['irrigated_area_hectares']},
        {data['unirrigated_area_hectares']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_irrigated_area table if it doesn't exist.
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
            ward_number INTEGER NOT NULL CHECK (ward_number >= 1 AND ward_number <= 9),
            irrigated_area_hectares DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (irrigated_area_hectares >= 0),
            unirrigated_area_hectares DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (unirrigated_area_hectares >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW(),
            UNIQUE(ward_number)
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

def extract_agricultural_land_data(source_conn):
    """Extract agricultural land data from survey_kerabari_agricultural_land table"""
    logger.info("Extracting agricultural land data")
    
    query = """
    SELECT 
        ward_no,
        land_area,
        irrigated_land_area,
        CASE 
            WHEN irrigated_land_area IS NULL THEN 0
            ELSE irrigated_land_area
        END as irrigated_area_clean
    FROM survey_kerabari_agricultural_land
    WHERE ward_no IS NOT NULL 
    AND land_area IS NOT NULL
    AND land_area > 0
    """
    
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} agricultural land records")
    return df

def transform_ward_wise_data(df):
    """Transform data to calculate ward-wise irrigated and unirrigated areas (convert sq.km to hectares)."""
    logger.info("Transforming ward-wise irrigated area data")
    
    # Convert sq.km to hectares (1 sq.km = 100 hectares)
    df['land_area'] = df['land_area'] * 100
    df['irrigated_area_clean'] = df['irrigated_area_clean'] * 100
    
    # Group by ward and calculate totals
    ward_summary = df.groupby('ward_no').agg({
        'land_area': 'sum',
        'irrigated_area_clean': 'sum'
    }).reset_index()
    
    # Calculate unirrigated area
    ward_summary['unirrigated_area'] = ward_summary['land_area'] - ward_summary['irrigated_area_clean']
    
    # Ensure unirrigated area is not negative
    ward_summary['unirrigated_area'] = ward_summary['unirrigated_area'].clip(lower=0)
    
    # Rename columns to match target schema
    ward_summary = ward_summary.rename(columns={
        'ward_no': 'ward_number',
        'irrigated_area_clean': 'irrigated_area_hectares',
        'unirrigated_area': 'unirrigated_area_hectares'
    })
    
    # Convert to Decimal with 2 decimal places and cap at max allowed value
    ward_summary['irrigated_area_hectares'] = ward_summary['irrigated_area_hectares'].apply(
        lambda x: round(cap_value(x), 2)
    )
    ward_summary['unirrigated_area_hectares'] = ward_summary['unirrigated_area_hectares'].apply(
        lambda x: round(cap_value(x), 2)
    )
    
    # Filter for valid ward numbers (1-9)
    ward_summary = ward_summary[
        (ward_summary['ward_number'] >= 1) & 
        (ward_summary['ward_number'] <= 9)
    ]
    
    # Ensure ward_number is integer type
    ward_summary['ward_number'] = ward_summary['ward_number'].astype(int)
    
    logger.info(f"Transformed data for {len(ward_summary)} wards")
    return ward_summary

def load_ward_wise_irrigated_area(df, target_conn, generate_sql=True):
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
            ward_number=row['ward_number'],
            irrigated_area_hectares=row['irrigated_area_hectares'],
            unirrigated_area_hectares=row['unirrigated_area_hectares']
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

def process_ward_wise_irrigated_area(source_conn, target_conn, generate_sql=True):
    """Process ward-wise irrigated area data from extraction to loading."""
    logger.info("Processing ward-wise irrigated area data")
    
    try:
        # Extract data
        df = extract_agricultural_land_data(source_conn)
        
        # Transform data
        transformed_df = transform_ward_wise_data(df)
        
        # Load data
        load_ward_wise_irrigated_area(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise irrigated area data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise irrigated area data: {e}")
        return False
