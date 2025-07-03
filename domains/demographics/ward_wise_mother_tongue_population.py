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
TARGET_TABLE = "acme_ward_wise_mother_tongue_population"

def map_language_type(nepali_language):
    """
    Map Nepali language names to standardized enum values.
    """
    mapping = {
        'नेपाली': 'NEPALI',
        'लिम्बु': 'LIMBU',
        'राई': 'RAI',
        'हिन्दी': 'HINDI',
        'नेवारी': 'NEWARI',
        'शेर्पा': 'SHERPA',
        'तामाङ': 'TAMANG',
        'मैथिली': 'MAITHILI',
        'भोजपुरी': 'BHOJPURI',
        'थारू': 'THARU',
        'बज्जिका': 'BAJJIKA',
        'मगर': 'MAGAR',
        'डोटेली': 'DOTELI',
        'उर्दू': 'URDU',
        'उर्दू': 'URDU',  # Handle unicode control character
        'अवधी': 'AWADI',
        'गुरूङ': 'GURUNG',
        'बैतडेली': 'BAITADELI',
        'अछामी': 'AACHAMI',
        'बान्तवा': 'BANTAWA',
        'राजवंशी': 'RAJBANSHI',
        'चाम्लिङ': 'CHAMLING',
        'बझाङ्गी': 'BAJHANGI',
        'सन्थाली': 'SANTHALI',
        'चेपाङ': 'CHEPANG',
        'दनुवार': 'DANUWAR',
        'सुनुवार': 'SUNUWAR',
        'मगही': 'MAGAHI',
        'उराउँ/उराउ': 'URAUN',
        'कुलुङ': 'KULUNG',
        'खाम': 'KHAM',
        'राजस्थानी': 'RAJASTHANI',
        'माझी': 'MAJHI',
        'थामी': 'THAMI',
        'भुजेल': 'BHUJEL',
        'बङला': 'BANGALA',
        'थुलुङ': 'THULUNG',
        'यक्खा': 'YAKKHA',
        'धिमाल': 'DHIMAL',
        'ताजपुरिया': 'TAJPURIYA',
        'अंगिका': 'ANGIKA',
        'सामपाङ': 'SAMPANG',
        'खालिङ': 'KHALING',
        'याम्बुले': 'YAMBULE',
        'कुमाल': 'KUMAL',
        'दरई': 'DARAI',
        'बाहिङ': 'BAHING',
        'बाजुरेली': 'BAJURELI',
        'ह्योल्मो/योल्मो': 'HYOLMO',
        'नाछिरिङ्ग': 'NACHIRING',
        'याम्फू/याम्फे': 'YAMPHU',
        'बोटे': 'BOTE',
        'घले': 'GHALE',
        'डुमी': 'DUMI',
        'लाप्चा': 'LAPCHA',
        'पुमा': 'PUMA',
        'डुङ्माली': 'DUMANGLI',
        'दार्चुलेली': 'DARCHULELI',
        'आठपहरिया': 'AATHPAHARIYA',
        'थकाली': 'THAKALI',
        'जिरेल': 'JIREL',
        'मेवाहाङ': 'MEWAHANG',
        'सांकेतिक भाषा': 'SYMBOLIC_LANGUAGE',
        'तिबेतियन': 'TIBETIAN',
        'मेचे': 'MECHE',
        'छन्त्याल': 'CHANTYAL',
        'राजी': 'RAJI',
        'लोहरूङ': 'LOHARUNG',
        'छिन्ताङ': 'CHINTANG',
        'गनगाई': 'GANGAI',
        'पहरी': 'PAHARI',
        'दैलेखी': 'DAILEKHI',
        'ल्होपा': 'LHOPA',
        'दुरा ': 'DURA',
        'कोचे': 'KOCHE',
        'छिलिङ': 'CHILING',
        'अंग्रेजी': 'ENGLISH',
        'जेरो/जेरूङ': 'JERO',
        'खस': 'KHAS',
        'संस्कृत': 'SANSKRIT',
        'डोल्पाली': 'DOLPALI',
        'हायू/भायू': 'HAYU',
        'तिलुङ': 'TILUNG',
        'कोयी': 'KOYI',
        'किसान': 'KISAN',
        'वालिङ/वालुङ': 'WALING',
        'मुसल्मान': 'MUSALMAN',
        'हिरयान्वी': 'HIRAYANWI',
        'जुम्ली': 'JUMLI',
        'पन्जाबी': 'PUNJABI',
        'ल्होमी': 'LHOMI',
        'बेल्हारे': 'BELHARI',
        'ओरिया': 'ORIYA',
        'सोनहा': 'SONAHA',
        'सिन्धी': 'SINDHI',
        'डडेल्धुरी': 'DADELDHURI',
        'ब्याँसी': 'BYANSI',
        'आसामी': 'AASAMI',
        'खाम्ची/राउटे': 'KAHMCHI',
        'साम': 'SAAM',
        'मनाङ्गे': 'MANAGE',
        'धुलेली': 'DHULELI',
        'फाङ्दुवाली': 'PHANGDUWALI',
        'सुरेल': 'SUREL',
        'माल्पाण्डे': 'MALPANDE',
        'चाइनिज': 'CHINESE',
        'खरिया': 'KHARIYA',
        'कुर्माली': 'KURMALI',
        'बराम': 'BARAM',
        'लिङखिम': 'LINGKHIM',
        'सधनी': 'SADHANI',
        'कागते': 'KAGATE',
        'जोङ्खा': 'JONGKHA',
        'बनकरिया': 'BANKARIYA',
        'काइके': 'KAIKE',
        'गढवाली': 'GADHWALI',
        'फ्रेन्च/फ्रान्सेली': 'FRENCH',
        'मिजो': 'MIJO',
        'कुकी': 'KUKI',
        'कुसुण्डा': 'KUSUNDA',
        'रसियन': 'RUSSIAN',
        'स्पेनिस': 'SPANISH',
        'नगामिज': 'NAGAMIJ',
        'अरबी': 'ARABI',
    }
    
    # Clean up the input string by removing whitespace and unicode control characters
    clean_language = nepali_language.strip().replace('\u200c', '') if isinstance(nepali_language, str) else nepali_language
    
    # Return the mapped value if available, otherwise return 'OTHER'
    return mapping.get(clean_language, 'OTHER')

