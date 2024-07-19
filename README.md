# ELT_pro

In this ELT project, we use Zomato Restaurant data from <a href="https://www.kaggle.com/datasets/anas123siddiqui/zomato-database?select=orders.csv" target="_blank">Kaggle</a>. It is an Indian multinational restaurant aggregator and food delivery company.

## Objectives
<ul>
    <li>Extract the data from the CSV files.</li>
    <li>Loads this data into Snowflake data warehouse.</li>
    <li>Transforms loaded data using dbt applying Kimbal Dimensional Modeling</li>
    <li>Build a Tableau report to visualize data</li>
</ul>

## Tools
<ul>
    <li>Python for extracting the data and loading it to BigQuery.</li>
    <li>Airflow for orchestration.</li>
    <li>BigQuery for data warehouse.</li>
    <li>dbt for transformation and data modeling.</li>
    <li>Tableau for data visualization.</li>
</ul>

## Architecture
![Untitled](https://github.com/user-attachments/assets/4cedc70d-0c5f-457e-befd-c955c73b8025)

## dbt DAG
![Screenshot from 2024-07-20 00-58-33](https://github.com/user-attachments/assets/43830fdf-f6ca-424a-b0c1-23e5f79588ad)



Resources:
<a href="https://github.com/kayazay/zomato-restaurant-analytics/tree/main" target="_blank">link</a>
