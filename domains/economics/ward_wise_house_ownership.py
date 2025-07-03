import pandas as pd
import uuid
import psycopg2
from psycopg2.extras import execute_values
from datetime import datetime
from typing import Dict, List, Any

def extract_house_ownership_data(connection) -> pd.DataFrame:
    """
    Extract house ownership data from synthetic_survey_kerabari_family table.
    """
    query = """
    SELECT 
        ward_no, 
        house_ownership,
        COUNT(*) as household_count
    FROM 
        synthetic_survey_kerabari_family
    GROUP BY 
        ward_no, house_ownership
    ORDER BY 
        ward_no, house_ownership
    """
    
    # Execute the query with psycopg2 directly to avoid pandas warning
    with connection.cursor() as cursor:
        cursor.execute(query)
        columns = [desc[0] for desc in cursor.description]
        data = cursor.fetchall()
    
    # Convert to pandas DataFrame
    return pd.DataFrame(data, columns=columns)

def transform_house_ownership_data(df: pd.DataFrame) -> List[Dict[str, Any]]:
    """
    Transform the extracted data into the format required for acme_ward_wise_house_ownership table.
    """
    # Mapping for house ownership types
    ownership_map = {
        'निजी': 'PRIVATE',      # private
        'भाडामा': 'RENT',       # rent
        'संस्थागत': 'INSTITUTIONAL',  # institutional
        'अन्य (खुलाउने)': 'OTHER'    # other
        # Any other values will also be mapped to 'OTHER'
    }
    
    result = []
    
    for _, row in df.iterrows():
        ownership_type = ownership_map.get(row['house_ownership'], 'OTHER')
        
        result.append({
            'id': str(uuid.uuid4()),
            'ward_number': int(row['ward_no']),
            'ownership_type': ownership_type,
            'households': int(row['household_count']),
            'created_at': datetime.now(),
            'updated_at': datetime.now()
        })
    
    return result

def load_house_ownership_data(connection, data: List[Dict[str, Any]]):
    """
    Load the transformed data into acme_ward_wise_house_ownership table.
    """
    with connection.cursor() as cursor:
        # First clear existing data to avoid duplicates
        cursor.execute("TRUNCATE TABLE acme_ward_wise_house_ownership")
        
        # Insert new data
        query = """
        INSERT INTO acme_ward_wise_house_ownership (
            id, ward_number, ownership_type, households, created_at, updated_at
        ) VALUES %s
        """
        
        values = [
            (
                item['id'], 
                item['ward_number'], 
                item['ownership_type'], 
                item['households'],
                item['created_at'],
                item['updated_at']
            )
            for item in data
        ]
        
        execute_values(cursor, query, values)
    
    connection.commit()

def process_ward_wise_house_ownership(source_conn, target_conn, generate_sql=True):
    """
    Main function to process ward-wise house ownership data.
    
    Args:
        source_conn: Connection to the source database
        target_conn: Connection to the target database
        generate_sql: Whether to generate SQL instead of executing it directly
    """
    try:
        # Extract data from source connection
        df = extract_house_ownership_data(source_conn)
        
        # Transform data
        transformed_data = transform_house_ownership_data(df)
        
        # Load data to target connection
        load_house_ownership_data(target_conn, transformed_data)
        
        print(f"Successfully processed {len(transformed_data)} ward-wise house ownership records")
    
    except Exception as e:
        print(f"Error processing ward-wise house ownership data: {e}")
        if not generate_sql:
            target_conn.rollback()
        raise

if __name__ == "__main__":
    # For standalone testing only
    import os
    
    # Configuration from environment variables
    source_config = {
        "host": os.getenv("SOURCE_DB_HOST", "localhost"),
        "database": os.getenv("SOURCE_DB_NAME", "lungri_db"),
        "user": os.getenv("SOURCE_DB_USER", "postgres"),
        "password": os.getenv("SOURCE_DB_PASSWORD", "postgres")
    }
    
    target_config = {
        "host": os.getenv("TARGET_DB_HOST", "localhost"),
        "database": os.getenv("TARGET_DB_NAME", "lungri_db"),
        "user": os.getenv("TARGET_DB_USER", "postgres"),
        "password": os.getenv("TARGET_DB_PASSWORD", "postgres")
    }
    
    source_conn = psycopg2.connect(**source_config)
    target_conn = psycopg2.connect(**target_config)
    
    try:
        process_ward_wise_house_ownership(source_conn, target_conn, generate_sql=False)
    finally:
        source_conn.close()
        target_conn.close()