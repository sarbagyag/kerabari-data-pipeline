import pandas as pd
import logging
import os
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
TARGET_TABLE = "acme_ward_wise_sent_remittance"

def map_remittance_amount_group(amount):
    """
    Map remittance amounts to standardized amount group enum values.
    """
    # Handle None, NaN, or empty string cases
    if pd.isna(amount) or amount == '' or amount is None:
        return 'no_remittance'
    
    # Convert string to numeric if needed
    try:
        numeric_amount = float(amount)
    except (ValueError, TypeError):
        # If conversion fails, treat as no remittance
        return 'no_remittance'
    
    # Check if amount is 0 or negative
    if numeric_amount <= 0:
        return 'no_remittance'
    elif numeric_amount <= 50000:
        return 'below_50k'
    elif numeric_amount <= 100000:
        return '50k_to_100k'
    elif numeric_amount <= 200000:
        return '100k_to_200k'
    elif numeric_amount <= 500000:
        return '200k_to_500k'
    else:
        return 'above_500k'

def create_insert_data(ward_number, amount_group, sending_population):
    """
    Create a data dictionary for insertion specific to sent remittance.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'amount_group': amount_group,
        'sending_population': int(sending_population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to sent remittance.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, amount_group, sending_population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['amount_group']}',
        {data['sending_population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_sent_remittance table if it doesn't exist.
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
            amount_group VARCHAR(25) NOT NULL,
            sending_population INTEGER NOT NULL DEFAULT 0 CHECK (sending_population >= 0),
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

def extract_sent_remittance_data(source_conn):
    """Extract sent remittance data from source database."""
    logger.info("Extracting sent remittance data")
    
    # Query to get individuals who have sent remittance (absentees with country info)
    query = """
    SELECT 
        ward_no,
        absentee_cash_amount
    FROM 
        staging_kerabari_individual
    WHERE 
        absentee_country IS NOT NULL
        AND ward_no IS NOT NULL
        AND absentee_country != ''
        AND absentee_cash_amount IS NOT NULL;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} individual records with absentee country and cash amount information")
    
    # Debug: Log some sample data to understand the format
    if not df.empty:
        logger.info(f"Sample absentee_cash_amount values: {df['absentee_cash_amount'].head(10).tolist()}")
        logger.info(f"Unique absentee_cash_amount values count: {df['absentee_cash_amount'].nunique()}")
    
    return df

def transform_sent_remittance_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming sent remittance data")
    
    # Handle empty dataframe
    if df.empty:
        # Create empty dataframe with expected columns
        grouped_df = pd.DataFrame(columns=['ward_no', 'amount_group', 'sending_population'])
        logger.warning("No sent remittance data found in source database")
    else:
        # Debug: Check data types and sample values
        logger.info(f"Data type of absentee_cash_amount: {df['absentee_cash_amount'].dtype}")
        
        # Map remittance amounts to standardized amount groups
        df['amount_group'] = df['absentee_cash_amount'].apply(map_remittance_amount_group)
        
        # Debug: Check the distribution of amount groups
        amount_group_counts = df['amount_group'].value_counts()
        logger.info(f"Amount group distribution: {amount_group_counts.to_dict()}")
        
        # Group by ward and amount group to count sending population
        grouped_df = df.groupby(['ward_no', 'amount_group']).size().reset_index(name='sending_population')
        
        # Debug: Log the grouped results before completing all combinations
        logger.info(f"Grouped data before completion: {len(grouped_df)} combinations")
        logger.info(f"Sample grouped data:\n{grouped_df.head(10)}")
        
        # Now uncomment to include all ward-amount combinations with zeros
        all_wards = range(1, 10)
        amount_groups = ['no_remittance', 'below_50k', '50k_to_100k', '100k_to_200k', '200k_to_500k', 'above_500k']
        
        complete_combinations = []
        for ward in all_wards:
            for amount_group in amount_groups:
                complete_combinations.append({'ward_no': ward, 'amount_group': amount_group})
        
        complete_df = pd.DataFrame(complete_combinations)
        grouped_df = complete_df.merge(grouped_df, on=['ward_no', 'amount_group'], how='left').fillna(0)
        grouped_df['sending_population'] = grouped_df['sending_population'].astype(int)
    
    logger.info(f"Transformed into {len(grouped_df)} ward-amount group combinations")
    
    return grouped_df

def load_sent_remittance_data(df, target_conn, generate_sql=True):
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
            ward_number=row['ward_no'],
            amount_group=row['amount_group'],
            sending_population=row['sending_population']
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

def process_sent_remittance(source_conn, target_conn, generate_sql=True):
    """Process ward-wise sent remittance data from extraction to loading."""
    logger.info("Processing ward-wise sent remittance data")
    
    try:
        # Extract data
        df = extract_sent_remittance_data(source_conn)
        
        # Transform data
        transformed_df = transform_sent_remittance_data(df)
        
        # Load data
        load_sent_remittance_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise sent remittance data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise sent remittance data: {e}")
        return False
    except Exception as e:
        logger.error(f"Error processing ward-wise sent remittance data: {e}")
        return False
