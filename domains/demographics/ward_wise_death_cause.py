import pandas as pd
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import DEMOGRAPHICS_SQL_DIR

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Target table name
TARGET_TABLE = "acme_ward_wise_death_cause"

# Define death cause mappings
DEATH_CAUSE_STATUS = {
    # Infectious and communicable diseases
    "हैजा/झाडा पखाला/आउँ": "HAIJA",
    "निमोनिया": "PNEUMONIA",
    "रुघाखोकी, फ्लु": "FLU",
    "क्षयरोग": "TUBERCULOSIS",
    "कुष्टरोग": "LEPROSY",
    "जण्डीस (कमलपित्त)": "JAUNDICE_HEPATITIS",
    "टाइफाइड": "TYPHOID",
    "भाइरल इन्फ्लुएन्जा": "VIRAL_INFLUENZA",
    "इन्सेफलाइटिस": "ENCEPHALITIS",
    "मेनेन्जाइटिस": "MENINGITIS",
    "हेपाटाइटिस": "HEPATITIS",
    "मलेरिया": "MALARIA",
    "कालाज्वरो": "KALA_AZAR",
    "एचआईभी/एड्स": "HIV_AIDS",
    "अन्य यौन रोग": "OTHER_SEXUALLY_TRANSMITTED_DISEASES",
    "दादुरा": "MEASLES",
    "ठेउला": "SCABIES",
    "रेबिज": "RABIES",
    "कोभिड-19 (कोरोना भाइरस) को कारणले": "COVID_19_CORONAVIRUS",
    "अन्य सरुवा रोग (बर्ड फ्लु /स्वाइन फ्लू/प्लेग आदि)": "OTHER_INFECTIOUS_DISEASES_BIRD_FLU_SWINE_FLU_PLAGUE_ETC",
    
    # Non-communicable diseases
    "मुटुसम्बन्धी रोगहरू": "HEART_RELATED_DISEASES",
    "श्वास प्रश्वाससम्बन्धी रोगहरू": "RESPIRATORY_DISEASES",
    "दम": "ASTHMA",
    "छारे रोग": "EPILEPSY",
    "क्यान्सर": "CANCER",
    "मधुमेह (डाइबिटिज)": "DIABETES",
    "मृगौलासम्बन्धी रोग": "KIDNEY_RELATED_DISEASES",
    "कलेजोसम्बन्धी रोग": "LIVER_RELATED_DISEASES",
    "टाउको सम्बन्धी (ब्रेन ह्यामरेज)": "BRAIN_RELATED_BRAIN_HEMORRHAGE",
    "रक्तचाप (उच्च तथा निम्न रक्तचाप)": "BLOOD_PRESSURE_HIGH_AND_LOW_BLOOD_PRESSURE",
    "ग्यास्ट्रिक अल्सर/आन्द्राको रोग": "GASTRIC_ULCER_INTESTINAL_DISEASE",
    "प्रजनन वा प्रसुतीजन्य कारणहरू": "REPRODUCTIVE_OR_OBSTETRIC_CAUSES",
    
    # External causes
    "यातायात दुर्घटना": "TRAFFIC_ACCIDENT",
    "अन्य दुर्घटना": "OTHER_ACCIDENTS",
    "आत्महत्या": "SUICIDE",
    "प्राकृतिक प्रकोप": "NATURAL_DISASTER",
    
    # Other causes
    "कालगतिले मर्नु": "DEATH_BY_OLD_AGE",
    "अन्य": "OTHER",
    
    # Fallback mappings
    "": "NOT_STATED",
    "unknown": "NOT_STATED",
    "not stated": "NOT_STATED",
    "not specified": "NOT_STATED"
}

def map_death_cause(cause):
    """
    Map death cause to standardized values.
    """
    if not cause or pd.isna(cause):
        return "NOT_STATED"
    
    cause_str = str(cause).strip()
    
    # Return the standardized mapping if exists, otherwise return NOT_STATED for unmapped causes
    return DEATH_CAUSE_STATUS.get(cause_str, "NOT_STATED")

