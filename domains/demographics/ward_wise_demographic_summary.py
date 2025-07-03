try:
    import pandas as pd
except ImportError:
    raise ImportError("pandas is required for this script. Please install it with 'pip install pandas'.")
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

TARGET_TABLE = "acme_ward_wise_demographic_summary"

WARD_NAME_MAP = {
    1: "गोवरडिहा(१,२,३)",
    2: "गोवरडिहा(४-६)",
    3: "गोवरडिहा(७,८,९)",
    4: "गँगापरस्पुर(१,२,३,५)",
    5: "गँगापरस्पुर(४,६,७,८,९)",
    6: "गढवा(१,२,३,४,५)",
    7: "गढवा(६,७,८,९)",
    8: "कोइलाबास(१ देखि ९)"
}

def map_gender(nepali_gender):
    mapping = {
        'पुरुष': 'MALE',
        'महिला': 'FEMALE',
        'अन्य': 'OTHER'
    }
    clean_gender = nepali_gender.strip() if isinstance(nepali_gender, str) else nepali_gender
    return mapping.get(clean_gender, 'OTHER')

def create_insert_data(row):
    return {
        'id': generate_uuid(),
        'ward_number': int(row['ward_no']),
        'ward_name': WARD_NAME_MAP.get(int(row['ward_no']), None),
        'total_population': int(row['total_population']),
        'population_male': int(row['population_male']),
        'population_female': int(row['population_female']),
        'population_other': int(row['population_other']),
        'total_households': int(row['total_households']),
        'average_household_size': float(row['average_household_size']),
        'sex_ratio': float(row['sex_ratio']),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    ward_name_value = f"'{data['ward_name']}'" if data['ward_name'] else "NULL"
    return f"""
    INSERT INTO {TARGET_TABLE} (
        id, ward_number, ward_name, total_population, population_male, population_female, population_other,
        total_households, average_household_size, sex_ratio, updated_at, created_at
    ) VALUES (
        '{data['id']}',
        {data['ward_number']},
        {ward_name_value},
        {data['total_population']},
        {data['population_male']},
        {data['population_female']},
        {data['population_other']},
        {data['total_households']},
        {data['average_household_size']},
        {data['sex_ratio']},
        '{data['updated_at']}',
        '{data['created_at']}'
    );
    """

def generate_table_create_statement():
    return f"""
DROP TABLE IF EXISTS public.{TARGET_TABLE};
CREATE TABLE public.{TARGET_TABLE} (
    id                     varchar(36) PRIMARY KEY,
    ward_number            int          NOT NULL,
    ward_name              text,
    total_population       int,
    population_male        int,
    population_female      int,
    population_other       int,
    total_households       int,
    average_household_size numeric,
    sex_ratio              numeric,
    updated_at             timestamp    DEFAULT now(),
    created_at             timestamp    DEFAULT now()
);
ALTER TABLE public.{TARGET_TABLE}
    OWNER TO postgres;
"""

def generate_closing_statement():
    return """-- End of script\n"""

def extract_ward_wise_demographic_data(source_conn):
    logger.info("Extracting ward-wise demographic data from synthetic tables")
    # Population and gender by ward
    pop_query = """
    SELECT 
        ward_no,
        COUNT(*) as total_population,
        SUM(CASE WHEN gender = 'पुरुष' THEN 1 ELSE 0 END) as population_male,
        SUM(CASE WHEN gender = 'महिला' THEN 1 ELSE 0 END) as population_female,
        SUM(CASE WHEN gender = 'अन्य' THEN 1 ELSE 0 END) as population_other
    FROM synthetic_survey_kerabari_individual
    WHERE ward_no IS NOT NULL
    GROUP BY ward_no
    ORDER BY ward_no;
    """
    pop_df = execute_query(source_conn, pop_query)

    # Households by ward
    hh_query = """
    SELECT ward_no, COUNT(*) as total_households
    FROM synthetic_survey_kerabari_family
    WHERE ward_no IS NOT NULL
    GROUP BY ward_no
    ORDER BY ward_no;
    """
    hh_df = execute_query(source_conn, hh_query)

    # Merge
    df = pd.merge(pop_df, hh_df, on='ward_no', how='outer').fillna(0)
    # Calculate average household size and sex ratio
    df['average_household_size'] = df.apply(lambda r: (r['total_population'] / r['total_households']) if r['total_households'] > 0 else 0, axis=1)
    df['sex_ratio'] = df.apply(lambda r: (r['population_male'] / r['population_female'] * 100) if r['population_female'] > 0 else 0, axis=1)
    return df

def load_ward_wise_demographic_data(df, target_conn, generate_sql=True):
    logger.info(f"Preparing to load data into {TARGET_TABLE}")
    insert_data = []
    insert_statements = []
    for _, row in df.iterrows():
        data = create_insert_data(row)
        insert_data.append(data)
        statement = generate_insert_statement(data)
        insert_statements.append(statement)
    if generate_sql:
        full_sql_script = []
        full_sql_script.append(generate_table_create_statement())
        full_sql_script.extend(insert_statements)
        full_sql_script.append(generate_closing_statement())
        sql_file_path = os.path.join(DEMOGRAPHICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        save_sql_to_file(full_sql_script, sql_file_path)
    success = insert_data_to_db(target_conn, insert_statements)
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    return success

def process_ward_wise_demographic_summary(source_conn, target_conn, generate_sql=True):
    logger.info("Processing ward-wise demographic summary data")
    try:
        df = extract_ward_wise_demographic_data(source_conn)
        load_ward_wise_demographic_data(df, target_conn, generate_sql)
        logger.info("Completed processing ward-wise demographic summary data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward-wise demographic summary data: {e}")
        return False
