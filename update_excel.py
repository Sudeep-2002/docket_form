import pandas as pd
from sqlalchemy import create_engine

# Database connection settings
db_user = "root"
db_password = ""
db_host = "localhost"
db_name = "dockets"

# Excel file path
excel_file_path = 'export.xlsx'

# Connect to the database
engine = create_engine(f'mysql+pymysql://{db_user}:{db_password}@{db_host}/{db_name}')

# Fetch new data from the database into a pandas DataFrame
new_data_query = 'SELECT * FROM dockets'
new_data_df = pd.read_sql(new_data_query, engine)

# Load existing Excel file into a DataFrame
try:
    existing_data_df = pd.read_excel(excel_file_path)
except FileNotFoundError:
    # Handle file not found error (create an empty DataFrame)
    existing_data_df = pd.DataFrame()

# Merge new data with existing data, filling NaN (blank) values
merged_data_df = existing_data_df.combine_first(new_data_df)

# Save the updated DataFrame back to the Excel file
merged_data_df.to_excel(excel_file_path, index=False, engine='openpyxl')