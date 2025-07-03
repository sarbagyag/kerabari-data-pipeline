import os

# Source database configuration (from the existing notebooks)
#postgres://postgres:postgres@digprofile.com:55000/kerabari-survey

SOURCE_DB = {
    'host': 'digprofile.com',
    'dbname': 'kerabari-survey',
    'user': 'postgres',
    'password':'postgres',
    'port': '55000'
}

# Target database configuration (from the existing notebooks)
#postgres://postgres:h35ft4wJsuzV2M0WnAZLVQCTrJAQplBPuzhCSAprFFtdUlU7aBG8RPDZ4vgOVgvT@5.104.111.231:49866/postgres
TARGET_DB = {
    'host': '5.104.111.231',
    'dbname': 'postgres',
    'user': 'postgres',
    'password': 'h35ft4wJsuzV2M0WnAZLVQCTrJAQplBPuzhCSAprFFtdUlU7aBG8RPDZ4vgOVgvT',
    'port': '49866'
}


# Base output directory for SQL files
SQL_OUTPUT_DIR = os.path.join(os.path.dirname(__file__), 'export', 'sql')

# Domain-specific SQL output directories
ECONOMICS_SQL_DIR = os.path.join(SQL_OUTPUT_DIR, 'economics')
DEMOGRAPHICS_SQL_DIR = os.path.join(SQL_OUTPUT_DIR, 'demographics')
EDUCATION_SQL_DIR = os.path.join(SQL_OUTPUT_DIR, 'education')
FERTILITY_SQL_DIR = os.path.join(SQL_OUTPUT_DIR, 'fertility')
HEALTH_SQL_DIR = os.path.join(SQL_OUTPUT_DIR, 'health')
PHYSICAL_SQL_DIR = os.path.join(SQL_OUTPUT_DIR, 'physical')
SOCIAL_SQL_DIR = os.path.join(SQL_OUTPUT_DIR, 'social')

# Ensure output directories exist
os.makedirs(ECONOMICS_SQL_DIR, exist_ok=True)
os.makedirs(DEMOGRAPHICS_SQL_DIR, exist_ok=True)
os.makedirs(EDUCATION_SQL_DIR, exist_ok=True)
os.makedirs(FERTILITY_SQL_DIR, exist_ok=True)
os.makedirs(HEALTH_SQL_DIR, exist_ok=True)
os.makedirs(PHYSICAL_SQL_DIR, exist_ok=True)
os.makedirs(SOCIAL_SQL_DIR, exist_ok=True)
