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
TARGET_TABLE = "acme_municipality_wide_vegetables"

def map_vegetable(nepali_crop):
    """
    Map Nepali vegetable names to standardized values.
    """
    mapping = {
        'आलु': 'potato',
        'काउली': 'cauliflower',
        'बन्दा': 'cabbage',
        'गोलभेडा / टमाटर': 'tomato',
        'मुला': 'radish',
        'गाँजर': 'carrot',
        'सलगम': 'turnip',
        'भेडे खुर्सानी': 'capsicum',
        'भिण्डी /रामतोरिया': 'okra',
        'भण्टा/भ्यान्टा': 'brinjal',
        'प्याज': 'onion',
        'घिउ सिमी': 'string_bean',
        'राज्मा सिमी': 'red_kidney_bean',
        'काक्रो': 'cucumber',
        'फर्सी': 'pumpkin',
        'करेला': 'bitter_gourd',
        'घिरौला': 'luffa',
        'चिचिन्ना': 'snake_gourd',
        'लौका': 'calabash',
        'बरेला': 'balsam_apple',
        'च्याउ': 'mushroom',
        'स्कुस': 'squice',
        'रायोको साग': 'mustard_greens',
        'चम्सुरको साग': 'garden_cress',
        'पालुङ्गो साग': 'spinach',
        'पिडालु': 'colocasia',
        'तरुल': 'yam',
        'अन्य तरकारी बाली': 'other',
        'कुनै तरकारी बाली उत्पदान गर्दिन': 'none'
    }
    
    # Clean up the input string
    clean_crop = nepali_crop.strip() if isinstance(nepali_crop, str) else nepali_crop
    
    # Return the mapped value if available, otherwise return 'other'
    return mapping.get(clean_crop, 'other')

def estimate_revenue_from_production(crop_name, production_tonnes):
    """
    Estimate revenue in Nepali Rupees based on production and crop type.
    Using realistic market prices in Nepal context for vegetables.
    """
    # Realistic market prices per kg in Nepali Rupees (NPR) for vegetables in Nepal
    # These are approximate market prices based on local market rates
    price_per_kg = {
        'potato': 25,                     # Potato (आलु) - staple vegetable
        'cauliflower': 35,                # Cauliflower (काउली) - popular vegetable
        'cabbage': 20,                    # Cabbage (बन्दा) - common vegetable
        'tomato': 30,                     # Tomato (गोलभेडा / टमाटर) - essential vegetable
        'radish': 15,                     # Radish (मुला) - common root vegetable
        'carrot': 25,                     # Carrot (गाँजर) - popular root vegetable
        'turnip': 12,                     # Turnip (सलगम) - seasonal root vegetable
        'capsicum': 40,                   # Capsicum (भेडे खुर्सानी) - premium vegetable
        'okra': 35,                       # Okra (भिण्डी) - popular vegetable
        'brinjal': 30,                    # Brinjal (भण्टा) - common vegetable
        'onion': 20,                      # Onion (प्याज) - essential vegetable
        'string_bean': 45,                # String bean (घिउ सिमी) - premium vegetable
        'red_kidney_bean': 50,            # Red kidney bean (राज्मा सिमी) - premium
        'cucumber': 25,                   # Cucumber (काक्रो) - common vegetable
        'pumpkin': 18,                    # Pumpkin (फर्सी) - seasonal vegetable
        'bitter_gourd': 35,               # Bitter gourd (करेला) - medicinal vegetable
        'luffa': 20,                      # Luffa (घिरौला) - common vegetable
        'snake_gourd': 25,                # Snake gourd (चिचिन्ना) - seasonal
        'calabash': 15,                   # Calabash (लौका) - common vegetable
        'balsam_apple': 30,               # Balsam apple (बरेला) - medicinal
        'mushroom': 80,                   # Mushroom (च्याउ) - premium vegetable
        'squice': 35,                     # Squice (स्कुस) - seasonal vegetable
        'mustard_greens': 20,             # Mustard greens (रायोको साग) - leafy green
        'garden_cress': 25,               # Garden cress (चम्सुरको साग) - leafy green
        'spinach': 30,                    # Spinach (पालुङ्गो साग) - popular leafy green
        'colocasia': 25,                  # Colocasia (पिडालु) - root vegetable
        'yam': 30,                        # Yam (तरुल) - root vegetable
        'other': 25,                      # Other vegetables (average)
        'none': 0                         # No production
    }
    
    # Get price per kg for the crop, default to average if not found
    price_per_kg_value = price_per_kg.get(crop_name, 25)
    
    # Convert to price per tonne (1 tonne = 1000 kg)
    price_per_tonne = price_per_kg_value * 1000
    
    # Calculate estimated revenue
    estimated_revenue = production_tonnes * price_per_tonne
    
    return estimated_revenue

def create_insert_data(vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs):
    """
    Create a data dictionary for insertion.
    """
    return {
        'id': generate_uuid(),
        'vegetable_type': vegetable_type,
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
    (id, vegetable_type, production_in_tonnes, sales_in_tonnes, revenue_in_rs, created_at, updated_at)
    VALUES (
        '{data['id']}',
        '{data['vegetable_type']}',
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
            vegetable_type       varchar(100)   not null,
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

def extract_vegetables_data(source_conn):
    """Extract vegetables data from source database."""
    logger.info("Extracting vegetables data")
    
    # Query to get vegetables data aggregated by crop type
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
        AND crop_type = 'vegetable'  -- Vegetables only
    GROUP BY 
        crop_name
    ORDER BY 
        crop_name
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} vegetable records")
    
    return df

def transform_vegetables_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming vegetables data")
    
    # Map crop names to standardized values
    df['vegetable_type_mapped'] = df['crop_name'].apply(map_vegetable)
    
    # Group by mapped crop type to aggregate across all wards
    result_df = df.groupby(['vegetable_type_mapped']).agg({
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
        else estimate_revenue_from_production(row['vegetable_type_mapped'], row['production_in_tonnes']), 
        axis=1
    )
    
    # Rename columns to match expected format
    result_df.rename(columns={
        'vegetable_type_mapped': 'vegetable_type'
    }, inplace=True)
    
    # Select only the required columns
    result_df = result_df[['vegetable_type', 'production_in_tonnes', 'sales_in_tonnes', 'revenue_in_rs']]
    
    logger.info(f"Transformed {len(result_df)} vegetable records")
    
    return result_df

def load_vegetables_data(df, target_conn, generate_sql=True):
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
            vegetable_type=row['vegetable_type'],
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

def process_municipality_wise_vegetables(source_conn, target_conn, generate_sql=True):
    """Process municipality-wise vegetables data from extraction to loading."""
    logger.info("Processing municipality-wise vegetables data")
    
    try:
        # Extract data
        df = extract_vegetables_data(source_conn)
        
        # Transform data
        transformed_df = transform_vegetables_data(df)
        
        # Load data
        load_vegetables_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing municipality-wise vegetables data")
        return True
    except Exception as e:
        logger.error(f"Error processing municipality-wise vegetables data: {e}")
        return False
