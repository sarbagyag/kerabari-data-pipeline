import logging
from .ward_wise_educational_level import process_educational_level
from .ward_wise_literacy_status import process_literacy_status
from .ward_wise_major_subject import process_primary_subject
from .ward_wise_school_dropout import process_school_dropout

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def process_education_data(source_conn, target_conn, generate_sql=True):
    """Process all education domain data."""
    logger.info("Starting education data processing")
    
    # Process education data
    process_educational_level(source_conn, target_conn, generate_sql)
    process_literacy_status(source_conn, target_conn, generate_sql)
    process_primary_subject(source_conn, target_conn, generate_sql)
    process_school_dropout(source_conn, target_conn, generate_sql)
    
    # Add more education data processing functions here as they are implemented
    
    logger.info("Completed education data processing")