def create_insert_data(ward_number, death_cause, population):
    """
    Create a data dictionary for insertion specific to death cause.
    """
    # Handle NaN values more strictly before conversion
    def safe_int_convert(value):
        if value is None or pd.isna(value):
            return 0  # Default to 0 for population
        try:
            int_val = int(value)
            return int_val
        except (ValueError, TypeError):
            return 0
    
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'death_cause': death_cause,
        'population': safe_int_convert(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to death cause.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, death_cause, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['death_cause']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_death_cause table if it doesn't exist.
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
            death_cause VARCHAR(200) NOT NULL,
            population INTEGER NOT NULL DEFAULT 0,
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

def extract_death_cause_data(source_conn):
    """Extract death cause data from source database."""
    logger.info("Extracting death cause data")
    
    # Query to get ward, death cause, and gender counts from kerabari_death table
    query = """
    SELECT 
        ward_no, 
        deceased_death_cause,
        deceased_gender,
        COUNT(*) as deceased_count
    FROM 
        survey_kerabari_death
    WHERE 
        ward_no IS NOT NULL
        AND deceased_death_cause IS NOT NULL
    GROUP BY 
        ward_no, deceased_death_cause, deceased_gender
    ORDER BY 
        ward_no, deceased_death_cause, deceased_gender;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted death cause data with {len(df)} ward-cause-gender combinations")
    
    return df

def transform_death_cause_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming death cause data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Ensure deceased_count is integer type (it should already be from COUNT(*) but make sure)
    df['deceased_count'] = df['deceased_count'].astype(int)
    
    # Map death cause to standardized values
    df['death_cause_mapped'] = df['deceased_death_cause'].apply(map_death_cause)
    
    # Map gender values (using Nepali gender mappings)
    gender_mapping = {
        "पुरुष": "MALE",
        "महिला": "FEMALE"
    }
    df['gender_mapped'] = df['deceased_gender'].map(gender_mapping).fillna('OTHER')
    
    # Group by ward and death cause to sum deceased counts
    result_data = []
    
    # Get unique combinations of ward and death cause
    ward_cause = df.groupby(['ward_no', 'death_cause_mapped']).size().reset_index(name='count')
    
    for _, row in ward_cause.iterrows():
        ward = row['ward_no']
        death_cause = row['death_cause_mapped']
        
        # Filter data for this combination
        subset = df[(df['ward_no'] == ward) & 
                    (df['death_cause_mapped'] == death_cause)]
        
        # Calculate total deceased count and gender breakdown - handle NaN values
        total_count = subset['deceased_count'].sum()
        total_count = int(total_count) if pd.notna(total_count) else 0
        
        # Handle potential NaN values for gender counts
        male_subset = subset[subset['gender_mapped'] == 'MALE']
        male_count = male_subset['deceased_count'].sum() if not male_subset.empty else 0
        male_count = int(male_count) if pd.notna(male_count) and male_count > 0 else None
        
        female_subset = subset[subset['gender_mapped'] == 'FEMALE']
        female_count = female_subset['deceased_count'].sum() if not female_subset.empty else 0
        female_count = int(female_count) if pd.notna(female_count) and female_count > 0 else None
        
        other_subset = subset[subset['gender_mapped'] == 'OTHER']
        other_count = other_subset['deceased_count'].sum() if not other_subset.empty else 0
        other_count = int(other_count) if pd.notna(other_count) and other_count > 0 else None
        
        # Store results (simplified for the new schema)
        result_data.append({
            'ward_no': ward,
            'death_cause': death_cause,
            'deceased_count': total_count  # Will be mapped to population in load function
        })
    
    result_df = pd.DataFrame(result_data)
    logger.info(f"Transformed death cause data with {len(result_df)} ward-cause combinations")
    
    return result_df

def load_death_cause_data(df, target_conn, generate_sql=True):
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
            death_cause=row['death_cause'],
            population=row['deceased_count'] # Use deceased_count as population
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
        sql_file_path = os.path.join(DEMOGRAPHICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_death_cause(source_conn, target_conn, generate_sql=True):
    """Process ward-wise death cause data from extraction to loading."""
    logger.info("Processing ward-wise death cause data")
    
    try:
        # Extract data
        df = extract_death_cause_data(source_conn)
        
        # Transform data
        transformed_df = transform_death_cause_data(df)
        
        # Load data
        load_death_cause_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise death cause data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise death cause data: {e}")
        return False
