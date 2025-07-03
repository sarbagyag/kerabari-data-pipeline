import psycopg2
import pandas as pd
from datetime import datetime
import os
import logging

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

def get_connection(host, dbname, user, password, port):
    """Create and return a database connection."""
    try:
        conn = psycopg2.connect(
            host=host,
            database=dbname,
            user=user,
            password=password,
            port=port
        )
        logger.info(f"Successfully connected to {dbname} at {host}:{port}")
        return conn
    except Exception as e:
        logger.error(f"Error connecting to database: {e}")
        raise

def execute_query(conn, query, params=None):
    """Execute a query and return results as a DataFrame."""
    try:
        return pd.read_sql(query, conn, params=params)
    except Exception as e:
        logger.error(f"Error executing query: {e}")
        logger.error(f"Query: {query}")
        raise

def table_exists(conn, table_name):
    """Check if a table exists in the database."""
    try:
        cursor = conn.cursor()
        cursor.execute(f"""
            SELECT EXISTS (
                SELECT FROM information_schema.tables 
                WHERE table_name = %s
            );
        """, (table_name,))
        exists = cursor.fetchone()[0]
        cursor.close()
        return exists
    except Exception as e:
        logger.error(f"Error checking if table exists: {e}")
        raise

def table_has_data(conn, table_name):
    """Check if a table has any records."""
    try:
        cursor = conn.cursor()
        cursor.execute(f"SELECT EXISTS (SELECT 1 FROM {table_name} LIMIT 1);")
        has_data = cursor.fetchone()[0]
        cursor.close()
        return has_data
    except Exception as e:
        logger.error(f"Error checking if table has data: {e}")
        raise

def insert_data_to_db(connection, statements, batch_size=100):
    """Execute multiple SQL insert statements with batching."""
    cursor = connection.cursor()
    total = len(statements)
    
    try:
        logger.info(f"Starting to insert {total} records...")
        
        for i in range(0, total, batch_size):
            batch = statements[i:i+batch_size]
            for statement in batch:
                cursor.execute(statement)
            
            connection.commit()
            logger.info(f"Inserted batch {i//batch_size + 1} ({min(i+batch_size, total)}/{total} records)")
        
        logger.info("All data inserted successfully!")
        return True
    except Exception as e:
        connection.rollback()
        logger.error(f"Error inserting data: {e}")
        return False
    finally:
        cursor.close()

def save_sql_to_file(statements, file_path):
    """
    Generic function to save SQL statements to a file.
    
    Args:
        statements: List of SQL statements to write to the file
        file_path: Path where the SQL file should be saved
    """
    try:
        # Ensure directory exists
        os.makedirs(os.path.dirname(file_path), exist_ok=True)
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write("-- Generated SQL script\n")
            f.write("-- Date: " + datetime.now().strftime('%Y-%m-%d %H:%M:%S') + "\n\n")
            
            # Write all the SQL statements
            for statement in statements:
                f.write(statement + "\n")
                
        logger.info(f"SQL statements saved to {file_path}")
        return True
    except Exception as e:
        logger.error(f"Error saving SQL to file: {e}")
        return False
