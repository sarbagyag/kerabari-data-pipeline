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
TARGET_TABLE = "acme_ward_wise_remittance_expenses"

def map_remittance_expense_type(nepali_expense):
    """
    Map Nepali remittance expense types to standardized enum values.
    """
    mapping = {
        'शिक्षामा खर्च गरेको': 'education',
        'स्वास्थ्य उपचारमा खर्च': 'health',
        'घरायसी उपभोग': 'household_use',
        'विवाह/ब्रतबन्ध/चाडबाड मनाएको': 'festivals',
        'ऋण तिरेको': 'loan_payment',
        'अरुलाई ऋण दिएको': 'loaned_others',
        'बचत गरेको': 'saving',
        'घर बनाएको': 'house_construction',
        'जग्गा किनेको': 'land_ownership',
        'गरगहना खरिद गरेको': 'jwellery_purchase',
        'वस्तुभाउ खरिद गरेको': 'goods_purchase',
        'व्यापार/व्यवसायमा लगानी गरेको': 'business_investment',
        'अन्य': 'other',
        'थाहा छैन': 'unknown'
    }
    
    # Clean up the input string by removing whitespace
    clean_expense = nepali_expense.strip() if isinstance(nepali_expense, str) else nepali_expense
    
    # Return the mapped value if available, otherwise return 'other'
    return mapping.get(clean_expense, 'other')

def create_insert_data(ward_number, remittance_expense, households):
    """
    Create a data dictionary for insertion specific to remittance expenses.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'remittance_expense': remittance_expense,
        'households': int(households),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to remittance expenses.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, remittance_expense, households, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['remittance_expense']}',
        {data['households']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_remittance_expenses table if it doesn't exist.
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
            ward_number INTEGER NOT NULL,
            remittance_expense TEXT NOT NULL,
            households INTEGER NOT NULL DEFAULT 0 CHECK (households >= 0),
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

def extract_remittance_expenses_data(source_conn):
    """Extract remittance expenses data from source database."""
    logger.info("Extracting remittance expenses data")
    
    # Query to get ward and remittance expenses for families
    query = """
    SELECT 
        ward_no, 
        remittance_expenses
    FROM 
        synthetic_survey_kerabari_family
    WHERE 
        remittance_expenses IS NOT NULL;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} household records with remittance expenses information")
    
    return df

def transform_remittance_expenses_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming remittance expenses data")
    
    # Handle empty dataframe
    if df.empty:
        # Create empty dataframe with expected columns
        grouped_df = pd.DataFrame(columns=['ward_no', 'expense_mapped', 'households'])
        logger.warning("No remittance expenses data found in source database")
    else:
        # Check if remittance_expenses is an array type
        if isinstance(df['remittance_expenses'].iloc[0], list):
            exploded_df = df.explode('remittance_expenses')
        else:
            # If not array, just use as is
            exploded_df = df.copy()
        
        # Map Nepali expense types to standardized enum values
        exploded_df['expense_mapped'] = exploded_df['remittance_expenses'].apply(map_remittance_expense_type)

        # Group by ward and remittance expense to count households
        grouped_df = exploded_df.groupby(['ward_no', 'expense_mapped']).size().reset_index(name='households')
    
    logger.info(f"Transformed into {len(grouped_df)} ward-expense combinations")
    
    return grouped_df

def load_remittance_expenses_data(df, target_conn, generate_sql=True):
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
            remittance_expense=row['expense_mapped'],
            households=row['households']
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

def process_remittance_expenses(source_conn, target_conn, generate_sql=True):
    """Process ward-wise remittance expenses data from extraction to loading."""
    logger.info("Processing ward-wise remittance expenses data")
    
    try:
        # Extract data
        df = extract_remittance_expenses_data(source_conn)
        
        # Transform data
        transformed_df = transform_remittance_expenses_data(df)
        
        # Load data
        load_remittance_expenses_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise remittance expenses data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise remittance expenses data: {e}")
        return False
