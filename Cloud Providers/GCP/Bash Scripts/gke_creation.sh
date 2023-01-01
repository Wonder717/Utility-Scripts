#! /bin/bash

# Initialization of Script
gcloud init < a
cluster='my-cluster'

# Create a Kubernetes Engine cluster
if  gcloud container clusters create $cluster --no-enable-autoupgrade --no-enable-ip-alias
then
  printf "\n\e[1;96m%s\n\n\e[m" 'Cluster created'
  sleep 2.5

  # Create a new Deployment - hello-server
  if  kubectl create deployment hello-server \
          --image=gcr.io/google-samples/hello-app:1.0
  then
    printf "\n\e[1;96m%s\n\n\e[m" 'Hello-Server Deployment created'
    sleep 2.5

    # Create a Kubernetes Serivce
    if  kubectl expose deployment hello-server \
            --type=LoadBalancer --port 8080
    then
      printf "\n\e[1;96m%s\n\n\e[m" 'Created Kubernetes Service'
      sleep 2.5

     
    fi
  fi
fi
