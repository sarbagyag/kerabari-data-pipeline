import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import HEALTH_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_immunization_indicators"

# Define immunization indicator mappings from Nepali to standardized English values
IMMUNIZATION_INDICATOR_MAPPING = {
    "BCG": "BCG_COVERAGE",
    "DPT": "DPT_HEPB_HIB1_COVERAGE",  # Assuming DPT refers to DPT1
    "ROTA2": "ROTA2_COVERAGE",
    "FIPV2": "FIPV2_COVERAGE",
    "PCV3": "PCV3_COVERAGE",
    "MR2": "MEASLES_RUBELLA2_COVERAGE",
    "JE": "JE_COVERAGE",
    "Td2 and 2+": "TD2_TD2PLUS_COMPLETED_PREGNANT_WOMEN",
    
    # Handle nulls and empty strings
    None: "BCG_COVERAGE",
    "": "BCG_COVERAGE"
}

# Define fiscal year mappings from Nepali to standardized English values
FISCAL_YEAR_MAPPING = {
    "२०७९/८०": "FY_2079_2080",
    "२०८०/८१": "FY_2080_2081", 
    "२०८१/८२": "FY_2081_2082",
    
    # Handle nulls and empty strings
    None: "FY_2079_2080",
    "": "FY_2079_2080"
}

def map_immunization_indicator(indicator):
    """
    Map immunization indicator names to standardized values.
    """
    if not indicator or pd.isna(indicator):
        return "BCG_COVERAGE"
    
    # Try direct mapping
    standardized = IMMUNIZATION_INDICATOR_MAPPING.get(indicator)
    if standardized:
        return standardized
    
    # Try lowercase matching for flexibility
    indicator_lower = str(indicator).lower().strip()
    for key, value in IMMUNIZATION_INDICATOR_MAPPING.items():
        if key and isinstance(key, str) and str(key).lower() == indicator_lower:
            return value
    
    # Default for unmatched values
    logger.warning(f"Immunization indicator '{indicator}' not found in mapping. Using 'BCG_COVERAGE' as default.")
    return "BCG_COVERAGE"

def map_fiscal_year(fiscal_year):
    """
    Map fiscal year names to standardized values.
    """
    if not fiscal_year or pd.isna(fiscal_year):
        return "FY_2079_2080"
    
    # Try direct mapping
    standardized = FISCAL_YEAR_MAPPING.get(fiscal_year)
    if standardized:
        return standardized
    
    # Try lowercase matching for flexibility
    fiscal_year_lower = str(fiscal_year).lower().strip()
    for key, value in FISCAL_YEAR_MAPPING.items():
        if key and isinstance(key, str) and str(key).lower() == fiscal_year_lower:
            return value
    
    # Default for unmatched values
    logger.warning(f"Fiscal year '{fiscal_year}' not found in mapping. Using 'FY_2079_2080' as default.")
    return "FY_2079_2080"

def create_insert_data(fiscal_year, indicator, value):
    """
    Create a data dictionary for insertion specific to immunization indicators.
    """
    return {
        'id': generate_uuid(),
        'fiscal_year': fiscal_year,
        'indicator': indicator,
        'value': float(value) if value is not None else None,
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to immunization indicators.
    """
    value_str = f"{data['value']}" if data['value'] is not None else "NULL"
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, fiscal_year, indicator, value, updated_at, created_at)
    VALUES (
        '{data['id']}',
        '{data['fiscal_year']}',
        '{data['indicator']}',
        {value_str},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the immunization_indicators table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        CREATE TABLE {TARGET_TABLE} (
            id VARCHAR(36) PRIMARY KEY,
            fiscal_year VARCHAR(20) NOT NULL,
            indicator VARCHAR(100) NOT NULL,
            value DOUBLE PRECISION,
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

def get_immunization_data():
    """
    Get the immunization indicators data as provided.
    """
    logger.info("Getting immunization indicators data")
    
    # The provided data
    data = [
        {
            "सूचकहरू": "BCG",
            "२०७९/८०": 88.9,
            "२०८०/८१": 98.6,
            "२०८१/८२": 72.27
        },
        {
            "सूचकहरू": "DPT",
            "२०७९/८०": 90.7,
            "२०८०/८१": 102.1,
            "२०८१/८२": 61.14
        },
        {
            "सूचकहरू": "ROTA2",
            "२०७९/८०": 88.9,
            "२०८०/८१": 100.3,
            "२०८१/८२": 59.66
        },
        {
            "सूचकहरू": "FIPV2",
            "२०७९/८०": 65.7,
            "२०८०/८१": 103.8,
            "२०८१/८२": 60.7
        },
        {
            "सूचकहरू": "PCV3",
            "२०७९/८०": 77.6,
            "२०८०/८१": 103.3,
            "२०८१/८२": 60.7
        },
        {
            "सूचकहरू": "MR2",
            "२०७९/८०": 90.2,
            "२०८०/८१": 103.5,
            "२०८१/८२": 45.32
        },
        {
            "सूचकहरू": "JE",
            "२०७९/८०": 87.7,
            "२०८०/८१": 105,
            "२०८१/८२": 40.3
        },
        {
            "सूचकहरू": "Td2 and 2+",
            "२०७९/८०": 69.2,
            "२०८०/८१": 92.6,
            "२०८१/८२": 54.42
        }
    ]
    
    return pd.DataFrame(data)

def transform_immunization_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming immunization indicators data")
    
    # Create a list to store transformed data
    transformed_data = []
    
    for _, row in df.iterrows():
        indicator = row['सूचकहरू']
        mapped_indicator = map_immunization_indicator(indicator)
        
        # Process each fiscal year
        for fiscal_year_nepali, value in row.items():
            if fiscal_year_nepali != 'सूचकहरू':  # Skip the indicator column
                mapped_fiscal_year = map_fiscal_year(fiscal_year_nepali)
                
                transformed_data.append({
                    'fiscal_year': mapped_fiscal_year,
                    'indicator': mapped_indicator,
                    'value': value
                })
    
    transformed_df = pd.DataFrame(transformed_data)
    logger.info(f"Transformed immunization data with {len(transformed_df)} records")
    
    return transformed_df

def load_immunization_data(df, target_conn, generate_sql=True):
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
            fiscal_year=row['fiscal_year'],
            indicator=row['indicator'],
            value=row['value']
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
        sql_file_path = os.path.join(HEALTH_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_immunization_indicators(target_conn, generate_sql=True):
    """Process immunization indicators data from extraction to loading."""
    logger.info("Processing immunization indicators data")
    
    try:
        # Get data
        df = get_immunization_data()
        
        # Transform data
        transformed_df = transform_immunization_data(df)
        
        # Load data
        load_immunization_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing immunization indicators data")
        return True
    except Exception as e:
        logger.error(f"Error processing immunization indicators data: {e}")
        return False
