## build and push in docker hub

  sudo docker build . -t shahriarraka/k8s-hello

  sudo docker images

  sudo docker login

  sudo docker push shahriarraka/k8s-hello

## at kubernetes

  kubectl get deployments // there is still no deplyment

  kubectl get services // only kubernetes service is running , the default one

  kubectl get deployment k8s-hello --image=shahriarraka/k8s-hello

  kubectl get pods //get the running pods

  kubectl expose deployment k8s-hello --port=3000 // 3000 port was linstening port of nodejs application

  kubectl get services // k8s-hello cluster will be shown

- cluster ip will not be accessable from remote computer 
  
  minikube ip

192.168.59.101 

  ssh docker@192.168.59.101 // password is tcuser

  curl 10.97.47.157:3000 //cluster ip with port

  curl 10.97.47.157:3000;echo //cluster ip with port

  kubectl get pods

  kubectl get deployment

  kubectl scale deplyment k8s-hello  --replicas=4

  kubectl get pods // all the pods are runnning

  kubectl get pods -o wide // all the pods with ip address

  kubectl get services //list all the services

- all the pods are available via cluster ip 
  
  curl 10.97.47.157:3000; echo // now loads will be balanced across all the pods

## delete services

  kubectl delete services k8s-hello

  kubectl get services  // k8s-hello service will not be found

## expose server to real world

  kubectl expose deployment k8s-web-hello --type=NodePort --port=3000

  kubectl get services

- here k8s-hello service will be type NodePort and port is 3000:32142/tcp 
  
  minikube ip
  
  192.168.59.101 

- in browser 192.168.59.101:32142 
  
  minikube service k8s-hello // open the cluster in browser automatically
  
  minikube service k8s-hello --url // see acutual url
  
  kubectl delete services k8s-hello  // delete the service
  
  kubectl get service

## push another verson of docker container in kubernetes

  sudo docker build . -t shahriarraka/k8s-hello:2.0.0

  sudo docker push  shahriarraka/k8s-hello:2.0.0

  kubectl set image deployment k8s-hello k8s-hello=shahriarraka/k8s-hello:2.0.0

  kubectl rollout status deployment k8s-hello // rollout the new version

  kubectl get pods // see the running pods

  kubectl get services

  minikube service k8s-hello // open the service in browser

## move back to previous versions

  kubectl set image deployment k8s-hello  k8s-hello = shahriarraka/k8s-hello

  kubectl rollout status deployment k8s-hello

  kubect get pods

## if we delete one pod manually , new one will be created

  kubectl get pods

  kubectt delete pod k8s-hello-523566-54354

  kubectl get pods

## minikube dahsboard

  minikube dashboard

@ delete all pod 

  kubectl delete all --all

  kubectl get pods

- kubernetes documantaion kubernetes api

## apply document.yaml

  kubectl apply -f deployment.yaml

  kubectl get deployment // see the deployment

- kubernetes API / workload / Deployemnt / replicas 
  
  kubectl get deployment

## apply service yaml

  kubectl apply -f service.yaml // created

  kubectl get services

  minikube service k8s-hello

## delete deplyment and service

  k delete -f deployment.yaml -f service.yaml // delete all config

  kubectl get services

  kubectl get deployment

## k8s-web-to-nginx

  docker build . -t shahriar/raka

  docker push shahriar/raka

  kubectl get deployments //nothing

  kubectl get services // nothing

## create both service & deployment

  kubectl apply -f k8s-web-to-nginx.yaml -f nginx.yaml

  kubectl get deployments // 2 deployment

  kubectl get services // 2 services

  kubectl get pods

  kubectl exec k8s-web-to-nginx-234543-2345 -- nslookup nginx

 kubectl get services

 kubectl exec k8s-web-to-nginx-234543-2345 -- wget -q0- http://nginx

# 

minikube status

 minikube stop

 minikube start --driver=virtualbox --container-runtime=containerd

minikube start --driver=virtualbox --container-runtime=cri-o // unable to run cri-o inside docker container

 minikube status  //

minikube ip

 ssh docker@192.168.59.102  //password tcuser

docker ps // error cannot connect to docker continer

sudo crictl ps // running containers

kubectl apply -f k8s-web-to-nginx.yaml -f nginx.yaml

kubectl get deployments

kubectl get services

kubectl service k8s-web-to-nginx

sudo crictl ps | grep k8s-web-to-nginx
