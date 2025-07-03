import pandas as pd
import logging
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

TARGET_TABLE = "acme_ward_wise_economically_challenged_population"

# --- Severity scoring weights ---
WEIGHTS = {
    'no_land': 2,
    'poor_house_base': 1,
    'poor_outer_wall': 1,
    'poor_roof': 1,
    'no_facilities': 2,
    'few_facilities': 1,
    'only_labour_income': 2,
    'no_income_source': 3,
    'no_remittance': 1,
    'has_loan': 1,
    'female_headed': 1,
    'single_parent': 1,
    'elderly_only': 1,
    'children_only': 1,
    'marginalized_caste': 1,
    'illiterate': 2,
    'low_education': 1,
    'no_skills': 1,
    'has_disability': 1,
    'has_chronic_disease': 1,
    'lacks_toilet': 1,
    'lacks_clean_water': 1,
    'lacks_electricity': 1,
    'no_bank_account': 1,
    'no_health_insurance': 1,
}

SEVERITY_THRESHOLDS = [
    (9, 'Severely Challenged'),
    (6, 'Moderately Challenged'),
    (3, 'Mildly Challenged'),
    (0, 'Not Economically Challenged'),
]

# --- ENUM MAPPINGS ---
LAND_OWNERSHIP_ENUM = {
    'निजी': 'private',
    'गुठी': 'guthi',
    'सार्वजनिक/ऐलानी': 'public_eilani',
    'गाउँ ब्लक': 'village_block',
    'अन्य (खुलाउने)': 'other',
}
HOUSE_BASE_ENUM = {
    'ढलान पिल्लरसहितको': 'concrete_pillar',
    'सिमेन्टको जोडाइ भएको इँटा/ढुङ्गा': 'cement_joined',
    'माटोको जोडाइ भएको इँटा/ढुङ्गा': 'mud_joined',
    'काठको खम्बा गाडेको': 'wood_pole',
    'अन्य (खुलाउने)': 'other',
}
HOUSE_OUTER_WALL_ENUM = {
    'सिमेन्टको जोडाइ भएको इँटा/ढुङ्गा': 'cement_joined',
    'काँचो इँटा': 'unbaked_brick',
    'माटोको जोडाइ भएको इँटा/ढुङ्गा': 'mud_joined',
    'जस्ता/टिन/च्यादर': 'tin',
    'बाँसजन्य सामग्री': 'bamboo',
    'काठ/फल्याक': 'wood',
    'प्रि फ्याब': 'prefab',
    'अन्य (खुलाउने)': 'other',
}
HOUSE_ROOF_ENUM = {
    'सिमेन्ट ढलान': 'cement',
    'जस्ता/टिन': 'tin',
    'टायल/खपडा/झिँगटी': 'tile',
    'खर/पराल/छ्वाली': 'straw',
    'काठ/फल्याक': 'wood',
    'ढुङ्गा/स्लेट': 'stone',
    'अन्य (खुलाउने)': 'other',
}
FACILITIES_ENUM = {
    'रेडियो सुविधा': 'radio',
    'टेलिभिजन': 'television',
    'कम्प्युटर/ल्यापटप': 'computer',
    'इन्टरनेट सुविधा': 'internet',
    'मोबाईल फोन': 'mobile_phone',
    'कार/जीप/भ्यान': 'car_jeep',
    'मोटरसाईकल/स्कुटर': 'motorcycle',
    'साईकल': 'bicycle',
    'रेफ्रिजेरेटर (फ्रिज)': 'refrigerator',
    'वासिङ मेसिन': 'washing_machine',
    'एयर कन्डिसनर': 'air_conditioner',
    'विद्युतीय पंखा': 'electrical_fan',
    'माइक्रोवेभ ओभन': 'microwave_oven',
    'राष्ट्रिय दैनिक पत्रिकाको पहुँच': 'daily_national_newspaper_access',
    'माथिका कुनै पनि नभएको ': 'none',
}
INCOME_SOURCES_ENUM = {
    'नोकरी/जागिर': 'job',
    'कृषि': 'agriculture',
    'व्यापार व्यवसाय': 'business',
    'उद्योग': 'industry',
    'वैदेशिक रोजगारी ': 'foreign_employment',
    'ज्याला मजदुरी': 'labour',
    'अन्य (खुलाउने)': 'other',
}
# Add other enums as needed...

