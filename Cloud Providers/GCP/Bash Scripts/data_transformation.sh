#! /bin/bash

#data transformation pipeline using dataprep

# Initializes the Configuration
gcloud init < a

ID=$(gcloud info --format='value(config.project)')

# Create Cloud Storage Bucket
gsutil mb gs://$ID

# Create BigQuery Dataset
bq mk bookings

# Create BigQuery Table
bq load \
    --autodetect \
    --source_format=CSV \
    $ID:bookings.evenue_reporting \
    ./revenue_reporting.csv

# Run Cloud Dataprep jobs to BigQuery
if  gcloud dataflow jobs run datacloud \
      --gcs-location gs://dataflow-templates-us-central1/latest/Word_Count \
      --staging-location gs://$ID/temp \
      --parameters inputFile=gs://dataflow-samples/shakespeare/kinglear.txt,output=gs://$ID/counts
then
  printf "\n\e[1;96m%s\n\n\e[m" 'Please Wait around 2-3 minutes for job Completion'
  sleep 5

  printf "\n\e[1;92m%s\n\n\e[m" 'Script Completed'
fi
