import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import EDUCATION_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_ward_wise_major_subject"

# Define subject type mappings based on the provided enum values
SUBJECT_TYPE_MAPPING = {
    # Map from Nepali to standard enum values
    "अंग्रेजी": "ENGLISH",
    "अर्थशास्त्र": "ECONOMICS",
    "इन्जिनियरङ्गि": "ENGINEERING",
    "इतिहास": "HISTORY",
    "गृहविज्ञान": "HOME_ECONOMICS",
    "ग्रामीण विकास": "RURAL_DEVELOPMENT",
    "चिकित्सा": "MEDICINE",
    "जनसंख्या अध्ययन": "POPULATION_STUDY",
    "जीवशास्त्र": "BIOLOGY",
    "तथ्यांकशास्त्र": "STATISTICS",
    "नेपाली": "NEPALI",
    "पर्यटन": "TOURISM",
    "भूगोल": "GEOGRAPHY",
    "भौतिकशास्त्र": "PHYSICS",
    "मनोविज्ञान": "PSYCHOLOGY",
    "मानविकी": "HUMANITIES",
    "रसायनशास्त्र": "CHEMISTRY",
    "राजनीतिकशास्त्र": "POLITCAL_SCIENCE",
    "वन, कृषि तथा पशुविज्ञान": "FORESTRY_AND_AGRICULTRE",
    "वनस्पतिशास्त्र": "BOTANY",
    "वाणिज्य": "COMMERCE",
    "विज्ञान": "SCIENCE",
    "व्यवस्थापन": "MANAGEMENT",
    "शिक्षा": "EDUCATION",
    "शिक्षाशास्त्र": "EDUCATIONAL_SCIENCE",
    "संस्कृत": "SANSKRIT",
    "संस्कृति": "ARTS",
    "समाजशास्त्र": "SOCIAL_SCIENCES",
    "सूचना प्रविधि": "INFORMATION_TECHNOLOGY",
    "हिन्दी": "HINDI",
    "अन्य": "OTHER",
    
    # Common variations and abbreviations
    "Computer Science": "INFORMATION_TECHNOLOGY",
    "IT": "INFORMATION_TECHNOLOGY",
    "BBA": "MANAGEMENT",
    "MBA": "MANAGEMENT",
    "MBBS": "MEDICINE",
    "BEd": "EDUCATION",
    "MEd": "EDUCATION",
    "BSc": "SCIENCE",
    "BCom": "COMMERCE",
    "BBS": "MANAGEMENT",
    
    # Default values for None or empty strings
    None: "OTHER",
    "": "OTHER"
}

def map_subject_type(subject):
    """
    Map subject names to standardized enum values.
    """
    if not subject or pd.isna(subject):
        return "OTHER"
    
    # Try direct mapping
    standardized = SUBJECT_TYPE_MAPPING.get(subject)
    if standardized:
        return standardized
    
    # Try lowercase matching for flexibility
    subject_lower = str(subject).lower().strip()
    for key, value in SUBJECT_TYPE_MAPPING.items():
        if key and isinstance(key, str) and str(key).lower() == subject_lower:
            return value
    
    # Check for keywords in the subject string
    subject_lower = str(subject).lower()
    if "management" in subject_lower or "व्यवस्थापन" in subject_lower:
        return "MANAGEMENT"
    elif "science" in subject_lower or "विज्ञान" in subject_lower:
        return "SCIENCE"
    elif "education" in subject_lower or "शिक्षा" in subject_lower:
        return "EDUCATION"
    elif "humanities" in subject_lower or "मानविकी" in subject_lower:
        return "HUMANITIES"
    elif "computer" in subject_lower or "it" in subject_lower or "सूचना प्रविधि" in subject_lower:
        return "INFORMATION_TECHNOLOGY"
    elif "english" in subject_lower or "अंग्रेजी" in subject_lower:
        return "ENGLISH"
    elif "medicine" in subject_lower or "चिकित्सा" in subject_lower:
        return "MEDICINE"
    elif "engineering" in subject_lower or "इन्जिनियरङ्गि" in subject_lower:
        return "ENGINEERING"
    elif "commerce" in subject_lower or "वाणिज्य" in subject_lower:
        return "COMMERCE"
    elif "social" in subject_lower or "समाजशास्त्र" in subject_lower:
        return "SOCIAL_SCIENCES"
    elif "economics" in subject_lower or "अर्थशास्त्र" in subject_lower:
        return "ECONOMICS"
    
    # Default for unmatched values
    logger.warning(f"Subject '{subject}' not found in mapping. Using 'OTHER' as default.")
    return "OTHER"

def create_insert_data(ward_number, subject_type, population):
    """
    Create a data dictionary for insertion specific to subject.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'subject_type': subject_type,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to subject.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, subject_type, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['subject_type']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_primary_subject table if it doesn't exist.
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
            subject_type VARCHAR(100) NOT NULL,
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

def extract_primary_subject_data(source_conn):
    """Extract major subject data from source database."""
    logger.info("Extracting major subject data")
    
    # Query to get ward, primary_subject and population count
    query = """
    SELECT 
        ward_no, 
        primary_subject,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        primary_subject IS NOT NULL
    GROUP BY 
        ward_no, primary_subject
    ORDER BY 
        ward_no, primary_subject;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted major subject data with {len(df)} ward-subject combinations")
    
    return df

def transform_primary_subject_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming major subject data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map subject to standardized values
    df['subject_type_mapped'] = df['primary_subject'].apply(map_subject_type)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward and mapped subject type to sum populations
    grouped_df = df.groupby(['ward_no', 'subject_type_mapped'])['population'].sum().reset_index()
    
    logger.info(f"Transformed major subject data with {len(grouped_df)} ward-subject combinations")
    
    return grouped_df

def load_primary_subject_data(df, target_conn, generate_sql=True):
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
            subject_type=row['subject_type_mapped'],
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
        sql_file_path = os.path.join(EDUCATION_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_primary_subject(source_conn, target_conn, generate_sql=True):
    """Process ward-wise major subject data from extraction to loading."""
    logger.info("Processing ward-wise major subject data")
    
    try:
        # Extract data
        df = extract_primary_subject_data(source_conn)
        
        # Transform data
        transformed_df = transform_primary_subject_data(df)
        
        # Load data
        load_primary_subject_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise major subject data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise major subject data: {e}")
        return False