def map_enum(value, enum_dict):
    if not value:
        return None
    return enum_dict.get(value.strip(), 'other')

def map_enum_list(values, enum_dict):
    if not values:
        return []
    if isinstance(values, str):
        values = [v.strip() for v in values.strip('{}').split(',') if v.strip()]
    return [enum_dict.get(v, 'other') for v in values]

# --- Extraction (updated to include building) ---
def extract_family_individual_building_data(source_conn):
    logger.info("Extracting family, individual, and building data for economic challenge scoring")
    family_query = """
        SELECT * FROM synthetic_survey_kerabari_family
        WHERE ward_no IS NOT NULL AND id IS NOT NULL;
    """
    individual_query = """
        SELECT * FROM synthetic_survey_kerabari_individual
        WHERE family_id IS NOT NULL;
    """
    building_query = """
        SELECT * FROM synthetic_survey_kerabari_building
        WHERE building_token IS NOT NULL;
    """
    families = execute_query(source_conn, family_query)
    individuals = execute_query(source_conn, individual_query)
    buildings = execute_query(source_conn, building_query)
    logger.info(f"Extracted {len(families)} families, {len(individuals)} individuals, {len(buildings)} buildings")
    return families, individuals, buildings

# --- Transformation (updated to use enums and building fallback) ---
def calculate_severity_score(fam, fam_inds, building):
    score = 0
    # Land ownership
    land_ownership = map_enum(fam.get('land_ownership') or building.get('land_ownership'), LAND_OWNERSHIP_ENUM)
    if land_ownership != 'private':
        score += WEIGHTS['no_land']
    # House base
    house_base = map_enum(fam.get('house_base') or building.get('base'), HOUSE_BASE_ENUM)
    if house_base in ['mud_joined', 'wood_pole', 'other']:
        score += WEIGHTS['poor_house_base']
    # Outer wall
    house_outer_wall = map_enum(fam.get('house_outer_wall') or building.get('outer_wall'), HOUSE_OUTER_WALL_ENUM)
    if house_outer_wall in ['mud_joined', 'unbaked_brick', 'tin', 'bamboo', 'wood', 'prefab', 'other']:
        score += WEIGHTS['poor_outer_wall']
    # Roof
    house_roof = map_enum(fam.get('house_roof') or building.get('roof'), HOUSE_ROOF_ENUM)
    if house_roof in ['tin', 'straw', 'wood', 'stone', 'other']:
        score += WEIGHTS['poor_roof']
    # Facilities
    facilities = map_enum_list(fam.get('facilities') or building.get('facilities'), FACILITIES_ENUM)
    if 'none' in facilities or len(facilities) == 0:
        score += WEIGHTS['no_facilities']
    elif len(facilities) < 3:
        score += WEIGHTS['few_facilities']
    # Income sources
    income_sources = map_enum_list(fam.get('income_sources'), INCOME_SOURCES_ENUM)
    if not income_sources or income_sources == ['']:
        score += WEIGHTS['no_income_source']
    elif all(src in ['labour', 'other'] for src in income_sources):
        score += WEIGHTS['only_labour_income']
    # Remittance
    if not fam.get('has_remittance') or fam.get('has_remittance') in ['false', 'False', False, '', None]:
        score += WEIGHTS['no_remittance']
    # Loan
    if fam.get('loaned_organizations') not in [None, '', '{}', []]:
        score += WEIGHTS['has_loan']
    # Bank account
    if fam.get('has_bank') in [None, '', '{}', []]:
        score += WEIGHTS['no_bank_account']
    # Health insurance
    if fam.get('has_insurance') not in ['yes', 'हो', 'छ']:
        score += WEIGHTS['no_health_insurance']
    # Cooking fuel, toilet, water, electricity
    if fam.get('toilet_type') in [None, '', 'अन्य']:
        score += WEIGHTS['lacks_toilet']
    if not fam.get('water_source') or fam.get('water_source') in [None, '', '{}', []]:
        score += WEIGHTS['lacks_clean_water']
    if fam.get('primary_energy_source') in [None, '', 'अन्य']:
        score += WEIGHTS['lacks_electricity']
    # Female/single/elderly/child headed
    head_gender = fam.get('head_gender', '').strip()
    if head_gender == 'महिला':
        score += WEIGHTS['female_headed']
    # Single parent
    if len([ind for ind in fam_inds if ind.get('family_role') in ['आमा', 'बुवा']]) == 1:
        score += WEIGHTS['single_parent']
    # Elderly only
    ages = [ind.get('age') for ind in fam_inds if ind.get('age') is not None]
    if ages and all(a is not None and int(a) >= 60 for a in ages):
        score += WEIGHTS['elderly_only']
    # Children only
    if ages and all(a is not None and int(a) < 18 for a in ages):
        score += WEIGHTS['children_only']
    # Marginalized caste
    marginalized_castes = ['दलित', 'जनजाति', 'मुस्लिम', 'थारु', 'मगर', 'गुरुङ', 'तमाङ', 'नेवार', 'राई', 'लिम्बु', 'अन्य (खुलाउने)']
    if any(ind.get('caste') in marginalized_castes for ind in fam_inds):
        score += WEIGHTS['marginalized_caste']
    # Education
    edu_levels = [ind.get('educational_level') for ind in fam_inds if ind.get('educational_level')]
    if edu_levels and all(lvl in ['अनौपचारिक शिक्षा ', 'थाहा नभएको ', ''] for lvl in edu_levels):
        score += WEIGHTS['illiterate']
    elif edu_levels and all(lvl in ['बालविकास केन्द्र / मंटेस्वोरी', 'नर्सरी/केजी ', 'कक्षा १ ', 'कक्षा २ ', 'कक्षा ३ ', 'कक्षा ४ ', 'कक्षा ५ '] for lvl in edu_levels):
        score += WEIGHTS['low_education']
    # Skills
    skills = [ind.get('primary_skill') for ind in fam_inds if ind.get('primary_skill')]
    if not skills or all(s in ['विशेष सीप / दक्षता नभएको', 'अन्य', ''] for s in skills):
        score += WEIGHTS['no_skills']
    # Disability/chronic disease
    if any(ind.get('is_disabled') == 'yes' for ind in fam_inds):
        score += WEIGHTS['has_disability']
    if any(ind.get('has_chronic_disease') == 'yes' for ind in fam_inds):
        score += WEIGHTS['has_chronic_disease']
    return score

