#!/bin/bash

#delete a *K8s cluster in GCP

if gcloud container clusters delete $cluster
then
    printf "\n\e[1;96m%s\n\n\e[m" 'Cleaned Up'
    sleep 2.5

    printf "\n\e[1;92m%s\n\n\e[m"  'Completed'
    
fi      