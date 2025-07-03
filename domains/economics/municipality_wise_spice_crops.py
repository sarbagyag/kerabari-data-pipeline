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
TARGET_TABLE = "acme_municipality_wide_spices"

def map_spice_crop(nepali_crop):
    """
    Map Nepali spice crop names to standardized values.
    """
    mapping = {
        'लसुन': 'garlic',
        'प्याज': 'onion',
        'बेसार': 'turmeric',
        'खुर्सानी': 'chili_pepper',
        'अदुवा': 'ginger',
        'धनिया': 'coriander',
        'टिमुर': 'sichuan_pepper',
        'मरिच': 'black_pepper',
        'तेजपात': 'cinnamomum_tamala',
        'जीरा': 'cumin',
        'मेथी': 'fenugreek',
        'अन्य मसलाबाली': 'other',
        'कुनै मसलाबाली उत्पदान गर्दिन': 'none'
    }
    
    # Clean up the input string
    clean_crop = nepali_crop.strip() if isinstance(nepali_crop, str) else nepali_crop
    
    # Return the mapped value if available, otherwise return 'other'
    return mapping.get(clean_crop, 'other')

def estimate_revenue_from_production(crop_name, production_tonnes):
    """
    Estimate revenue in Nepali Rupees based on production and crop type.
    Using realistic market prices in Nepal context for spices.
    """
    # Realistic market prices per kg in Nepali Rupees (NPR) for spices in Nepal
    # These are approximate market prices based on local market rates
    price_per_kg = {
        'garlic': 15,                     # Garlic (लसुन) - essential cooking ingredient
        'onion': 12,                      # Onion (प्याज) - essential cooking ingredient
        'turmeric': 25,                   # Turmeric (बेसार) - medicinal + cooking
        'chili_pepper': 35,               # Chili pepper (खुर्सानी) - essential spice
        'ginger': 20,                     # Ginger (अदुवा) - medicinal + cooking
        'coriander': 18,                  # Coriander (धनिया) - common herb
        'sichuan_pepper': 45,             # Sichuan pepper (टिमुर) - premium spice
        'black_pepper': 60,               # Black pepper (मरिच) - premium spice
        'cinnamomum_tamala': 40,          # Cinnamomum tamala (तेजपात) - bay leaf
        'cumin': 30,                      # Cumin (जीरा) - essential spice
        'fenugreek': 22,                  # Fenugreek (मेथी) - medicinal + cooking
        'other': 25,                      # Other spices (average)
        'none': 0                         # No production
    }
    
    # Get price per kg for the crop, default to average if not found
    price_per_kg_value = price_per_kg.get(crop_name, 25)
    
    # Convert to price per tonne (1 tonne = 1000 kg)
    price_per_tonne = price_per_kg_value * 1000
    
    # Calculate estimated revenue
    estimated_revenue = production_tonnes * price_per_tonne
    
    return estimated_revenue

def create_insert_data(spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs):
    """
    Create a data dictionary for insertion.
    """
    return {
        'id': generate_uuid(),
        'spice_type': spice_type,
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
    (id, spice_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '{data['id']}',
        '{data['spice_type']}',
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
            spice_type           varchar(100)   not null,
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

def extract_spice_crops_data(source_conn):
    """Extract spice crops data from source database."""
    logger.info("Extracting spice crops data")
    
    # Query to get spice crops data aggregated by crop type
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
        AND crop_type = 'spice'  -- Spice crops only
    GROUP BY 
        crop_name
    ORDER BY 
        crop_name
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} spice crop records")
    
    return df

def transform_spice_crops_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming spice crops data")
    
    # Map crop names to standardized values
    df['spice_type_mapped'] = df['crop_name'].apply(map_spice_crop)
    
    # Group by mapped crop type to aggregate across all wards
    result_df = df.groupby(['spice_type_mapped']).agg({
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
        else estimate_revenue_from_production(row['spice_type_mapped'], row['production_in_tonnes']), 
        axis=1
    )
    
    # Rename columns to match expected format
    result_df.rename(columns={
        'spice_type_mapped': 'spice_type'
    }, inplace=True)
    
    # Select only the required columns
    result_df = result_df[['spice_type', 'production_in_tonnes', 'sales_in_tonnes', 'revenue_in_rs']]
    
    logger.info(f"Transformed {len(result_df)} spice crop records")
    
    return result_df

def load_spice_crops_data(df, target_conn, generate_sql=True):
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
            spice_type=row['spice_type'],
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

def process_municipality_wise_spice_crops(source_conn, target_conn, generate_sql=True):
    """Process municipality-wise spice crops data from extraction to loading."""
    logger.info("Processing municipality-wise spice crops data")
    
    try:
        # Extract data
        df = extract_spice_crops_data(source_conn)
        
        # Transform data
        transformed_df = transform_spice_crops_data(df)
        
        # Load data
        load_spice_crops_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing municipality-wise spice crops data")
        return True
    except Exception as e:
        logger.error(f"Error processing municipality-wise spice crops data: {e}")
        return False
