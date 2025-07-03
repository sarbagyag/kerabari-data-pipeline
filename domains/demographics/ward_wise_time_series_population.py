try:
    import pandas as pd
except ImportError:
    raise ImportError("pandas is required for this script. Please install it with 'pip install pandas'.")
import logging
import os
from utils.database import execute_query, table_exists, table_has_data, insert_data_to_db, save_sql_to_file
from utils.transformers import generate_uuid, get_current_timestamp
from config import DEMOGRAPHICS_SQL_DIR

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

TARGET_TABLE = "acme_ward_time_series_population"

WARD_NAME_MAP = {
    1: "पाटीगाउँ(१-९)",
    2: "सिंहदेवी(१-९)",
    3: "लेटाङभोगटेनी (१) र केराबारी(४)",
    4: "याङशिला(१-४,६,७)",
    5: "याङशिला(५,८)",
    6: "केराबारी (७) र याङशिला(९)",
    7: "केराबारी(६,८)",
    8: "केराबारी(२,५)",
    9: "केराबारी(९)",
    10: "केराबारी(१,३)"
}

# 2078 Census Data (updated from provided table)
CENSUS_2078 = [
    {"ward_number": 1, "total_households": 476, "total_population": 1994, "male_population": 973, "female_population": 1021, "average_household_size": 4.19, "sex_ratio": 95.3},
    {"ward_number": 2, "total_households": 562, "total_population": 2192, "male_population": 1063, "female_population": 1129, "average_household_size": 3.9, "sex_ratio": 94.15},
    {"ward_number": 3, "total_households": 812, "total_population": 3390, "male_population": 1647, "female_population": 1743, "average_household_size": 4.17, "sex_ratio": 94.49},
    {"ward_number": 4, "total_households": 415, "total_population": 1682, "male_population": 838, "female_population": 844, "average_household_size": 4.05, "sex_ratio": 99.29},
    {"ward_number": 5, "total_households": 944, "total_population": 3892, "male_population": 1839, "female_population": 2053, "average_household_size": 4.12, "sex_ratio": 89.58},
    {"ward_number": 6, "total_households": 982, "total_population": 3991, "male_population": 1924, "female_population": 2067, "average_household_size": 4.06, "sex_ratio": 93.08},
    {"ward_number": 7, "total_households": 1034, "total_population": 4169, "male_population": 1967, "female_population": 2202, "average_household_size": 4.03, "sex_ratio": 89.33},
    {"ward_number": 8, "total_households": 1041, "total_population": 4088, "male_population": 1925, "female_population": 2163, "average_household_size": 3.93, "sex_ratio": 89.0},
    {"ward_number": 9, "total_households": 1401, "total_population": 5564, "male_population": 2576, "female_population": 2988, "average_household_size": 3.97, "sex_ratio": 86.21},
    {"ward_number": 10, "total_households": 906, "total_population": 3542, "male_population": 1663, "female_population": 1879, "average_household_size": 3.91, "sex_ratio": 88.5}
]

# Ward-wise areas in square kilometers (updated from provided JSON)
WARD_AREAS = {
    1: 21.83,
    2: 24.78,
    3: 29.73,
    4: 19.56,
    5: 34.32,
    6: 34.16,
    7: 36.29,
    8: 29.41,
    9: 47.64,
    10: 26.59
}

# Municipality-wide 2078 data (calculated from provided table)
MUNICIPALITY_2078 = {
    "total_households": 8573,
    "total_population": 34504,
    "male_population": 16415,
    "female_population": 18089,
    "average_household_size": 4.02,
    "sex_ratio": 90.75,
    "growth_rate": None,  # Will be calculated when 2081 data is available
    "population_density": 115.1,  # 34504 / 299.81
    "literacy_rate": None,  # Not provided in the data
    "male_literacy_rate": None,  # Not provided in the data
    "female_literacy_rate": None  # Not provided in the data
}

CENSUS_2078_FIELDS = [
    "ward_number", "total_households", "total_population", "male_population", "female_population", "average_household_size", "sex_ratio"
]

ALL_FIELDS = [
    "id", "ward_number", "ward_name", "year", "total_population", "male_population", "female_population", "other_population", "total_households", "average_household_size", "population_0_to_14", "population_15_to_59", "population_60_and_above", "literacy_rate", "male_literacy_rate", "female_literacy_rate", "growth_rate", "area_sq_km", "population_density", "sex_ratio", "updated_at", "created_at"
]

