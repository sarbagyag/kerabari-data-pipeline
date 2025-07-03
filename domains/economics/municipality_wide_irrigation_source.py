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
TARGET_TABLE = "acme_municipality_wide_irrigation_source"

def create_insert_data(irrigation_source, coverage_in_hectares):
    """
    Create a data dictionary for insertion specific to municipality wide irrigation source.
    """
    # Validate and clean irrigation source
    if not irrigation_source or pd.isna(irrigation_source):
        irrigation_source = "Unknown"
    else:
        irrigation_source = str(irrigation_source).strip()[:100]  # Ensure it's within 100 chars
    
    # Validate coverage
    try:
        coverage = float(coverage_in_hectares)
        if coverage < 0:
            coverage = 0.0
    except (ValueError, TypeError):
        coverage = 0.0
    
    return {
        'id': generate_uuid(),
        'irrigation_source': irrigation_source,
        'coverage_in_hectares': coverage,
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to municipality wide irrigation source.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, irrigation_source, coverage_in_hectares, updated_at, created_at)
    VALUES (
        '{data['id']}',
        '{data['irrigation_source']}',
        {data['coverage_in_hectares']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the municipality_wide_irrigation_source table if it doesn't exist.
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
            irrigation_source VARCHAR(100) NOT NULL,
            coverage_in_hectares DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (coverage_in_hectares >= 0),
            updated_at TIMESTAMP DEFAULT NOW(),
            created_at TIMESTAMP DEFAULT NOW(),
            UNIQUE(irrigation_source)
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

def extract_irrigation_source_data(source_conn):
    """Extract irrigation source data from kerabari_agricultural_land table"""
    logger.info("Extracting irrigation source data")
    
    query = """
    SELECT 
        irrigation_source,
        irrigated_land_area
    FROM survey_kerabari_agricultural_land
    WHERE irrigation_source IS NOT NULL 
    AND irrigation_source != ''
    AND irrigated_land_area IS NOT NULL
    AND irrigated_land_area > 0
    """
    
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} irrigation source records")
    return df

def transform_irrigation_source_data(df):
    """Transform data to calculate municipality-wide irrigation source coverage"""
    logger.info("Transforming municipality-wide irrigation source data")
    
    # Clean and validate the data first
    initial_count = len(df)
    
    # Remove rows with null or empty irrigation sources
    df = df.dropna(subset=['irrigation_source'])
    df = df[df['irrigation_source'].str.strip() != '']
    
    # Remove rows with null or negative irrigated land area
    df = df.dropna(subset=['irrigated_land_area'])
    df = df[df['irrigated_land_area'] > 0]
    
    cleaned_count = len(df)
    if initial_count != cleaned_count:
        logger.warning(f"Removed {initial_count - cleaned_count} rows with invalid data")
    
    # Group by irrigation source and calculate total coverage
    irrigation_summary = df.groupby('irrigation_source').agg({
        'irrigated_land_area': 'sum'
    }).reset_index()
    
    # Rename columns to match target schema
    irrigation_summary = irrigation_summary.rename(columns={
        'irrigated_land_area': 'coverage_in_hectares'
    })
    
    # Convert to Decimal with 2 decimal places
    irrigation_summary['coverage_in_hectares'] = irrigation_summary['coverage_in_hectares'].apply(
        lambda x: round(Decimal(str(x)), 2)
    )
    
    # Filter out zero coverage
    irrigation_summary = irrigation_summary[irrigation_summary['coverage_in_hectares'] > 0]
    
    # Clean irrigation source names (remove extra spaces and truncate if too long)
    irrigation_summary['irrigation_source'] = irrigation_summary['irrigation_source'].str.strip()
    irrigation_summary['irrigation_source'] = irrigation_summary['irrigation_source'].str[:100]  # Truncate to 100 chars
    
    logger.info(f"Transformed data for {len(irrigation_summary)} irrigation sources")
    return irrigation_summary

def check_and_fix_table_schema(target_conn):
    """Check if the table has the correct schema and fix it if needed."""
    try:
        cursor = target_conn.cursor()
        
        # Check if the irrigation_source column has the correct size
        cursor.execute(f"""
            SELECT character_maximum_length 
            FROM information_schema.columns 
            WHERE table_name = '{TARGET_TABLE}' 
            AND column_name = 'irrigation_source'
        """)
        
        result = cursor.fetchone()
        if result and result[0] is not None:
            current_length = result[0]
            if current_length < 100:
                logger.warning(f"Table {TARGET_TABLE} has irrigation_source column with length {current_length}, need to alter to 100")
                
                # Check if table has data
                cursor.execute(f"SELECT COUNT(*) FROM {TARGET_TABLE}")
                row_count = cursor.fetchone()[0]
                
                if row_count > 0:
                    logger.warning(f"Table {TARGET_TABLE} has {row_count} rows. Dropping and recreating with correct schema.")
                    cursor.execute(f"DROP TABLE {TARGET_TABLE}")
                    target_conn.commit()
                    logger.info(f"Dropped table {TARGET_TABLE} to recreate with correct schema")
                else:
                    # Table is empty, just alter the column
                    cursor.execute(f"ALTER TABLE {TARGET_TABLE} ALTER COLUMN irrigation_source TYPE VARCHAR(100)")
                    target_conn.commit()
                    logger.info(f"Altered irrigation_source column to VARCHAR(100)")
        
        cursor.close()
        return True
    except Exception as e:
        logger.error(f"Error checking/fixing table schema: {e}")
        return False

def load_municipality_wide_irrigation_source(df, target_conn, generate_sql=True):
    """Load the transformed data into the target database and optionally generate SQL file."""
    logger.info(f"Preparing to load data into {TARGET_TABLE}")
    
    # Check and fix table schema if needed
    if table_exists(target_conn, TARGET_TABLE):
        if not check_and_fix_table_schema(target_conn):
            logger.error("Failed to fix table schema")
            return False
    
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
            irrigation_source=row['irrigation_source'],
            coverage_in_hectares=row['coverage_in_hectares']
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

def process_municipality_wide_irrigation_source(source_conn, target_conn, generate_sql=True):
    """Process municipality-wide irrigation source data from extraction to loading."""
    logger.info("Processing municipality-wide irrigation source data")
    
    try:
        # Extract data
        df = extract_irrigation_source_data(source_conn)
        
        # Transform data
        transformed_df = transform_irrigation_source_data(df)
        
        # Load data
        load_municipality_wide_irrigation_source(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing municipality-wide irrigation source data")
        return True
    except Exception as e:
        logger.error(f"Error processing municipality-wide irrigation source data: {e}")
        return False
