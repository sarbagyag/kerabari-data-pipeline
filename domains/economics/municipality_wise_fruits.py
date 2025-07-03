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
TARGET_TABLE = "acme_municipality_wide_fruits"

def map_fruit(nepali_crop):
    """
    Map Nepali fruit names to standardized values.
    """
    mapping = {
        'आँप': 'mango',
        'रुखकटहर': 'jackfruit',
        'लिची': 'litchi',
        'केरा': 'banana',
        'कागती': 'lemon',
        'सुन्तला': 'orange',
        'निबुवा': 'nibuwa',
        'जुनार': 'sweet_orange',
        'मौसम': 'sweet_lemon',
        'ज्यामिर': 'jyamir',
        'भोगटे': 'pomelo',
        'भूईकटहर': 'pineapple',
        'मेवा': 'papaya',
        'एभोकाडो': 'avocado',
        'किवी': 'kiwi',
        'अम्बा': 'guava',
        'आरुबखडा': 'plum',
        'आरु': 'peach',
        'नासपाती': 'pear',
        'अनार': 'pomegranate',
        'ओखर': 'walnut',
        'हलुवावेद': 'japanese_persimmon',
        'लप्सी': 'hog_plum',
        'कुनै फलफूलबाली उत्पदान गर्दिन': 'none'
    }
    
    # Clean up the input string
    clean_crop = nepali_crop.strip() if isinstance(nepali_crop, str) else nepali_crop
    
    # Return the mapped value if available, otherwise return 'other'
    return mapping.get(clean_crop, 'other')

def estimate_revenue_from_production(crop_name, production_tonnes):
    """
    Estimate revenue in Nepali Rupees based on production and crop type.
    Using realistic market prices in Nepal context for fruits.
    """
    # Realistic market prices per kg in Nepali Rupees (NPR) for fruits in Nepal
    # These are approximate market prices based on local market rates
    price_per_kg = {
        'mango': 150,                    # Mango (आँप) - seasonal, popular
        'jackfruit': 80,                 # Jackfruit (रुखकटहर) - seasonal
        'litchi': 300,                   # Litchi (लिची) - premium fruit
        'banana': 60,                    # Banana (केरा) - common, affordable
        'lemon': 120,                    # Lemon (कागती) - essential citrus
        'orange': 180,                   # Orange (सुन्तला) - popular citrus
        'nibuwa': 200,                   # Lime (निबुवा) - essential for cooking
        'sweet_orange': 200,             # Sweet orange (जुनार) - premium citrus
        'sweet_lemon': 150,              # Sweet lemon (मौसम) - seasonal
        'jyamir': 250,                   # Jyamir (ज्यामिर) - local specialty
        'pomelo': 120,                   # Pomelo (भोगटे) - seasonal
        'pineapple': 100,                # Pineapple (भूईकटहर) - tropical
        'papaya': 80,                    # Papaya (मेवा) - common tropical
        'avocado': 400,                  # Avocado (एभोकाडो) - premium import
        'kiwi': 500,                     # Kiwi (किवी) - premium import
        'guava': 80,                     # Guava (अम्बा) - common local
        'plum': 200,                     # Plum (आरुबखडा) - seasonal
        'peach': 180,                    # Peach (आरु) - seasonal
        'pear': 160,                     # Pear (नासपाती) - seasonal
        'pomegranate': 250,              # Pomegranate (अनार) - premium
        'walnut': 800,                   # Walnut (ओखर) - premium nut
        'japanese_persimmon': 120,       # Japanese persimmon (हलुवावेद) - seasonal
        'hog_plum': 100,                 # Hog plum (लप्सी) - local specialty
        'other': 120,                    # Other fruits (average)
        'none': 0                        # No production
    }
    
    # Get price per kg for the crop, default to average if not found
    price_per_kg_value = price_per_kg.get(crop_name, 120)
    
    # Convert to price per tonne (1 tonne = 1000 kg)
    price_per_tonne = price_per_kg_value * 1000
    
    # Calculate estimated revenue
    estimated_revenue = production_tonnes * price_per_tonne
    
    return estimated_revenue

def create_insert_data(fruit, production_in_tonnes, sales_in_tonnes, revenue_in_rs):
    """
    Create a data dictionary for insertion.
    """
    return {
        'id': generate_uuid(),
        'fruit_type': fruit,
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
    (id, fruit_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '{data['id']}',
        '{data['fruit_type']}',
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
            fruit_type           varchar(100)   not null,
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

def extract_fruits_data(source_conn):
    """Extract fruits data from source database."""
    logger.info("Extracting fruits data")
    
    # Query to get fruits data aggregated by crop type
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
        AND crop_type = 'fruit'  -- Fruits only
    GROUP BY 
        crop_name
    ORDER BY 
        crop_name
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} fruit records")
    
    return df

def transform_fruits_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming fruits data")
    
    # Map crop names to standardized values
    df['fruit_mapped'] = df['crop_name'].apply(map_fruit)
    
    # Group by mapped crop type to aggregate across all wards
    result_df = df.groupby(['fruit_mapped']).agg({
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
        else estimate_revenue_from_production(row['fruit_mapped'], row['production_in_tonnes']), 
        axis=1
    )
    
    # Rename columns to match expected format
    result_df.rename(columns={
        'fruit_mapped': 'fruit_type'
    }, inplace=True)
    
    # Select only the required columns
    result_df = result_df[['fruit_type', 'production_in_tonnes', 'sales_in_tonnes', 'revenue_in_rs']]
    
    logger.info(f"Transformed {len(result_df)} fruit records")
    
    return result_df

def load_fruits_data(df, target_conn, generate_sql=True):
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
            fruit=row['fruit_type'],
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

def process_municipality_wise_fruits(source_conn, target_conn, generate_sql=True):
    """Process municipality-wise fruits data from extraction to loading."""
    logger.info("Processing municipality-wise fruits data")
    
    try:
        # Extract data
        df = extract_fruits_data(source_conn)
        
        # Transform data
        transformed_df = transform_fruits_data(df)
        
        # Load data
        load_fruits_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing municipality-wise fruits data")
        return True
    except Exception as e:
        logger.error(f"Error processing municipality-wise fruits data: {e}")
        return False
