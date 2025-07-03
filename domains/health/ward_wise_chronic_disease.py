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
TARGET_TABLE = "acme_ward_wise_chronic_diseases"

# Define chronic disease type mappings from Nepali to standardized English values
CHRONIC_DISEASE_MAPPING = {
    "मुटुसम्बन्धी रोग": "HEART_RELATED_DISEASE",
    "स्वास प्रस्वाससम्बन्धी": "RESPIRATION_RELATED",
    "दम": "ASTHMA",
    "छारे रोग": "EPILEPSY",
    "अर्बुद (क्यान्सर)": "TUMOR_CANCER",
    "मदुमेह": "DIABETES",
    "मृगौलासम्बन्धी": "KIDNEY_RELATED",
    "कलेजोसम्बन्धी": "LIVER_RELATED",
    "बाथ/जोर्नी दुखाई": "ARTHRITIS_JOINT_PAIN",
    "स्त्री रोग": "GYNECOLOGICAL_DISEASE",
    "पेशागत रोग": "OCCUPATIONAL_DISEASE", 
    "रक्तचाप (उच्च / न्यून)": "BLOOD_PRESSURE_HIGH_LOW",
    "ग्यास्ट्रिक/अल्सर/आन्द्राको रोग": "GASTRIC_ULCER_INTESTINE_DISEASE",
    "पार्किन्सन/अल्जाइमर": "PARKINSON_ALZHEIMER",
    "माइग्रेन": "MIGRAINE",
    "अन्य": "OTHER",
    
    # Additional mappings for common English terms
    "heart disease": "HEART_RELATED_DISEASE",
    "respiratory disease": "RESPIRATION_RELATED",
    "asthma": "ASTHMA",
    "epilepsy": "EPILEPSY",
    "cancer": "TUMOR_CANCER", 
    "diabetes": "DIABETES",
    "kidney disease": "KIDNEY_RELATED",
    "liver disease": "LIVER_RELATED",
    "arthritis": "ARTHRITIS_JOINT_PAIN",
    "joint pain": "ARTHRITIS_JOINT_PAIN",
    "gynecological disease": "GYNECOLOGICAL_DISEASE",
    "occupational disease": "OCCUPATIONAL_DISEASE",
    "blood pressure": "BLOOD_PRESSURE_HIGH_LOW",
    "hypertension": "BLOOD_PRESSURE_HIGH_LOW",
    "gastric": "GASTRIC_ULCER_INTESTINE_DISEASE",
    "ulcer": "GASTRIC_ULCER_INTESTINE_DISEASE",
    "intestinal disease": "GASTRIC_ULCER_INTESTINE_DISEASE",
    "parkinson": "PARKINSON_ALZHEIMER",
    "alzheimer": "PARKINSON_ALZHEIMER",
    "migraine": "MIGRAINE",
    "other": "OTHER",
    
    # Handle nulls and empty strings
    None: "OTHER",
    "": "OTHER"
}

def map_chronic_disease(disease):
    """
    Map chronic disease names to standardized values.
    """
    if not disease or pd.isna(disease):
        return "OTHER"
    
    # Try direct mapping
    standardized = CHRONIC_DISEASE_MAPPING.get(disease)
    if standardized:
        return standardized
    
    # Try lowercase matching for flexibility
    disease_lower = str(disease).lower().strip()
    for key, value in CHRONIC_DISEASE_MAPPING.items():
        if key and isinstance(key, str) and str(key).lower() == disease_lower:
            return value
    
    # Check for keywords in the disease string
    if "मुटु" in disease_lower or "heart" in disease_lower:
        return "HEART_RELATED_DISEASE"
    elif "स्वास" in disease_lower or "respi" in disease_lower:
        return "RESPIRATION_RELATED"
    elif "दम" in disease_lower or "asthma" in disease_lower:
        return "ASTHMA"
    elif "मदुमेह" in disease_lower or "diabet" in disease_lower:
        return "DIABETES"
    elif "रक्तचाप" in disease_lower or "blood press" in disease_lower or "hypertension" in disease_lower:
        return "BLOOD_PRESSURE_HIGH_LOW"
    elif "ग्यास्ट्रिक" in disease_lower or "अल्सर" in disease_lower or "gastric" in disease_lower or "ulcer" in disease_lower:
        return "GASTRIC_ULCER_INTESTINE_DISEASE"
    elif "बाथ" in disease_lower or "जोर्नी" in disease_lower or "arthritis" in disease_lower or "joint" in disease_lower:
        return "ARTHRITIS_JOINT_PAIN"
    
    # Default for unmatched values
    logger.warning(f"Chronic disease '{disease}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def create_insert_data(ward_number, chronic_disease, population):
    """
    Create a data dictionary for insertion specific to chronic disease.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'chronic_disease': chronic_disease,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to chronic disease.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, chronic_disease, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['chronic_disease']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_chronic_diseases table if it doesn't exist.
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
            ward_number INTEGER NOT NULL,
            chronic_disease VARCHAR(100) NOT NULL,
            population INTEGER NOT NULL,
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

def extract_chronic_disease_data(source_conn):
    """Extract chronic disease data from source database."""
    logger.info("Extracting chronic disease data")
    
    # Query to get ward, primary_chronic_disease and population count
    query = """
    SELECT 
        ward_no, 
        primary_chronic_disease,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        primary_chronic_disease IS NOT NULL
        AND primary_chronic_disease != ''
    GROUP BY 
        ward_no, primary_chronic_disease
    ORDER BY 
        ward_no, primary_chronic_disease;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted chronic disease data with {len(df)} ward-disease combinations")
    
    return df

def transform_chronic_disease_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming chronic disease data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map chronic disease types to standardized values
    df['chronic_disease_mapped'] = df['primary_chronic_disease'].apply(map_chronic_disease)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward and mapped chronic disease type to sum populations
    grouped_df = df.groupby(['ward_no', 'chronic_disease_mapped'])['population'].sum().reset_index()
    
    logger.info(f"Transformed chronic disease data with {len(grouped_df)} ward-disease combinations")
    
    return grouped_df

def load_chronic_disease_data(df, target_conn, generate_sql=True):
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
            chronic_disease=row['chronic_disease_mapped'],
            population=row['population']
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

def process_chronic_disease(source_conn, target_conn, generate_sql=True):
    """Process ward-wise chronic disease data from extraction to loading."""
    logger.info("Processing ward-wise chronic disease data")
    
    try:
        # Extract data
        df = extract_chronic_disease_data(source_conn)
        
        # Transform data
        transformed_df = transform_chronic_disease_data(df)
        
        # Load data
        load_chronic_disease_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise chronic disease data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise chronic disease data: {e}")
        return False
