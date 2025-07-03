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

# Target table name
TARGET_TABLE = "acme_municipality_wide_pulses"

def map_pulse_crop(nepali_crop):
    """
    Map Nepali pulse crop names to standardized enum values.
    """
    mapping = {
        'रहर': 'pigeon_pea',
        'मास': 'black_gram',
        'मसुरो': 'lentil',
        'चना': 'chickpea',
        'भटमास': 'soyabean',
        'बोडी': 'snake_bean',
        'सिमी': 'bean',
        'गहत': 'horse_gram',
        'केराउ': 'pea',
        'अन्य दालबाली (मस्याङ्, खेसरी,....)': 'other',
        'कुनै दालबाली उत्पदान गर्दिन': 'none'
    }
    
    # Clean up the input string
    clean_crop = nepali_crop.strip() if isinstance(nepali_crop, str) else nepali_crop
    
    # Return the mapped value if available, otherwise return 'other'
    return mapping.get(clean_crop, 'other')

def estimate_revenue_from_production(crop_name, production_tonnes):
    """
    Estimate revenue in Nepali Rupees based on production and crop type.
    Using average market prices in Nepal context for pulses.
    """
    # Average market prices per tonne in Nepali Rupees (NPR) for pulses
    # These are approximate market prices for Nepal
    price_per_tonne = {
        'pigeon_pea': 85000,    # Pigeon pea (रहर)
        'black_gram': 95000,    # Black gram (मास)
        'lentil': 120000,       # Lentil (मसुरो) - higher value
        'chickpea': 90000,      # Chickpea (चना)
        'soyabean': 75000,      # Soybean (भटमास)
        'snake_bean': 80000,    # Snake bean (बोडी)
        'bean': 85000,          # Bean (सिमी)
        'horse_gram': 70000,    # Horse gram (गहत)
        'pea': 110000,          # Pea (केराउ) - higher value
        'other': 80000,         # Other pulses (average)
        'none': 0               # No production
    }
    
    # Get price for the crop, default to average if not found
    price = price_per_tonne.get(crop_name, 80000)
    
    # Calculate estimated revenue
    estimated_revenue = production_tonnes * price
    
    return estimated_revenue

def create_insert_data(pulse_crop, production_in_tonnes, sales_in_tonnes, revenue_in_rs):
    """
    Create a data dictionary for insertion.
    """
    return {
        'id': generate_uuid(),
        'pulse': pulse_crop,
        'production_in_tonnes': float(production_in_tonnes),
        'sales_in_tonnes': float(sales_in_tonnes),
        'revenue_in_rs': float(revenue_in_rs),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, pulse, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '{data['id']}',
        '{data['pulse']}',
        {data['production_in_tonnes']},
        {data['sales_in_tonnes']},
        {data['revenue_in_rs']},
        '{data['created_at']}',
        '{data['updated_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        -- Create the table
        CREATE TABLE {TARGET_TABLE} (
            id                   varchar(36)    not null primary key,
            pulse                varchar(100)   not null,
            production_in_tonnes numeric(10, 2) not null,
            sales_in_tonnes      numeric(10, 2) not null,
            revenue_in_rs        numeric(14, 2) not null,
            created_at           timestamp      default now(),
            updated_at           timestamp      default now()
        );
        
        ALTER TABLE {TARGET_TABLE} OWNER TO postgres;
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

def extract_pulse_crops_data(source_conn):
    """Extract pulse crops data from source database."""
    logger.info("Extracting pulse crops data")
    
    # Query to get pulse crops data aggregated by crop type
    query = """
    SELECT 
        crop_name,
        SUM(COALESCE(crop_production, 0)) as total_production,
        SUM(COALESCE(crop_sales, 0)) as total_sales,
        SUM(COALESCE(crop_revenue, 0)) as total_revenue
    FROM 
        survey_kerabari_crop
    WHERE 
        crop_name IS NOT NULL 
        AND crop_name != ' '
        AND crop_name != ''
        AND crop_type = 'pulse'  -- Pulse crops only
    GROUP BY 
        crop_name
    ORDER BY 
        crop_name
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} pulse crop records")
    
    return df

def transform_pulse_crops_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming pulse crops data")
    
    # Map crop names to standardized enum values
    df['pulse_crop_mapped'] = df['crop_name'].apply(map_pulse_crop)
    
    # Group by mapped crop type to aggregate across all wards
    result_df = df.groupby(['pulse_crop_mapped']).agg({
        'total_production': 'sum',
        'total_sales': 'sum',
        'total_revenue': 'sum'
    }).reset_index()
    
    # Convert production from kg to tonnes (assuming production is in kg)
    result_df['production_in_tonnes'] = result_df['total_production'] / 1000.0
    
    # Convert sales from kg to tonnes (assuming sales is in kg)
    result_df['sales_in_tonnes'] = result_df['total_sales'] / 1000.0
    
    # Handle missing sales data - if sales is 0 or null, use 30% of production
    result_df.loc[result_df['sales_in_tonnes'] <= 0, 'sales_in_tonnes'] = \
        result_df.loc[result_df['sales_in_tonnes'] <= 0, 'production_in_tonnes'] * 0.3
    
    # Handle missing revenue data - estimate from production if revenue is 0 or null
    result_df['revenue_in_rs'] = result_df.apply(
        lambda row: row['total_revenue'] if row['total_revenue'] > 0 
        else estimate_revenue_from_production(row['pulse_crop_mapped'], row['production_in_tonnes']), 
        axis=1
    )
    
    # Rename columns to match expected format
    result_df.rename(columns={
        'pulse_crop_mapped': 'pulse'
    }, inplace=True)
    
    # Select only the required columns
    result_df = result_df[['pulse', 'production_in_tonnes', 'sales_in_tonnes', 'revenue_in_rs']]
    
    logger.info(f"Transformed {len(result_df)} pulse crop records")
    
    return result_df

def load_pulse_crops_data(df, target_conn, generate_sql=True):
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
            pulse_crop=row['pulse'],
            production_in_tonnes=row['production_in_tonnes'],
            sales_in_tonnes=row['sales_in_tonnes'],
            revenue_in_rs=row['revenue_in_rs']
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

def process_municipality_wise_pulse_crops(source_conn, target_conn, generate_sql=True):
    """Process municipality-wise pulse crops data from extraction to loading."""
    logger.info("Processing municipality-wise pulse crops data")
    
    try:
        # Extract data
        df = extract_pulse_crops_data(source_conn)
        
        # Transform data
        transformed_df = transform_pulse_crops_data(df)
        
        # Load data
        load_pulse_crops_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing municipality-wise pulse crops data")
        return True
    except Exception as e:
        logger.error(f"Error processing municipality-wise pulse crops data: {e}")
        return False
