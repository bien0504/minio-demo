#!/bin/bash
#  It indicates that the script should be executed by the Bash shell located at /bin/bash
set -e
# exit if any command returns a non-zero exit status, indicating an error.
if [ -e "/opt/airflow/requirements.txt" ]; then
  $(command python) pip install --upgrade pip
  $(command -v pip) install --user -r requirements.txt
fi
# checks if the file requirements exists. If it does, the commands within the then block will be executed.
if [ ! -f "/opt/airflow/airflow.db" ]; then
  airflow db init && \
  airflow users create \
    --username admin \
    --firstname admin \
    --lastname admin \
    --role Admin \
    --email admin@example.com \
    --password admin
fi
$(command -v airflow) db upgrade
exec airflow webserver
