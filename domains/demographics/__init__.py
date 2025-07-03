import logging
from .demographics_summary import process_demographics_summary
from .ward_wise_caste_population import process_caste_population
from .ward_wise_househead_gender import process_househead_gender
from .ward_wise_mother_tongue_population import process_mother_tongue_population
from .ward_wise_religion_population import process_religion_population
from .ward_age_wise_marital_status import process_marital_status
from .municipality_wise_religion_population import process_no_ward_religion_population
from .municipality_wise_mother_tongue_population import process_no_ward_mother_tongue_population
from .municipality_wise_caste_population import process_no_ward_caste_population
from .ward_wise_birth_certificate_population import process_birth_certificate_population 
from .ward_age_gender_wise_deceased_population import process_deceased_population
from .ward_wise_death_cause import process_death_cause
from .ward_wise_mother_tongue_population import process_mother_tongue_population
from .ward_age_wise_population import process_age_wise_population
from .ward_wise_mother_tongue_population import process_mother_tongue_population
from .ward_wise_demographic_summary import process_ward_wise_demographic_summary
from .ward_wise_time_series_population import process_ward_time_series_population
# from .municipality_wise_religion_population import process_no_ward_religion_population


# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def process_demographics_data(source_conn, target_conn, generate_sql=True):
    """Process all demographics domain data."""
    logger.info("Starting demographics data processing")
    # Process demographics data
    process_no_ward_religion_population(source_conn, target_conn, generate_sql)
    process_demographics_summary(source_conn, target_conn, generate_sql)
    # process_age_wise_population(source_conn, target_conn, generate_sql)
    # process_age_wise_population(source_conn, target_conn, generate_sql)
    # process_caste_population(source_conn, target_conn, generate_sql)
    # process_househead_gender(source_conn, target_conn, generate_sql)
    # process_mother_tongue_population(source_conn, target_conn, generate_sql)
    # process_religion_population(source_conn, target_conn, generate_sql)
    # Add more demographics data processing functions here as they are implemented
    # process_marital_status(source_conn, target_conn, generate_sql)
    # process_no_ward_religion_population(source_conn, target_conn, generate_sql)
    # process_no_ward_mother_tongue_population(source_conn, target_conn, generate_sql)
    # process_mother_tongue_population(source_conn, target_conn, generate_sql)
    # process_no_ward_caste_population(source_conn, target_conn, generate_sql)
    # process_birth_certificate_population(source_conn, target_conn, generate_sql)
    # process_deceased_population(source_conn, target_conn, generate_sql)
    # process_death_cause(source_conn, target_conn, generate_sql)
    # process_mother_tongue_population(source_conn, target_conn, generate_sql)
    # process_ward_wise_demographic_summary(source_conn, target_conn, generate_sql)
    # process_ward_time_series_population(source_conn, target_conn, generate_sql)
    # process_no_ward_caste_population(source_conn, target_conn, generate_sql)

    logger.info("Completed demographics data processing")
