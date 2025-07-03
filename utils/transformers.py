import uuid
from datetime import datetime
import logging
import pandas as pd
import numpy as np

# Set up logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Generic utility functions for data transformation
def generate_uuid():
    """Generate a random UUID string."""
    return str(uuid.uuid4())

def get_current_timestamp():
    """Get current timestamp formatted for database insertion."""
    return datetime.now().strftime('%Y-%m-%d %H:%M:%S')

def clean_dataframe_for_integer_conversion(df, columns_to_clean):
    """
    Clean dataframe by removing NaN and infinite values from specified columns.
    
    Args:
        df (pd.DataFrame): The dataframe to clean
        columns_to_clean (list): List of column names to clean
    
    Returns:
        pd.DataFrame: Cleaned dataframe
    """
    initial_count = len(df)
    
    # Remove rows with NaN values in specified columns
    df = df.dropna(subset=columns_to_clean)
    
    # Remove infinite values from specified columns
    for col in columns_to_clean:
        if col in df.columns:
            df = df[np.isfinite(df[col])]
    
    if len(df) < initial_count:
        logger.warning(f"Removed {initial_count - len(df)} rows with NaN or infinite values from columns: {columns_to_clean}")
    
    return df
