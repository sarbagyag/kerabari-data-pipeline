import logging
from .ward_wise_chronic_disease import process_chronic_disease
from .ward_wise_health_insured_households import process_health_insured_households 
from .immunization_indicators import process_immunization_indicators
# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def process_health_data(source_conn, target_conn, generate_sql=True):
    """Process all health domain data."""
    logger.info("Starting health data processing")
    
    # Process health data
    # process_chronic_disease(source_conn, target_conn, generate_sql)
    process_health_insured_households(source_conn, target_conn, generate_sql)
    # process_immunization_indicators(target_conn, generate_sql)
    
    # Uncomment these as they are implemented:
    # process_ward_wise_disability_status(source_conn, target_conn, generate_sql)
    # process_ward_wise_health_facilities(source_conn, target_conn, generate_sql)
    # process_ward_wise_health_insurance(source_conn, target_conn, generate_sql)
    
    logger.info("Completed health data processing")
