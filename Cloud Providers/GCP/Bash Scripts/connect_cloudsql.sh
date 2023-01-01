#!/bin/bash

gcloud sql instances create z-mysql-1 \
    --database-version=MYSQL_5_7 \
    --tier=db-n1-standard-1 \
    --region=us-east1