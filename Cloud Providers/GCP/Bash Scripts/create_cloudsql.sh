#!/bin/bash

# Create a Cloud SQL (MySQL) instance in GCP
gcloud sql instances create z-mysql-1 \
    --database-version=MYSQL_5_7 \
    --tier=db-n1-standard-1 \
    --region=eu-west2