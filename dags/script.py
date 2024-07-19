import pandas as pd


def extract_load_to_bq():
        """
        Extracts data from CSV files and loads them into corresponding BigQuery tables.

        This function reads multiple CSV files specified by `file_paths`, and uploads them 
        to BigQuery tables specified by `table_names`. It assumes that each CSV file has 
        a corresponding destination table in BigQuery.

        Parameters:
        ----------
        No parameters are taken directly by the function. Instead, it uses predefined 
        lists `file_paths`, `table_names`, and `project_id` within the function body.

        file_paths : list
            List of file paths to CSV files that contain the data to be uploaded.

        table_names : list
            List of destination tables in BigQuery where the data from `file_paths` 
            will be uploaded.

        project_id : str
            Google Cloud project ID where BigQuery tables reside and where the data 
            will be uploaded.

        Raises:
        ------
        Exception
            If there is any error during reading CSV files or uploading data to BigQuery, 
            the function catches the exception and prints an error message.

        Returns:
        -------
        None
            This function does not return any value. It uploads data directly to BigQuery 
            tables specified by `table_names`.

        Notes:
        ------
        - Ensure that the Google Cloud SDK is installed and authenticated with appropriate 
        permissions to write to BigQuery tables.
        - Modify `file_paths`, `table_names`, and `project_id` lists directly within the 
        function body as needed to suit your specific use case.
        """
     
        # Define the list of file paths
        file_paths = [
        r'G:\syllabus\projects\ELT-for-Zomato-data\countries.csv',
        r'G:\syllabus\projects\ELT-for-Zomato-data\menu.csv',
        r'G:\syllabus\projects\ELT-for-Zomato-data\food.csv',
        r'G:\syllabus\projects\ELT-for-Zomato-data\orders.csv',
        r'G:\syllabus\projects\ELT-for-Zomato-data\restaurant.csv',
        r'G:\syllabus\projects\ELT-for-Zomato-data\users.csv'
        ]
    
        # Define corresponding destination table names
        table_names = [
        'raw_data.countries',
        'raw_data.menu',
        'raw_data.food',
        'raw_data.orders',
        'raw_data.restaurant',
        'raw_data.users'
        ]
    

        # Google Cloud project ID
        project_id = 'teak-clarity-423211-h9'
    
        # Iterate through file paths and table names
        for file_path, table_name in zip(file_paths, table_names):
            try:
                # Read CSV file into DataFrame
                df = pd.read_csv(file_path)
                
                # Upload DataFrame to BigQuery
                df.to_gbq(destination_table=table_name, project_id=project_id, if_exists='replace')
                
                print(f"Uploaded {table_name} to BigQuery successfully.")
            
            except Exception as e:
                print(f"Error uploading {table_name} to BigQuery: {str(e)}")



if __name__=="__main__":
    extract_load_to_bq()