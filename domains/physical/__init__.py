import logging
from .ward_wise_time_to_public_transport import process_time_to_public_transport
from .ward_wise_time_to_market_center import process_time_to_market_center
from .ward_wise_cooking_fuel import process_cooking_fuel
from .ward_wise_electricity_source import process_electricity_source
from .ward_wise_facilities import process_facilities
from .ward_wise_house_passed import process_ward_wise_house_passed
from .ward_wise_household_base import process_ward_wise_household_base
from .ward_wise_household_floor import process_ward_wise_household_floor
from .ward_wise_household_roof import process_ward_wise_household_roof
from .ward_wise_road_status import process_ward_wise_road_status
from .ward_wise_time_to_financial_institution import process_ward_wise_time_to_financial_org
from .ward_wise_time_to_health_organization import process_ward_wise_time_to_health_org
from .ward_wise_house_outer_wall import process_ward_wise_house_outer_wall


# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def process_physical_data(source_conn, target_conn, generate_sql=True):
    """Process all physical infrastructure domain data."""
    logger.info("Starting physical infrastructure data processing")
    
    # Process physical data
    # process_ward_wise_house_outer_wall(source_conn, target_conn, generate_sql)
    process_time_to_public_transport(source_conn, target_conn, generate_sql)
    process_time_to_market_center(source_conn, target_conn, generate_sql)
    process_ward_wise_time_to_health_org(source_conn, target_conn, generate_sql)
    # process_cooking_fuel(source_conn, target_conn, generate_sql)
    # process_electricity_source(source_conn, target_conn, generate_sql)
    # process_facilities(source_conn, target_conn, generate_sql)
    # process_ward_wise_house_passed(source_conn, target_conn, generate_sql)
    # process_ward_wise_household_base(source_conn, target_conn, generate_sql)
    # process_ward_wise_household_floor(source_conn, target_conn, generate_sql)
    # process_ward_wise_household_roof(source_conn, target_conn, generate_sql)
    # process_ward_wise_road_status(source_conn, target_conn, generate_sql)
    # process_ward_wise_time_to_financial_org(source_conn, target_conn, generate_sql)
    # process_ward_wise_time_to_health_org(source_conn, target_conn, generate_sql)
    # process_facilities(source_conn, target_conn, generate_sql)
    
    logger.info("Completed physical infrastructure data processing")