def categorize_severity(score):
    for threshold, label in SEVERITY_THRESHOLDS:
        if score >= threshold:
            return label
    return 'Not Economically Challenged'

# --- Aggregation ---
def aggregate_ward_summary(families_with_scores):
    df = pd.DataFrame(families_with_scores)
    df['severely_challenged'] = (df['severity_category'] == 'Severely Challenged').astype(int)
    df['moderately_challenged'] = (df['severity_category'] == 'Moderately Challenged').astype(int)
    df['mildly_challenged'] = (df['severity_category'] == 'Mildly Challenged').astype(int)
    df['not_challenged'] = (df['severity_category'] == 'Not Economically Challenged').astype(int)
    summary = df.groupby('ward_no').agg(
        total_families=('family_id', 'count'),
        severely_challenged=('severely_challenged', 'sum'),
        moderately_challenged=('moderately_challenged', 'sum'),
        mildly_challenged=('mildly_challenged', 'sum'),
        not_challenged=('not_challenged', 'sum'),
    ).reset_index()
    return summary

# --- Load ---
def create_insert_data(row):
    return {
        'id': generate_uuid(),
        'ward_no': int(row['ward_no']),
        'total_families': int(row['total_families']),
        'severely_challenged': int(row['severely_challenged']),
        'moderately_challenged': int(row['moderately_challenged']),
        'mildly_challenged': int(row['mildly_challenged']),
        'not_challenged': int(row['not_challenged']),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp(),
    }

