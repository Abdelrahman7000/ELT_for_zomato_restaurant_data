from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'Abdelrahman',
    'retries': 10,
    'retry_delay': timedelta(minutes=2),
    'email_on_failure': False
}
# This will run every morning at 9
dag= DAG(
    dag_id='my_dag',
    default_args=default_args,
    start_date=datetime(2024,7,17),
    schedule_interval='0 9 * * *' 
) 


    
Extract_and_Load = BashOperator(
    task_id='Extract & Load',
    bash_command='python ELT-for-Zomato-data/script.py',
    dag=dag
)
    
    
Extract_and_Load    