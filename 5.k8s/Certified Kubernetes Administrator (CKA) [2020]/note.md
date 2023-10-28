see all running pods in a namespace

```
kubectl get pods -n kube-system 
```

all the resources 

```
kubectl api-resources | less
```

- kube-apiserver : front-end of the cluster that services rest operations and  connects to the etcd database  

- kube-scheduler : schedulers pods on specific nodes based on labels , taints ,and tolerations set for the pods

- etcd : a B+tree key-value store that keeps the current cluster state

- kube-controller-manager: managers current state of the cluster

- cloud-controller-manager: interats with outsite cloud managers

- different optional add-ons
  
  - DNS
  
  - Dashboard
  
  - cluster leve resource monitoring
  
  - cluster level logging

- kubelet : passes requests to the container engine to ensure that pods are available 

- kube-proxy : runs on every node and uses iptables to provide an interface to connect to kubernetes components 

- container runtime : takes care of actually running the containers

- supervisord: monitors and guarantees the availability of the kubelet and docker processes 

- network agent: implements a software defined networking solution , such as weave

- logging : the CNCF project fluentd  is used for unified logging in the cluster. A fluentd agent must be installed  on the k8s nodes  
