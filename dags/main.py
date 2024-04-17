import logging
from datetime import datetime
import os
import csv
import psycopg2
from airflow import DAG
from airflow.operators.python import PythonOperator
from minio import Minio

default_args = {
    'owner': 'airscholar',
    'start_date': datetime(2024, 4, 17, 0, 00),
}

def get_data():
    conn = psycopg2.connect(
        dbname="airflow",
        user="airflow",
        password="airflow",
        host="localhost",
        port="5432"
    )
    if conn is not None:
        print("database tồn tại và đã được khởi tạo thành công")
    else:
        print("db  không tồn tại hoặc không được khởi tạo")
    cur = conn.cursor()
    sql_query = """
    SELECT *
    FROM product
    WHERE product_id IN (
        SELECT
            product_id
        FROM
            orderdetail
        WHERE
            order_id IN(
            SELECT order_id FROM orders
            WHERE
            EXTRACT(YEAR FROM order_date) = EXTRACT(YEAR FROM CURRENT_DATE) AND
            EXTRACT(MONTH FROM order_date) = EXTRACT(MONTH FROM CURRENT_DATE)
            )
            GROUP BY
            product_id
        ORDER BY
            SUM(quantity) DESC
        LIMIT 5
    );
    """
    cur.execute(sql_query)
    print("truy van thanh cong")
    rows = cur.fetchall()
    cur.close()
    conn.close()
    csv_filename = "reportngay.csv"
    current_date = datetime.now().strftime("%Y-%m-%d")
    csv_filename = f"{os.path.splitext(csv_filename)[0]}_{current_date}.csv"
    with open(csv_filename, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerows(rows)
    print("tao file thanh cong")
    # mo ket noi minio:
    minio_client = Minio('localhost:9000',
                         access_key='fCyjskzfbHe8pFEEkqYk',
                         secret_key='KImXpuXLwBKBQQ2TCvDRT62foppcFug8ux5M6RJ1',
                         secure=False)
    if minio_client is not None:
        print("Minio client tồn tại và đã được khởi tạo thành công")
    else:
        print("Minio client không tồn tại hoặc không được khởi tạo")
    bucket_name = 'mybucket'
    object_name = csv_filename
    minio_client.fput_object(bucket_name, object_name, csv_filename)


def stream_data():
    try:
        get_data()
    except Exception as e:
        logging.error(f'An error occured: {e}')

with DAG('abc',
         default_args=default_args,
         schedule_interval='@daily',
         catchup=False) as dag:
    streaming_task = PythonOperator(
        task_id='reportdaily',
        python_callable=stream_data
    )
