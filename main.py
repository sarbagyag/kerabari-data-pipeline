import argparse
import logging
from utils.database import get_connection
from domains import process_all_data
from config import SOURCE_DB, TARGET_DB

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def generate_sql_files():
    """Generate SQL files without sending data to the target database."""
    logger.info("Starting SQL file generation process")
    
    try:
        # Connect to source database
        source_conn = get_connection(
            host=SOURCE_DB['host'],
            dbname=SOURCE_DB['dbname'],
            user=SOURCE_DB['user'],
            password=SOURCE_DB['password'],
            port=SOURCE_DB['port']
        )
        
        # Connect to target database (needed for schema inspection)
        target_conn = get_connection(
            host=TARGET_DB['host'],
            dbname=TARGET_DB['dbname'],
            user=TARGET_DB['user'],
            password=TARGET_DB['password'],
            port=TARGET_DB['port']
        )
        
        # Process all data with SQL generation enabled but no actual insertion
        process_all_data(source_conn, target_conn, generate_sql=True)
        
        # Close connections
        source_conn.close()
        target_conn.close()
        
        logger.info("SQL file generation completed successfully")
        return True
    except Exception as e:
        logger.error(f"Error in SQL file generation: {e}")
        return False

def generate_data():
    """Extract data from source and send to target database."""
    logger.info("Starting data extraction and loading process")
    
    try:
        # Connect to source database
        source_conn = get_connection(
            host=SOURCE_DB['host'],
            dbname=SOURCE_DB['dbname'],
            user=SOURCE_DB['user'],
            password=SOURCE_DB['password'],
            port=SOURCE_DB['port']
        )
        
        # Connect to target database
        target_conn = get_connection(
            host=TARGET_DB['host'],
            dbname=TARGET_DB['dbname'],
            user=TARGET_DB['user'],
            password=TARGET_DB['password'],
            port=TARGET_DB['port']
        )
        
        # Process all data
        process_all_data(source_conn, target_conn)
        
        # Close connections
        source_conn.close()
        target_conn.close()
        
        logger.info("Data extraction and loading completed successfully")
        return True
    except Exception as e:
        logger.error(f"Error in data extraction and loading: {e}")
        return False

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Data extraction pipeline for Digital Profile")
    parser.add_argument('--sql-only', action='store_true', help='Generate SQL files only without sending data to target DB')
    
    args = parser.parse_args()
    
    if args.sql_only:
        generate_sql_files()
    else:
        generate_data()
