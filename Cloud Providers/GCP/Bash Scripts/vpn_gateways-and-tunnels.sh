#!/bin/bash

#wonderdermwin@yahoo.com

gcloud compute addresses create vpn-1-static-ip --region=us-central1

gcloud compute addresses create vpn-2-static-ip --region=europe-west1

gcloud compute target-vpn-gateways create vpn-1 --region=us-central1 --network=vpn-network-1

gcloud compute forwarding-rules create vpn-1-rule-esp --region=us-central1 --address=34.72.25.50 --ip-protocol=ESP --target-vpn-gateway=vpn-1

gcloud compute forwarding-rules create vpn-1-rule-udp500 --region=us-central1 --address=34.72.25.50 --ip-protocol=UDP --ports=500 --target-vpn-gateway=vpn-1

gcloud compute forwarding-rules create vpn-1-rule-udp4500 --region=us-central1 --address=34.72.25.50 --ip-protocol=UDP --ports=4500 --target-vpn-gateway=vpn-1

gcloud compute vpn-tunnels create tunnel1to2 --region=us-central1 --peer-address=35.187.78.195 --shared-secret=gcprocks --ike-version=2 --local-traffic-selector=0.0.0.0/0 --remote-traffic-selector=0.0.0.0/0 --target-vpn-gateway=vpn-1

gcloud compute routes create tunnel1to2-route-1 --network=vpn-network-1 --priority=1000 --destination-range=10.1.3.0/24 --next-hop-vpn-tunnel=tunnel1to2 --next-hop-vpn-tunnel-region=us-central1

gcloud compute target-vpn-gateways create vpn-2 --region=europe-west1 --network=vpn-network-2

gcloud compute forwarding-rules create vpn-2-rule-esp --region=europe-west1 --address=35.187.78.195 --ip-protocol=ESP --target-vpn-gateway=vpn-2

gcloud compute forwarding-rules create vpn-2-rule-udp500 --region=europe-west1 --address=35.187.78.195 --ip-protocol=UDP --ports=500 --target-vpn-gateway=vpn-2

gcloud compute forwarding-rules create vpn-2-rule-udp4500 --region=europe-west1 --address=35.187.78.195 --ip-protocol=UDP --ports=4500 --target-vpn-gateway=vpn-2

gcloud compute vpn-tunnels create tunnel2to1 --region=europe-west1 --peer-address=35.187.78.195 --shared-secret=gcprocks --ike-version=2 --local-traffic-selector=0.0.0.0/0 --remote-traffic-selector=0.0.0.0/0 --target-vpn-gateway=vpn-2

gcloud compute routes create tunnel2to1-route-1 --network=vpn-network-2 --priority=1000 --destination-range=10.5.4.0/24 --next-hop-vpn-tunnel=tunnel2to1 --next-hop-vpn-tunnel-region=europe-west1