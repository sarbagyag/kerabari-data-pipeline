import logging
from .ward_wise_household_income_sources import process_income_sources
from .ward_wise_trained_population import process_trained_population
from .ward_wise_major_skills import process_major_skills
from .ward_wise_major_occupation import process_major_occupation
from .ward_wise_households_on_loan import process_households_on_loan
from .ward_wise_households_loan_use import process_households_loan_use
from .ward_wise_household_land_possessions import process_household_land_possessions
from .ward_wise_economically_active_population import process_economically_active_population
from .ward_wise_remittance_expenses import process_remittance_expenses
from .ward_wise_households_in_agriculture import process_agricultural_households
from .ward_wise_sent_remittance import process_sent_remittance
from .ward_wise_irrigated_area import process_ward_wise_irrigated_area
from .ward_wise_land_ownership import process_land_ownership
from .municipality_wide_foreign_employment_countries import process_municipality_wise_foreign_employment_countries
from .municipality_wide_irrigation_source import process_municipality_wide_irrigation_source
from .ward_wise_house_ownership import process_ward_wise_house_ownership
from .ward_wise_house_outer_wall import process_ward_wise_house_outer_wall
from .ward_wise_foreign_employment_countries import process_ward_wise_foreign_employment_countries
from .ward_wise_female_properties import process_female_properties
from .municipality_wise_food_crops import process_municipality_wise_food_crops
from .municipality_wise_pulse_crops import process_municipality_wise_pulse_crops
from .municipality_wise_oil_seeds import process_municipality_wise_oil_seeds
from .municipality_wise_fruits import process_municipality_wise_fruits
from .municipality_wise_spice_crops import process_municipality_wise_spice_crops
from .municipality_wise_vegetables import process_municipality_wise_vegetables
from .ward_wise_economically_challenged_population import process_ward_wise_economically_challenged_population

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def process_economics_data(source_conn, target_conn, generate_sql=True):
    # process_ward_wise_foreign_employment_countries(source_conn, target_conn, generate_sql)
    """Process all economics domain data."""
    logger.info("Starting economics data processing")
    # process_ward_wise_house_outer_wall(source_conn, target_conn, generate_sql)
    # Process household income sources
    # process_income_sources(source_conn, target_conn, generate_sql)
    # process_trained_population(source_conn, target_conn, generate_sql)  
    # process_major_skills(source_conn, target_conn, generate_sql)
    # process_major_occupation(source_conn, target_conn, generate_sql)
    # process_households_on_loan(source_conn, target_conn, generate_sql)
    # process_households_loan_use(source_conn, target_conn, generate_sql)
    # process_household_land_possessions(source_conn, target_conn, generate_sql)
    # process_economically_active_population(source_conn, target_conn, generate_sql)
    # process_remittance_expenses(source_conn, target_conn, generate_sql)
    process_agricultural_households(source_conn, target_conn, generate_sql)
    # process_sent_remittance(source_conn, target_conn, generate_sql)
    # process_ward_wise_irrigated_area(source_conn, target_conn, generate_sql)
    # process_land_ownership(source_conn, target_conn, generate_sql)
    # process_municipality_wide_irrigation_source(source_conn, target_conn, generate_sql)
    # process_ward_wise_house_ownership(source_conn, target_conn, generate_sql)
    # process_ward_wise_foreign_employment_countries(source_conn, target_conn, generate_sql)
    # process_municipality_wise_foreign_employment_countries(source_conn, target_conn, generate_sql)
    # process_female_properties(source_conn, target_conn, generate_sql)
    # process_agricultural_households(source_conn, target_conn, generate_sql)
    # process_municipality_wise_food_crops(source_conn, target_conn, generate_sql)
    # process_municipality_wise_pulse_crops(source_conn, target_conn, generate_sql)
    # process_municipality_wise_oil_seeds(source_conn, target_conn, generate_sql)
    # process_municipality_wise_fruits(source_conn, target_conn, generate_sql)
    # process_municipality_wise_spice_crops(source_conn, target_conn, generate_sql)
    # process_municipality_wise_vegetables(source_conn, target_conn, generate_sql)
    # process_ward_wise_economically_challenged_population(source_conn, target_conn, generate_sql)

    logger.info("Completed economics data processing")

