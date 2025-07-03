import logging

from .ward_wise_drinking_water_source import process_ward_wise_drinking_water_source
from .ward_wise_solid_waste_management import process_ward_wise_solid_waste_management
from .ward_wise_water_purification import process_ward_wise_water_purification
from .ward_wise_toilet_type import process_ward_wise_toilet_type
from .ward_age_gender_wise_first_marriage_age import process_ward_age_gender_wise_first_marriage_age
from .ward_wise_old_male_female_and_single_woman import process_ward_wise_old_male_female_and_single_woman
from .ward_wise_disabled_population import process_ward_wise_disabled_population
from .ward_wise_disability_cause import process_ward_wise_disability_cause
# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def process_social_data(source_conn, target_conn, generate_sql=True):
    """Process all social domain data."""
    logger.info("Starting social domain data processing")
    
    process_ward_wise_drinking_water_source(source_conn, target_conn, generate_sql)
    process_ward_wise_solid_waste_management(source_conn, target_conn, generate_sql)
    process_ward_wise_water_purification(source_conn, target_conn, generate_sql)
    process_ward_wise_toilet_type(source_conn, target_conn, generate_sql)
    process_ward_age_gender_wise_first_marriage_age(source_conn, target_conn, generate_sql)
    process_ward_wise_old_male_female_and_single_woman(source_conn, target_conn, generate_sql)
    process_ward_wise_disabled_population(source_conn, target_conn, generate_sql)
    # Import and process social data modules
    # For example:
    # process_ward_wise_education_level(source_conn, target_conn, generate_sql)
    # process_ward_wise_gender_distribution(source_conn, target_conn, generate_sql)
    # etc.
    process_ward_wise_disability_cause(source_conn, target_conn, generate_sql)
    
    # Note: Uncomment and add actual processing functions as they are developed
    
    logger.info("Completed social domain data processing")
