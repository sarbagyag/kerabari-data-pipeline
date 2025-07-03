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
TARGET_TABLE = "acme_municipality_wise_foreign_employment_countries"

def map_country(nepali_country):
    """
    Map Nepali country names to standardized enum values.
    Countries are mapped according to the specifications provided.
    """
    mapping = {
        # Original mappings
        'अजरबैजान': 'AZERBAIJAN',      # azerbaijan
        'नाइजर': 'NIGER',               # niger
        'नाइजेरिया': 'NIGERIA',         # nigeria
        'निकारागुवा': 'NICARAGUA',      # nicaragua
        'नेदरल्याण्ड': 'THE_NETHERLANDS', # the_netherlands
        'नर्वे': 'NORWAY',               # norway
        'नेपाल': 'NEPAL',               # nepal
        'न्यूजिल्याण्ड': 'NEW_ZEALAND',  # new_zealand
        'अनुमोज': 'PERMISSION',         # permission
        'पनामा': 'PANAMA',              # panama
        'पेरु': 'PERU',                 # peru
        'बोस्निया': 'BOSNIA',           # bosnia
        'फिलिपिन्स': 'PHILIPPINES',     # philippines
        'पाकिस्तान': 'PAKISTAN',        # pakistan
        'पोल्याण्ड': 'POLAND',          # poland
        'पोर्चुगल': 'PORTUGAL',         # portugal
        'पोर्टोरिको': 'PUERTO_RICO',    # puerto_rico
        'पाराग्वै': 'PARAGUAY',         # paraguay
        'कतार': 'QATAR',                # qatar
        'इन्टरपोल': 'INTERPOL',         # interpol
        'रोमानिया': 'ROMANIA',          # romania
        'बंगलादेश': 'BANGLADESH',       # bangladesh
        'रुस': 'RUSSIA',                # russia
        'साउदी अरेबिया': 'SAUDI_ARABIA', # saudi_arabia
        
        # Additional mappings
        'सेसेल्स': 'CECILS',           # cecils
        'सृडान': 'SRIDAN',             # sridan
        'स्वीडेन': 'SWEDEN',            # sweden
        'सिंगापुर': 'SINGAPORE',        # singapore
        'सियरा लियोन': 'SIERRA_LEONE', # sierra_leone
        'सानमारिनो': 'SAN_MARINO',      # san_marino
        'सेनेगल': 'SENEGAL',           # senegal
        'सोमालिया': 'SOMALIA',          # somalia
        'बेल्जियम': 'BELGIUM',          # belgium
        'सिरिया': 'SYRIA',             # syria
        'चाड': 'FESTIVAL',             # festival (Chad)
        'टोगो': 'TOGO',                # togo
        'थाईल्याण्ड': 'THAILAND',       # thailand
        'ताजिकस्तान': 'TAJIKISTAN',    # tajikistan
        'टोक्यो': 'BITE',              # bite (Tokyo)
        'ट्युनिसिया': 'TUNISIA',       # tunisia
        'टोङगा': 'TONGA',              # tonga
        'पूर्वी टिमोर': 'EAST_TIMOR',   # east_timor
        'टर्की': 'TURKEY',              # turkey
        'बुल्गेरिया': 'BULGARIA',       # bulgaria
        'ताइवान': 'TAIWAN',            # taiwan
        'तान्जानिया': 'TANZANIA',       # tanzania
        'डङ्गल्याण्ड': 'DUNGLAND',      # dungland
        'युक्रेन': 'UKRAINE',           # ukraine
        'युगान्डा': 'UGANDA',           # uganda
        'संयुक्त राष्ट्र संघ': 'UNITED_NATIONS', # united_nations
        'संयुक्त राज्य अमेरिका': 'UNITED_STATES_OF_AMERICA', # usa
        'उरुग्वै': 'URUGUAY',           # uruguay
        'उज्वेकिस्तान': 'UZBEKISTAN',   # uzbekistan
        'बहराईन': 'BAHRAIN',           # bahrain
        'भ्याटिकन सिटी': 'VATICAN_CITY', # vatican_city
        'भेनेजुएला': 'VENEZUELA',       # venezuela
        'भियतनाम': 'VIETNAM',          # vietnam
        'भान्\u200cआटा': 'FLOUR',       # flour
        'वेल्स': 'WELLS',              # wells
        'पश्चिमी समोआ': 'WESTERN_SAMOA', # western_samoa
        'यमन': 'YEMEN',                # yemen
        'टोकियो': 'TOKYO',             # tokyo
        'युगोस्लाभिया': 'YUGOSLAVIA',   # yugoslavia
        'दक्षिण अफ्रिका': 'SOUTH_AFRICA', # south_africa
        'बुरुन्डी': 'BURUNDI',          # burundi
        'जाम्बिया': 'ZAMBIA',           # zambia
        'जायर': 'ZAIRE',               # zaire
        'जिम्बावै': 'ZIMBABWE',         # zimbabwe
        'कोसोभो': 'KOSOVO',            # kosovo
        'ब्रुनाई': 'BRUNEI',            # brunei
        'बोलिभिया': 'BOLIVIA',         # bolivia
        'ब्राजिल': 'BRAZIL',            # brazil
        'संयुक्त अरब ईमिरेटस': 'UNITED_ARAB_EMIRATES', # uae
        'बहामास': 'BAHAMAS',           # bahamas
        'भूटान': 'BHUTAN',             # bhutan
        'बोत्स्वाना': 'BOTSWANA',       # botswana
        'बैलारुस': 'BELARUS',           # belarus
        'क्यानडा': 'CANADA',            # canada
        'कम्बोडीया': 'CAMBODIA',         # cambodia
        'कंगो': 'CONGO',                # congo
        'स्विटजरल्याण्ड': 'SWITZERLAND', # switzerland
        'क्रोएसिया': 'CROATIA',         # croatia
        'चिली': 'CHILE',               # chile
        'अफगानिस्तान': 'AFGHANISTAN',   # afghanistan
        'क्यामरुन': 'CAMEROON',         # cameroon
        'चीन': 'CHINA',                # china
        'कोलम्बीया': 'COLOMBIA',        # colombia
        'कोष्टारिका': 'COSTA_RICA',      # costa_rica
        'क्युवा': 'CUBA',               # cuba
        'साईप्रस': 'CYPRUS',            # cyprus
        'चेकोस्लोभाकिया': 'CZECHOSLOVAKIA', # czechoslovakia
        'जर्मनी': 'GERMANY',            # germany
        'दुवैइ': 'DUBAI',              # dubai
        'डेनमार्क': 'DENMARK',          # denmark
        'अल्बानिया': 'ALBANIA',         # albania
        'डोमिनीका': 'DOMINICA',         # dominica
        'अल्जेरिया': 'ALGERIA',         # algeria
        'इक्वेडर': 'ECUADOR',           # ecuador
        'इजिप्ट': 'EGYPT',              # egypt
        'स्पेन': 'SPAIN',              # spain
        'इथियोपिया': 'ETHIOPIA',        # ethiopia
        'फिन्ल्याण्ड': 'FINLAND',        # finland
        'फिजी': 'FIJI',                # fiji
        'फान्स': 'FAWNS',              # fawns (France)
        'संयुक्त अधिराज्य बेलायत': 'UNITED_KINGDOM_OF_GREAT_BRITAIN', # uk
        'अर्मनिया': 'ARMENIA',          # armenia
        'घाना': 'GHANA',               # ghana
        'गाम्बिया': 'GAMBIA',           # gambia
        'गिनी': 'GUINEA',              # guinea
        'ग्रीस': 'GREECE',              # greece
        'ग्वाटेमाला': 'GUATEMALA',       # guatemala
        'हङकङ': 'HONG_KONG',           # hong_kong
        'हवाई': 'THE_AIR',             # the_air (Hawaii)
        'हाइटी': 'HAITI',               # haiti
        'हङ्गेरि': 'HUNGARY',           # hungary
        'ईण्डोनेसिया': 'INDONESIA',      # indonesia
        'अङ्गोला': 'ANGOLA',            # angola
        'आयरल्याण्ड रिपब्लीक': 'REPUBLIC_OF_IRELAND', # ireland
        'ईजरायल': 'ISRAEL',            # israel
        'भारत': 'INDIA',               # india
        'इराक': 'IRAQ',                # iraq
        'इरान': 'IRAN',                # iran
        'आईसल्याण्ड': 'ICELAND',        # iceland
        'ईटाली': 'ITALY',               # italy
        'जमैका': 'JAMAICA',            # jamaica
        'जोर्डन': 'JORDAN',             # jordan
        'जापान': 'JAPAN',              # japan
        'अर्जेन्टिना': 'ARGENTINA',      # argentina
        'केन्या': 'KENYA',              # kenya
        'उत्तर कोरिया': 'NORTH_KOREA',   # north_korea
        'दक्षिण कोरिया': 'SOUTH_KOREA',  # south_korea
        'काठमाण्डौ': 'KATHMANDU',       # kathmandu
        'कृ्‌वेत': 'KUWAIT',         # krvet (Kuwait)
        'काजकस्तान': 'KAZAKHSTAN',      # kazakhstan
        'अर्षट्या': 'ARSHATYA',         # arshatya
        'लेवनान': 'LEBANON',            # lebanon
        'हर्जगोभिना': 'HERZEGOVINA',     # herzegovina
        'अष्ट्रेलिया': 'AUSTRALIA',      # australia
        'श्रीलंका': 'SRI_LANKA',        # sri_lanka
        'लाईबैेरिया': 'LIBERIA',         # liberia
        'लिसोथो': 'LESOTHO',           # lesotho
        'लक्जेम्वर्ग': 'LUXEMBOURG',     # luxembourg
        'लियोन': 'LEON',               # leon
        'लिबिया': 'LIBYA',              # libya
        'मोरक्को': 'MOROCCO',           # morocco
        'मोनाको': 'MONACO',            # monaco
        'माडागास्कर': 'MADAGASCAR',     # madagascar
        'माली': 'THE_GARDENER',        # the_gardener (Mali)
        'अरुबा': 'ARUBA',              # aruba
        'म्यानमार': 'MYANMAR',          # myanmar
        'मंगोलिया': 'MONGOLIA',        # mongolia
        'मकाउ': 'MACAU',               # macau
        'माल्टा': 'MALTA',              # malta
        'मौरीसस': 'MAURITIUS',         # mauritius
        'माल्दिभ्स': 'MALDIVES',        # maldives
        'मेक्सिको': 'MEXICO',           # mexico
        'मलेशिया': 'MALAYSIA',         # malaysia
        'मोजाम्बिक': 'MOZAMBIQUE',      # mozambique
        'नामीबिया': 'NAMIBIA'          # namibia
    }
    
    # Clean up the input string
    clean_country = nepali_country.strip() if isinstance(nepali_country, str) else nepali_country
    
    # Return the mapped value if available, otherwise return 'OTHER'
    return mapping.get(clean_country, 'OTHER')

