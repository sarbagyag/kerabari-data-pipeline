import logging
from .ward_wise_child_bearers import process_child_bearers
from .ward_age_wise_first_child_age import process_first_child_age
from .ward_wise_delivery_place import process_recent_delivery_location

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def process_fertility_data(source_conn, target_conn, generate_sql=True):
    """Process all fertility domain data."""
    logger.info("Starting fertility data processing")
    
    # Process fertility data
    # process_child_bearers(source_conn, target_conn, generate_sql)
    process_recent_delivery_location(source_conn, target_conn, generate_sql)
    # process_first_child_age(source_conn, target_conn, generate_sql)

    # Add more fertility data processing functions here as they are implemented
    # For example:
    # process_birth_records(source_conn, target_conn, generate_sql)
    # process_family_planning(source_conn, target_conn, generate_sql)
    # process_maternal_health(source_conn, target_conn, generate_sql)
    
    logger.info("Completed fertility data processing")
