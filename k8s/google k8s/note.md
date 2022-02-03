## autoscale
    kubectl autoscale nginx --min=10 --max=15 --cpu=80
    // when cpu cross 80% pods will increase 
    kubectl get pods -l "app=nginx" -o yaml 

## after edit config file 
    kubectl apply -f nginx-deployment.yaml
    kubectl get replicasets 
    kubectl get pods
    kubectl get deployments
    kubectl get services 
    curl 104l.198.49,140

- rollingUpdate are used when you dont want to experience downtime in a application . application will replaced one by one and update new version 
## Google Cloud Platform 
- cloud console 
    - anthos configement 
    - anthos service mesh 
    - google kubernetes Engine
- cloud inerconnect , gcp marketplace , stackdriver(logging and Monitoring)
- ON-Prem Data Center 
    - Policy repository
    - istio open source 
    - Antos Config Management
    - GKE On-Prem
-- learn more about Anthos , cloud.google.com/anthos , cloud.google/anthos/doc 



