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
TARGET_TABLE = "acme_ward_wise_major_skills"

def map_skill_type(nepali_skill):
    """
    Map Nepali skill types to standardized enum values.
    """
    mapping = {
        'शिक्षण शिकाई सम्बन्धी': 'TEACHING_RELATED',
        'श्रव्यदृष्य तथा फोटोग्राफी सम्बन्धी': 'PHOTOGRAPHY_RELATED',
        'हस्तकला / चित्रकला सम्बन्धी': 'HANDICRAFT_RELATED',
        'गीत, संगीत, नाटक तथा कलाकारिता': 'MUSIC_DRAMA_RELATED',
        'मूर्तिकला, प्रस्तरकला, काष्ठकला': 'STONEWORK_WOODWORK',
        'सिकर्मी, डकर्मी सम्बन्धी': 'CARPENTERY_RELATED',
        'प्लम्बिङ सम्बन्धी': 'PLUMBING',
        'मानव स्वास्थ्यसँग सम्बन्धी': 'HUMAN_HEALTH_RELATED',
        'पशुचिकित्सा तथा पशुस्वास्थ्य सम्बन्धी': 'ANIMAL_HEALTH_RELATED',
        'बिजुली जडान सम्बन्धी': 'ELECTRICITY_INSTALLMENT_RELATED',
        'होटल तथा रेष्टुरेन्ट सम्बन्धी': 'HOTEL_RESTAURANT_RELATED',
        'कृषि, पशुपालन, माछापालन, मौरी पालन सम्बन्धी': 'AGRICULTURE_RELATED',
        'छपाई सम्बन्धी': 'PRINTING_RELATED',
        'सवारी चालक सम्बन्धी': 'DRIVING_RELATED',
        'यान्त्रिक (मेकानिक्स) सम्बन्धी': 'MECHANICS_RELATED',
        'फर्निचर बनाउने सम्बन्धी': 'FURNITURE_RELATED',
        'जुत्ता चप्पल बनाउने': 'SHOEMAKING_RELATED',
        'पोशाक बनाउने / सिउने': 'SEWING_RELATED',
        'गरगहना बनाउने / मर्मत गर्ने': 'JWELLERY_MAKING_RELATED',
        'केश सजावट / श्रृंगार सम्बन्धी': 'BEUATICIAN_RELATED',
        'आत्मसुरक्षा सम्बन्धी / शारीरिक सुगठन': 'SELF_PROTECTION_RELATED',
        'जमिनको सर्भेक्षण सम्बन्धी': 'LAND_SURVEY_RELATED',
        'कम्प्युटर विज्ञान सम्बन्धी': 'COMPUTER_SCIENCE_RELATED',
        'इन्जिनियरिङ डिजाईन सम्बन्धी': 'ENGINEERING_DESIGN_RELATED',
        'रेडियो, टेलिभिजन, मोबाईल, तथा अन्य ईलेक्ट्रिक बस्तुको मर्मत': 'RADIO_TELEVISION_ELECTRICAL_REPAIR',
        'साहित्य श्रृजना सम्बन्धी': 'LITERARY_CREATION_RELATED',
        'अन्य': 'OTHER',
        'विशेष सीप / दक्षता नभएको': 'NONE'
    }
    
    # Clean up the input string by removing whitespace
    clean_skill = nepali_skill.strip() if isinstance(nepali_skill, str) else nepali_skill
    
    # Return the mapped value if available, otherwise return 'OTHER'
    return mapping.get(clean_skill, 'OTHER')

def create_insert_data(ward_number, skill, population):
    """
    Create a data dictionary for insertion specific to major skills.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'skill': skill,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to major skills.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, skill, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['skill']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_major_skills table if it doesn't exist.
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
            skill TEXT NOT NULL,
            population INTEGER NOT NULL DEFAULT 0 CHECK (population >= 0),
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

def extract_major_skills_data(source_conn):
    """Extract major skills data from source database."""
    logger.info("Extracting major skills data")
    
    # Query to get ward and major skills for individuals
    query = """
    SELECT 
        ward_no, 
        primary_skill,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        primary_skill IS NOT NULL AND primary_skill != 'विशेष सीप / दक्षता नभएको' AND primary_skill != 'अन्य' AND primary_skill != ''
    GROUP BY
        ward_no, primary_skill
    ORDER BY 
        ward_no, primary_skill;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted skills data with {len(df)} ward-skill combinations")
    
    return df

def transform_major_skills_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming major skills data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map Nepali skill types to standardized enum values
    df['skill_mapped'] = df['primary_skill'].apply(map_skill_type)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    logger.info(f"Transformed major skills data with {len(df)} ward-skill combinations")
    
    return df

def load_major_skills_data(df, target_conn, generate_sql=True):
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
            skill=row['skill_mapped'],
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
        sql_file_path = os.path.join(ECONOMICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_major_skills(source_conn, target_conn, generate_sql=True):
    """Process ward-wise major skills data from extraction to loading."""
    logger.info("Processing ward-wise major skills data")
    
    try:
        # Extract data
        df = extract_major_skills_data(source_conn)
        
        # Transform data
        transformed_df = transform_major_skills_data(df)
        
        # Load data
        load_major_skills_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise major skills data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise major skills data: {e}")
        return False