def create_insert_data(row):
    return {
        'id': generate_uuid(),
        'ward_number': int(row['ward_number']),
        'ward_name': WARD_NAME_MAP.get(int(row['ward_number']), None),
        'year': int(row['year']),
        'total_population': row.get('total_population'),
        'male_population': row.get('male_population'),
        'female_population': row.get('female_population'),
        'other_population': row.get('other_population'),
        'total_households': row.get('total_households'),
        'average_household_size': row.get('average_household_size'),
        'population_0_to_14': row.get('population_0_to_14'),
        'population_15_to_59': row.get('population_15_to_59'),
        'population_60_and_above': row.get('population_60_and_above'),
        'literacy_rate': row.get('literacy_rate'),
        'male_literacy_rate': row.get('male_literacy_rate'),
        'female_literacy_rate': row.get('female_literacy_rate'),
        'growth_rate': row.get('growth_rate'),
        'area_sq_km': row.get('area_sq_km'),
        'population_density': row.get('population_density'),
        'sex_ratio': row.get('sex_ratio'),
        'updated_at': get_current_timestamp(),
        'created_at': get_current_timestamp()
    }

def generate_insert_statement(data):
    def val(x):
        if pd.isna(x):
            return "NULL"
        if isinstance(x, str):
            return f"'{x}'"
        return str(x)
    return f"""
    INSERT INTO {TARGET_TABLE} (
        id, ward_number, ward_name, year, total_population, male_population, female_population, other_population,
        total_households, average_household_size, population_0_to_14, population_15_to_59, population_60_and_above,
        literacy_rate, male_literacy_rate, female_literacy_rate, growth_rate, area_sq_km, population_density, sex_ratio, updated_at, created_at
    ) VALUES (
        {val(data['id'])}, {val(data['ward_number'])}, {val(data['ward_name'])}, {val(data['year'])},
        {val(data['total_population'])}, {val(data['male_population'])}, {val(data['female_population'])}, {val(data['other_population'])},
        {val(data['total_households'])}, {val(data['average_household_size'])}, {val(data['population_0_to_14'])}, {val(data['population_15_to_59'])}, {val(data['population_60_and_above'])},
        {val(data['literacy_rate'])}, {val(data['male_literacy_rate'])}, {val(data['female_literacy_rate'])}, {val(data['growth_rate'])}, {val(data['area_sq_km'])}, {val(data['population_density'])}, {val(data['sex_ratio'])},
        {val(data['updated_at'])}, {val(data['created_at'])}
    );
    """

def generate_table_create_statement():
    return f"""
CREATE TABLE IF NOT EXISTS {TARGET_TABLE} (
    id                      varchar(36) not null primary key,
    ward_number             integer     not null,
    ward_name               text,
    year                    integer     not null,
    total_population        integer,
    male_population         integer,
    female_population       integer,
    other_population        integer,
    total_households        integer,
    average_household_size  numeric,
    population_0_to_14      integer,
    population_15_to_59     integer,
    population_60_and_above integer,
    literacy_rate           numeric,
    male_literacy_rate      numeric,
    female_literacy_rate    numeric,
    growth_rate             numeric,
    area_sq_km              numeric,
    population_density      numeric,
    sex_ratio               numeric,
    updated_at              timestamp default CURRENT_TIMESTAMP,
    created_at              timestamp default CURRENT_TIMESTAMP
);
ALTER TABLE {TARGET_TABLE} OWNER TO postgres;
"""

def generate_closing_statement():
    return """-- End of script\n"""

def clear_existing_data(target_conn):
    """Clear existing data from the target table to prevent duplicates"""
    try:
        cursor = target_conn.cursor()
        clear_query = f"DELETE FROM {TARGET_TABLE};"
        cursor.execute(clear_query)
        target_conn.commit()
        cursor.close()
        logger.info(f"Cleared existing data from {TARGET_TABLE}")
        return True
    except Exception as e:
        logger.error(f"Error clearing existing data from {TARGET_TABLE}: {e}")
        return False

def calculate_growth_rate(population_2078, population_2081):
    """Calculate annual growth rate between 2078 and 2081 (3 years)"""
    if population_2078 and population_2081 and population_2078 > 0:
        # Growth rate = ((P2081/P2078)^(1/3) - 1) * 100
        growth_rate = ((population_2081 / population_2078) ** (1/3) - 1) * 100
        return round(growth_rate, 2)
    return None

