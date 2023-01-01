#! /bin/bash

#This script autosclaes an instance group with metrics from cloud monitoring
# Initializes the Configuration
gcloud init < a
ID=$(gcloud info --format='value(config.project)')

# Create a GCS bucket
if (gsutil mb gs://$ID
    gsutil cp -r gs://spls/gsp087/* gs://$ID)
then
  printf "\n\e[1;96m%s\n\n\e[m" 'Bucket Created'
  sleep 2.5

  # Create an Instance Template
  if (gcloud compute instance-templates create autoscaling-instance01 \
         --metadata=startup-script-url=gs://$ID/startup.sh,gcs-bucket=gs://$ID)
  then
    printf "\n\e[1;96m%s\n\n\e[m" 'Instance Template Created'
    sleep 2.5

    # Create an Instance Group
    if (gcloud compute instance-groups managed create autoscaling-instance-group-1 \
          --base-instance-name=autoscaling-instance-group-1 \
          --template=autoscaling-instance01 --size=1 --zone=us-central1-c)
    then
      printf "\n\e[1;96m%s\n\n\e[m" 'Instance Group Created'
      sleep 2.5

      # Configure Autoscaling for the Instance Group
      if (gcloud beta compute instance-groups managed set-autoscaling "autoscaling-instance-group-1" \
             --zone "us-central1-c" --cool-down-period "60" --max-num-replicas "3" \
             --min-num-replicas "1" --mode "on" \
             --update-stackdriver-metric "custom.googleapis.com/appdemo_queue_depth_01" \
             --stackdriver-metric-utilization-target "150" \
             --stackdriver-metric-utilization-target-type "gauge")
      then
        printf "\n\e[1;96m%s\n\n\e[m" 'Autoscaling Configured)'
        sleep 2.5
        printf "\n\e[1;92m%s\n\n\e[m" 'Completed'
      fi
    fi
  fi
fi
