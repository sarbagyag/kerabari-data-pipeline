import logging
from .economics import process_economics_data
from .education import process_education_data
from .fertility import process_fertility_data
from .health import process_health_data
from .physical import process_physical_data
from .social import process_social_data
from .demographics import process_demographics_data
# Uncomment the following line when the demographics module is implemented
# from .demographics import process_demographics_data

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def process_all_data(source_conn, target_conn, generate_sql=True):
    """Process all domain data."""
    logger.info("Starting data processing for all domains")
    
    # Process each domain's data
    # process_economics_data(source_conn, target_conn, generate_sql)
    # process_education_data(source_conn, target_conn, generate_sql)
    # process_fertility_data(source_conn, target_conn, generate_sql)
    process_health_data(source_conn, target_conn, generate_sql)
    # process_demographics_data(source_conn, target_conn, generate_sql)
    # process_physical_data(source_conn, target_conn, generate_sql)
    # process_social_data(source_conn, target_conn, generate_sql)
    logger.info("Completed processing all domains data")