def create_insert_data(ward_number, language_type, population):
    """
    Create a data dictionary for insertion specific to mother tongue population.
    """
    return {
        'id': generate_uuid(),
        'ward_number': int(ward_number),
        'language_type': language_type,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary specific to mother tongue population.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, ward_number, language_type, population, updated_at, created_at)
    VALUES (
        '{data['id']}',
        {data['ward_number']},
        '{data['language_type']}',
        {data['population']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    """
    Generate SQL to create the ward_wise_mother_tongue_population table if it doesn't exist.
    """
    return f"""
-- Check if {TARGET_TABLE} table exists, if not create it
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_tables WHERE tablename = '{TARGET_TABLE}'
    ) THEN
        -- Create enum type for language types if not exists
        IF NOT EXISTS (
            SELECT 1 FROM pg_type WHERE typname = 'language_type_enum'
        ) THEN
            CREATE TYPE language_type_enum AS ENUM (
                'NEPALI', 'LIMBU', 'RAI', 'HINDI', 'NEWARI', 'SHERPA', 'TAMANG', 
                'MAITHILI', 'BHOJPURI', 'THARU', 'BAJJIKA', 'MAGAR', 'DOTELI', 
                'URDU', 'AWADI', 'GURUNG', 'BAITADELI', 'AACHAMI', 'BANTAWA', 
                'RAJBANSHI', 'CHAMLING', 'BAJHANGI', 'SANTHALI', 'CHEPANG', 
                'DANUWAR', 'SUNUWAR', 'MAGAHI', 'URAUN', 'KULUNG', 'KHAM', 
                'RAJASTHANI', 'MAJHI', 'THAMI', 'BHUJEL', 'BANGALA', 'THULUNG', 
                'YAKKHA', 'DHIMAL', 'TAJPURIYA', 'ANGIKA', 'SAMPANG', 'KHALING', 
                'YAMBULE', 'KUMAL', 'DARAI', 'BAHING', 'BAJURELI', 'HYOLMO', 
                'NACHIRING', 'YAMPHU', 'BOTE', 'GHALE', 'DUMI', 'LAPCHA', 'PUMA', 
                'DUMANGLI', 'DARCHULELI', 'AATHPAHARIYA', 'THAKALI', 'JIREL', 
                'MEWAHANG', 'SYMBOLIC_LANGUAGE', 'TIBETIAN', 'MECHE', 'CHANTYAL', 
                'RAJI', 'LOHARUNG', 'CHINTANG', 'GANGAI', 'PAHARI', 'DAILEKHI', 
                'LHOPA', 'DURA', 'KOCHE', 'CHILING', 'ENGLISH', 'JERO', 'KHAS', 
                'SANSKRIT', 'DOLPALI', 'HAYU', 'TILUNG', 'KOYI', 'KISAN', 'WALING', 
                'MUSALMAN', 'HIRAYANWI', 'JUMLI', 'PUNJABI', 'LHOMI', 'BELHARI', 
                'ORIYA', 'SONAHA', 'SINDHI', 'DADELDHURI', 'BYANSI', 'AASAMI', 
                'KAHMCHI', 'SAAM', 'MANAGE', 'DHULELI', 'PHANGDUWALI', 'SUREL', 
                'MALPANDE', 'CHINESE', 'KHARIYA', 'KURMALI', 'BARAM', 'LINGKHIM', 
                'SADHANI', 'KAGATE', 'JONGKHA', 'BANKARIYA', 'KAIKE', 'GADHWALI', 
                'FRENCH', 'MIJO', 'KUKI', 'KUSUNDA', 'RUSSIAN', 'SPANISH', 
                'NAGAMIJ', 'ARABI', 'OTHER'
            );
        END IF;

        CREATE TABLE {TARGET_TABLE} (
            id VARCHAR(36) PRIMARY KEY,
            ward_number INTEGER NOT NULL,
            language_type language_type_enum NOT NULL,
            population INTEGER,
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

def extract_mother_tongue_data(source_conn):
    """Extract mother tongue population data from source database."""
    logger.info("Extracting mother tongue population data")
    
    # Query to get ward and mother tongue distribution
    query = """
    SELECT 
        ward_no, 
        primary_mother_tongue,
        COUNT(*) as population
    FROM 
        synthetic_survey_kerabari_individual
    WHERE 
        primary_mother_tongue IS NOT NULL
    GROUP BY 
        ward_no, primary_mother_tongue
    ORDER BY 
        ward_no, primary_mother_tongue;
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted mother tongue data with {len(df)} ward-language combinations")

    return df


def transform_mother_tongue_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming mother tongue population data")
    
    # Ensure ward_no is integer type
    df['ward_no'] = df['ward_no'].astype(int)
    
    # Map Nepali language names to standardized enum values
    df['language_type_mapped'] = df['primary_mother_tongue'].apply(map_language_type)
    
    # Ensure population is integer type
    df['population'] = df['population'].astype(int)
    
    # Group by ward and mapped language to sum populations
    # (in case multiple Nepali terms map to same enum)
    grouped_df = df.groupby(['ward_no', 'language_type_mapped'])['population'].sum().reset_index()
    
    logger.info(f"Transformed into {len(grouped_df)} ward-language combinations")
    
    return grouped_df

def load_mother_tongue_data(df, target_conn, generate_sql=True):
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
            language_type=row['language_type_mapped'],
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
        sql_file_path = os.path.join(DEMOGRAPHICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        
        # Save to file
        save_sql_to_file(full_sql_script, sql_file_path)
    
    # Insert data into target database
    success = insert_data_to_db(target_conn, insert_statements)
    
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    
    return success

def process_mother_tongue_population(source_conn, target_conn, generate_sql=True):
    """Process ward-wise mother tongue population data from extraction to loading."""
    logger.info("Processing ward-wise mother tongue population data")
    
    try:
        # Extract data
        df = extract_mother_tongue_data(source_conn)
        
        # Transform data
        transformed_df = transform_mother_tongue_data(df)
        
        # Load data
        load_mother_tongue_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing ward-wise mother tongue population data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise mother tongue population data: {e}")
        return False