def create_insert_data(country, population):
    """
    Create a data dictionary for insertion.
    """
    return {
        'id': generate_uuid(),
        'country': country,
        'population': int(population),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    """
    Generate an SQL insert statement from a data dictionary.
    """
    return f"""
    INSERT INTO {TARGET_TABLE} 
    (id, country, population, created_at, updated_at)
    VALUES (
        '{data['id']}',
        '{data['country']}',
        {data['population']},
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
        -- First create the enum type if it doesn't exist
        IF NOT EXISTS (
            SELECT 1 FROM pg_type WHERE typname = 'country_enum'
        ) THEN
            CREATE TYPE country_enum AS ENUM (
                'AZERBAIJAN', 'NIGER', 'NIGERIA', 'NICARAGUA', 'THE_NETHERLANDS',
                'NORWAY', 'NEPAL', 'NEW_ZEALAND', 'PERMISSION', 'PANAMA',
                'PERU', 'BOSNIA', 'PHILIPPINES', 'PAKISTAN', 'POLAND',
                'PORTUGAL', 'PUERTO_RICO', 'PARAGUAY', 'QATAR', 'INTERPOL',
                'ROMANIA', 'BANGLADESH', 'RUSSIA', 'SAUDI_ARABIA', 
                'CECILS', 'SRIDAN', 'SWEDEN', 'SINGAPORE', 'SIERRA_LEONE', 
                'SAN_MARINO', 'SENEGAL', 'SOMALIA', 'BELGIUM', 'SYRIA', 
                'FESTIVAL', 'TOGO', 'THAILAND', 'TAJIKISTAN', 'BITE', 
                'TUNISIA', 'TONGA', 'EAST_TIMOR', 'TURKEY', 'BULGARIA', 
                'TAIWAN', 'TANZANIA', 'DUNGLAND', 'UKRAINE', 'UGANDA', 
                'UNITED_NATIONS', 'UNITED_STATES_OF_AMERICA', 'URUGUAY', 'UZBEKISTAN', 
                'BAHRAIN', 'VATICAN_CITY', 'VENEZUELA', 'VIETNAM', 'FLOUR', 
                'WELLS', 'WESTERN_SAMOA', 'YEMEN', 'TOKYO', 'YUGOSLAVIA', 
                'SOUTH_AFRICA', 'BURUNDI', 'ZAMBIA', 'ZAIRE', 'ZIMBABWE', 
                'KOSOVO', 'BRUNEI', 'BOLIVIA', 'BRAZIL', 'UNITED_ARAB_EMIRATES', 
                'BAHAMAS', 'BHUTAN', 'BOTSWANA', 'BELARUS', 'CANADA', 
                'CAMBODIA', 'CONGO', 'SWITZERLAND', 'CROATIA', 'CHILE', 
                'AFGHANISTAN', 'CAMEROON', 'CHINA', 'COLOMBIA', 'COSTA_RICA', 
                'CUBA', 'CYPRUS', 'CZECHOSLOVAKIA', 'GERMANY', 'DUBAI', 
                'DENMARK', 'ALBANIA', 'DOMINICA', 'ALGERIA', 'ECUADOR', 
                'EGYPT', 'SPAIN', 'ETHIOPIA', 'FINLAND', 'FIJI', 
                'FAWNS', 'UNITED_KINGDOM_OF_GREAT_BRITAIN', 'ARMENIA', 'GHANA', 'GAMBIA', 
                'GUINEA', 'GREECE', 'GUATEMALA', 'HONG_KONG', 'THE_AIR', 
                'HAITI', 'HUNGARY', 'INDONESIA', 'ANGOLA', 'REPUBLIC_OF_IRELAND', 
                'ISRAEL', 'INDIA', 'IRAQ', 'IRAN', 'ICELAND', 
                'ITALY', 'JAMAICA', 'JORDAN', 'JAPAN', 'ARGENTINA', 
                'KENYA', 'NORTH_KOREA', 'SOUTH_KOREA', 'KATHMANDU', 'KRVET', 
                'KAZAKHSTAN', 'ARSHATYA', 'LEBANON', 'HERZEGOVINA', 'AUSTRALIA', 
                'SRI_LANKA', 'LIBERIA', 'LESOTHO', 'LUXEMBOURG', 'LEON', 
                'LIBYA', 'MOROCCO', 'MONACO', 'MADAGASCAR', 'THE_GARDENER', 
                'ARUBA', 'MYANMAR', 'MONGOLIA', 'MACAU', 'MALTA', 
                'MAURITIUS', 'MALDIVES', 'MEXICO', 'MALAYSIA', 'MOZAMBIQUE', 
                'NAMIBIA', 'OTHER',FRANCE, KUWAIT
            );
        END IF;

        -- Create the table
        CREATE TABLE {TARGET_TABLE} (
            id          varchar(36)   not null primary key,
            country     country_enum  not null,
            population  integer       not null,
            created_at  timestamp     default now(),
            updated_at  timestamp     default now()
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

def extract_foreign_employment_data(source_conn):
    """Extract foreign employment data from source database."""
    logger.info("Extracting foreign employment country data")
    
    # Query to get country and count individuals (no ward grouping)
    query = """
    SELECT 
        absentee_country,
        COUNT(*) as population_count
    FROM 
        staging_kerabari_individual
    WHERE 
        absentee_country IS NOT NULL 
        AND absentee_country != ' '
        AND absentee_country != ''
    GROUP BY 
        absentee_country
    ORDER BY 
        absentee_country
    """
    
    # Execute the query
    df = execute_query(source_conn, query)
    logger.info(f"Extracted {len(df)} country combinations for foreign employment")
    
    return df

def transform_foreign_employment_data(df):
    """Transform the extracted data into the required format."""
    logger.info("Transforming foreign employment country data")
    
    # Map country names to standardized enum values
    df['country_mapped'] = df['absentee_country'].apply(map_country)
    
    # Group by country to sum populations across all wards
    result_df = df.groupby(['country_mapped']).agg({
        'population_count': 'sum'
    }).reset_index()
    
    # Rename columns to match expected format
    result_df.rename(columns={
        'country_mapped': 'country',
        'population_count': 'population'
    }, inplace=True)
    
    logger.info(f"Transformed {len(result_df)} foreign employment country records")
    
    return result_df

def load_foreign_employment_data(df, target_conn, generate_sql=True):
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
            country=row['country'],
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

def process_municipality_wise_foreign_employment_countries(source_conn, target_conn, generate_sql=True):
    """Process municipality-wise foreign employment countries data from extraction to loading."""
    logger.info("Processing municipality-wise foreign employment countries data")
    
    try:
        # Extract data
        df = extract_foreign_employment_data(source_conn)
        
        # Transform data
        transformed_df = transform_foreign_employment_data(df)
        
        # Load data
        load_foreign_employment_data(transformed_df, target_conn, generate_sql)
        
        logger.info("Completed processing municipality-wise foreign employment countries data")
        return True
    except Exception as e:
        logger.error(f"Error processing municipality-wise foreign employment countries data: {e}")
        return False