def extract_2081_data(source_conn):
    logger.info("Extracting 2081 data from synthetic tables")
    # Population and gender by ward
    pop_query = """
    SELECT 
        ward_no as ward_number,
        COUNT(*) as total_population,
        SUM(CASE WHEN gender = 'पुरुष' THEN 1 ELSE 0 END) as male_population,
        SUM(CASE WHEN gender = 'महिला' THEN 1 ELSE 0 END) as female_population,
        SUM(CASE WHEN gender = 'अन्य' THEN 1 ELSE 0 END) as other_population
    FROM synthetic_survey_kerabari_individual
    WHERE ward_no IS NOT NULL AND ward_no BETWEEN 1 AND 10
    GROUP BY ward_no
    ORDER BY ward_no;
    """
    pop_df = execute_query(source_conn, pop_query)

    # Households by ward
    hh_query = """
    SELECT ward_no as ward_number, COUNT(*) as total_households
    FROM synthetic_survey_kerabari_family
    WHERE ward_no IS NOT NULL AND ward_no BETWEEN 1 AND 10
    GROUP BY ward_no
    ORDER BY ward_no;
    """
    hh_df = execute_query(source_conn, hh_query)

    # Age groups
    age_query = """
    SELECT ward_no as ward_number,
        SUM(CASE WHEN age >= 0 AND age <= 14 THEN 1 ELSE 0 END) as population_0_to_14,
        SUM(CASE WHEN age >= 15 AND age <= 59 THEN 1 ELSE 0 END) as population_15_to_59,
        SUM(CASE WHEN age >= 60 THEN 1 ELSE 0 END) as population_60_and_above
    FROM synthetic_survey_kerabari_individual
    WHERE ward_no IS NOT NULL AND ward_no BETWEEN 1 AND 10 AND age IS NOT NULL
    GROUP BY ward_no
    ORDER BY ward_no;
    """
    age_df = execute_query(source_conn, age_query)

    # Literacy rates
    literacy_query = """
    SELECT ward_no as ward_number,
        COUNT(*) as total,
        SUM(CASE WHEN educational_level IS NOT NULL AND educational_level != 'निरक्षर' THEN 1 ELSE 0 END) as literate,
        SUM(CASE WHEN gender = 'पुरुष' AND educational_level IS NOT NULL AND educational_level != 'निरक्षर' THEN 1 ELSE 0 END) as male_literate,
        SUM(CASE WHEN gender = 'महिला' AND educational_level IS NOT NULL AND educational_level != 'निरक्षर' THEN 1 ELSE 0 END) as female_literate,
        SUM(CASE WHEN gender = 'पुरुष' THEN 1 ELSE 0 END) as male_total,
        SUM(CASE WHEN gender = 'महिला' THEN 1 ELSE 0 END) as female_total
    FROM synthetic_survey_kerabari_individual
    WHERE ward_no IS NOT NULL AND ward_no BETWEEN 1 AND 10 AND age >= 6
    GROUP BY ward_no
    ORDER BY ward_no;
    """
    literacy_df = execute_query(source_conn, literacy_query)

    # Merge all
    df = pop_df.merge(hh_df, on='ward_number', how='outer').merge(age_df, on='ward_number', how='outer').merge(literacy_df, on='ward_number', how='outer').fillna(0)
    # Calculate derived fields with rounding
    df['average_household_size'] = df.apply(lambda r: round((r['total_population'] / r['total_households']), 2) if r['total_households'] > 0 else None, axis=1)
    df['sex_ratio'] = df.apply(lambda r: round((r['male_population'] / r['female_population'] * 100), 2) if r['female_population'] > 0 else None, axis=1)
    df['literacy_rate'] = df.apply(lambda r: round((r['literate'] / r['total'] * 100), 2) if r['total'] > 0 else None, axis=1)
    df['male_literacy_rate'] = df.apply(lambda r: round((r['male_literate'] / r['male_total'] * 100), 2) if r['male_total'] > 0 else None, axis=1)
    df['female_literacy_rate'] = df.apply(lambda r: round((r['female_literate'] / r['female_total'] * 100), 2) if r['female_total'] > 0 else None, axis=1)
    
    # Add area data and calculate population density
    df['area_sq_km'] = df['ward_number'].apply(lambda x: WARD_AREAS.get(x))
    df['population_density'] = df.apply(lambda r: round((r['total_population'] / r['area_sq_km']), 2) if r['area_sq_km'] and r['area_sq_km'] > 0 else None, axis=1)
    
    # Leave growth_rate blank (None) - will be calculated later
    df['growth_rate'] = None
    df['year'] = 2081
    return df

