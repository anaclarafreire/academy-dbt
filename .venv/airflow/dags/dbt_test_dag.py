from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2025, 2, 22),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    'dbt_test',
    default_args=default_args,
    description='Executa o dbt test',
    schedule_interval='0 10 * * *',  # Roda todo dia às 10h
    catchup=False,
) as dag:

    dbt_test = BashOperator(
        task_id='run_dbt_tests',
        bash_command='dbt test --profiles-dir C:\Users\ACER NITRO\Documents\GitHub\academy-dbt',
    )
