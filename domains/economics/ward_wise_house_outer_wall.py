import pandas as pd
import uuid
import psycopg2
from psycopg2.extras import execute_values
from datetime import datetime
from typing import Dict, List, Any

def extract_outer_wall_data(connection) -> pd.DataFrame:
    """
    Extract outer wall data from synthetic_survey_kerabari_building table.
    """
    query = """
    SELECT 
        ward_id, 
        outer_wall,
        COUNT(*) as household_count
    FROM 
        synthetic_survey_kerabari_building
    GROUP BY 
        ward_id, outer_wall
    ORDER BY 
        ward_id, outer_wall
    """
    
    # Execute the query with psycopg2 directly to avoid pandas warning
    with connection.cursor() as cursor:
        cursor.execute(query)
        columns = [desc[0] for desc in cursor.description]
        data = cursor.fetchall()
    
    # Convert to pandas DataFrame
    return pd.DataFrame(data, columns=columns)

def transform_outer_wall_data(df: pd.DataFrame) -> List[Dict[str, Any]]:
    """
    Transform the extracted data into the format required for acme_ward_wise_household_outer_wall table.
    """
    # Mapping for outer wall types
    wall_type_map = {
        'सिमेन्टको जोडाइ भएको इँटा/ढुङ्गा': 'CEMENT_JOINED',  # Cement joined
        'काँचो इँटा': 'UNBAKED_BRICK',                      # Unbaked brick
        'माटोको जोडाइ भएको इँटा/ढुङ्गा': 'MUD_JOINED',        # Mud joined
        'जस्ता/टिन/च्यादर': 'TIN',                         # Tin
        'बाँसजन्य सामग्री': 'BAMBOO',                       # Bamboo
        'काठ/फल्याक': 'WOOD',                              # Wood
        'प्रि फ्याब': 'PREFAB',                             # Prefab
        'अन्य (खुलाउने)': 'OTHER'                           # Other
        # Any other values will also be mapped to 'OTHER'
    }
    
    result = []
    
    for _, row in df.iterrows():
        wall_type = wall_type_map.get(row['outer_wall'], 'OTHER')
        
        result.append({
            'id': str(uuid.uuid4()),
            'ward_number': int(row['ward_id']),
            'wall_type': wall_type,
            'households': int(row['household_count']),
            'created_at': datetime.now(),
            'updated_at': datetime.now()
        })
    
    return result

def load_outer_wall_data(connection, data: List[Dict[str, Any]], generate_sql=False):
    """
    Load the transformed data into acme_ward_wise_household_outer_wall table.
    """
    if generate_sql:
        # Generate SQL statements instead of executing
        sql_statements = []
        
        # First clear existing data
        sql_statements.append("TRUNCATE TABLE acme_ward_wise_household_outer_wall;")
        
        # Insert statements
        for item in data:
            sql = f"""
            INSERT INTO acme_ward_wise_household_outer_wall (
                id, ward_number, wall_type, households, created_at, updated_at
            ) VALUES (
                '{item['id']}',
                {item['ward_number']},
                '{item['wall_type']}',
                {item['households']},
                '{item['created_at'].isoformat()}',
                '{item['updated_at'].isoformat()}'
            );
            """
            sql_statements.append(sql)
        
        return sql_statements
    else:
        # Execute directly
        with connection.cursor() as cursor:
            # First clear existing data to avoid duplicates
            cursor.execute("TRUNCATE TABLE acme_ward_wise_household_outer_wall")
            
            # Insert new data
            query = """
            INSERT INTO acme_ward_wise_household_outer_wall (
                id, ward_number, wall_type, households, created_at, updated_at
            ) VALUES %s
            """
            
            values = [
                (
                    item['id'], 
                    item['ward_number'], 
                    item['wall_type'], 
                    item['households'],
                    item['created_at'],
                    item['updated_at']
                )
                for item in data
            ]
            
            execute_values(cursor, query, values)
        
        connection.commit()
        return None

def process_ward_wise_house_outer_wall(source_conn, target_conn, generate_sql=False):
    """
    Main function to process ward-wise house outer wall data.
    
    Args:
        source_conn: Connection to the source database
        target_conn: Connection to the target database
        generate_sql: Whether to generate SQL instead of executing it directly
    """
    try:
        # Extract data from source connection
        df = extract_outer_wall_data(source_conn)
        
        # Transform data
        transformed_data = transform_outer_wall_data(df)
        
        # Load data to target connection or generate SQL
        sql_statements = load_outer_wall_data(target_conn, transformed_data, generate_sql)
        
        if generate_sql:
            return sql_statements
        else:
            print(f"Successfully processed {len(transformed_data)} ward-wise house outer wall records")
            return None
    
    except Exception as e:
        print(f"Error processing ward-wise house outer wall data: {e}")
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
        process_ward_wise_house_outer_wall(source_conn, target_conn, generate_sql=False)
    finally:
        source_conn.close()
        target_conn.close()