def load_ward_time_series_population(data_rows, target_conn, generate_sql=True):
    logger.info(f"Preparing to load data into {TARGET_TABLE}")
    insert_data = []
    insert_statements = []
    for _, row in data_rows.iterrows() if isinstance(data_rows, pd.DataFrame) else enumerate(data_rows):
        data = create_insert_data(row)
        insert_data.append(data)
        statement = generate_insert_statement(data)
        insert_statements.append(statement)
    if generate_sql:
        full_sql_script = []
        full_sql_script.append(generate_table_create_statement())
        full_sql_script.append(f"TRUNCATE TABLE {TARGET_TABLE};")
        full_sql_script.extend(insert_statements)
        full_sql_script.append(generate_closing_statement())
        sql_file_path = os.path.join(DEMOGRAPHICS_SQL_DIR, f"{TARGET_TABLE}.sql")
        save_sql_to_file(full_sql_script, sql_file_path)
    success = insert_data_to_db(target_conn, insert_statements)
    if success:
        logger.info(f"Successfully loaded {len(insert_data)} records into {TARGET_TABLE}")
    return success

def process_ward_time_series_population(source_conn, target_conn, generate_sql=True):
    logger.info("Processing ward time series population data")
    try:
        # Skip if data already exists
        if table_has_data(target_conn, TARGET_TABLE):
            logger.info(f"Data already exists in {TARGET_TABLE}, skipping insertion.")
            return True
        # Clear existing data to prevent duplicates
        if not clear_existing_data(target_conn):
            logger.error("Failed to clear existing data, aborting process")
            return False
            
        # 2078 data
        data_2078 = []
        for row in CENSUS_2078:
            data = {f: row.get(f) for f in CENSUS_2078_FIELDS}
            data['year'] = 2078
            data['other_population'] = None
            data['population_0_to_14'] = None
            data['population_15_to_59'] = None
            data['population_60_and_above'] = None
            # Use municipality-wide literacy rates for 2078 (if available)
            data['literacy_rate'] = MUNICIPALITY_2078['literacy_rate']
            data['male_literacy_rate'] = MUNICIPALITY_2078['male_literacy_rate']
            data['female_literacy_rate'] = MUNICIPALITY_2078['female_literacy_rate']
            data['growth_rate'] = None  # Will be calculated after 2081 data
            data['area_sq_km'] = WARD_AREAS.get(row['ward_number'], None)
            area = WARD_AREAS.get(row['ward_number'])
            data['population_density'] = round((row['total_population'] / area), 2) if area and area > 0 else None
            data['ward_name'] = WARD_NAME_MAP.get(row['ward_number'], None)
            data_2078.append(data)
        
        # 2081 data
        df_2081 = extract_2081_data(source_conn)
        
        # Calculate growth rates for 2081 data
        for _, row in df_2081.iterrows():
            ward_num = row['ward_number']
            # Find corresponding 2078 data
            census_2078_data = next((item for item in CENSUS_2078 if item['ward_number'] == ward_num), None)
            if census_2078_data:
                growth_rate = calculate_growth_rate(
                    census_2078_data['total_population'], 
                    row['total_population']
                )
                df_2081.loc[df_2081['ward_number'] == ward_num, 'growth_rate'] = growth_rate
        
        # Combine data
        all_data = pd.DataFrame(data_2078 + df_2081.to_dict('records'))
        
        # Calculate municipality-wide growth rate
        total_pop_2078 = MUNICIPALITY_2078['total_population']
        total_pop_2081 = df_2081['total_population'].sum()
        municipality_growth_rate = calculate_growth_rate(total_pop_2078, total_pop_2081)
        
        # Update municipality-wide growth rate in 2078 data
        for data in data_2078:
            data['growth_rate'] = municipality_growth_rate
        
        # Load data
        load_ward_time_series_population(all_data, target_conn, generate_sql)
        logger.info("Completed processing ward time series population data")
        return True
    except Exception as e:
        logger.error(f"Error processing ward time series population data: {e}")
        return False