def generate_insert_statement(data):
    return f"""
    INSERT INTO {TARGET_TABLE} (id, ward_no, total_families, severely_challenged, moderately_challenged, mildly_challenged, not_challenged, updated_at, created_at)
    VALUES ('{data['id']}', {data['ward_no']}, {data['total_families']}, {data['severely_challenged']}, {data['moderately_challenged']}, {data['mildly_challenged']}, {data['not_challenged']}, '{data['updated_at']}', '{data['created_at']}');
    """

def generate_table_create_statement():
    return f"""
    CREATE TABLE IF NOT EXISTS {TARGET_TABLE} (
        id text PRIMARY KEY,
        ward_no integer,
        total_families integer,
        severely_challenged integer,
        moderately_challenged integer,
        mildly_challenged integer,
        not_challenged integer,
        updated_at timestamp,
        created_at timestamp
    );
    """

def generate_closing_statement():
    return "COMMIT;"

def load_ward_wise_economically_challenged(summary_df, target_conn, generate_sql=True):
    logger.info(f"Preparing to load data into {TARGET_TABLE}")
    if table_exists(target_conn, TARGET_TABLE) and table_has_data(target_conn, TARGET_TABLE):
        logger.info(f"Table {TARGET_TABLE} already exists and has data. Skipping insertion.")
        return False
    insert_data = []
    insert_statements = []
    for _, row in summary_df.iterrows():
        data = create_insert_data(row)
        insert_data.append(data)
        statement = generate_insert_statement(data)
        insert_statements.append(statement)
    if generate_sql:
        full_sql_script = []
        full_sql_script.append(generate_table_create_statement())
        full_sql_script.extend(insert_statements)
        full_sql_script.append(generate_closing_statement())
        sql_file_path = f"{TARGET_TABLE}.sql"
        save_sql_to_file(full_sql_script, sql_file_path)
    success = insert_data_to_db(target_conn, insert_statements)
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    return success

# --- Main ETL Process (update to use new extraction and scoring) ---
def process_ward_wise_economically_challenged_population(source_conn, target_conn, generate_sql=True):
    logger.info("Processing ward-wise economically challenged population data")
    try:
        families, individuals, buildings = extract_family_individual_building_data(source_conn)
        # Merge individuals and buildings to families
        families_with_scores = []
        for _, fam in families.iterrows():
            fam_id = fam['id']
            fam_inds = individuals[individuals['family_id'] == fam_id].to_dict('records')
            fam_dict = fam.to_dict()
            # Optionally, add head_gender from individuals
            head = next((ind for ind in fam_inds if ind.get('family_role') == 'head'), None)
            if head:
                fam_dict['head_gender'] = head.get('gender', '')
            # Find building by building_token
            building = buildings[buildings['building_token'] == fam.get('building_token')].to_dict('records')
            building = building[0] if building else {}
            score = calculate_severity_score(fam_dict, fam_inds, building)
            category = categorize_severity(score)
            families_with_scores.append({
                'family_id': fam_id,
                'ward_no': fam['ward_no'],
                'severity_score': score,
                'severity_category': category
            })
        summary_df = aggregate_ward_summary(families_with_scores)
        load_ward_wise_economically_challenged(summary_df, target_conn, generate_sql)
        logger.info("Completed processing ward-wise economically challenged population data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise economically challenged population data: {e}")
        return False
