### kubernetes or k8s is a container orchestration system

supported container  runtimes
    - 1.docker 2.CRI-0 3.Containerd

k8s smallest part "pod"
pod contains 1 or many container , has shared volumes ,shared IP Address

k8s has 1 Master Node && any number of worker node 

Master Node -
    1. API Server 
    2. Scheduler 
    3. Kube Controller Manager
    4. Cloud controller Manager 
    5. etcd 
    * kubelet *kube-proxy *Container-Runtime

### install cubectl

```
snap install kubectl --classic
kubectl version --client
```

### install minicube

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```

### enable hyper-V : Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

#### minicube command

```
 minikube start --driver=hyperv // on Windows 

 minikube start --driver=virtualbox

 minikube status

 minikube ip // will show ip

 ssh docker@192.168.59.101 // connecting to a Node in kubernetis

- ssh is a standard protocol for management of any server (including remote servers) . but minikube also provides command  to ssh into the local minikube  node "minikube ssh" . if you ser " --docker=driver " you should use "minikube ssh" because "ssh docker@<minikube IP>" will not work
```

- minikube  node user credentials :
    Username : docker
    Password : tcuser
  
  ### inside Kubernetes node
  
  ```
   docker ps // see all running docker container
  ```

- kubectl is not avaliable inside a Node 

- minikube also provides kubectl to tool and you run commands for example like this "minikube kubectl --cluster-info" 
  
  ```
  kubectl cluster-info // information about cluster
  kubectl get nodes // list of nodes
  kubectl get pods // list of pods
  
  kubectl get namespaces // list of all namespace
  
  kubectl get pods --namespace=kube-system 
  //list all pod of namespace kube-system
  
  kubectl run nginx --image=nginx //craate nginx pod
  
  kubectl get pods //status of the pods
  
  kubectl describe pod nginx // describe a pod
  
  kubectl get pods
  
  ssh docker@192.168.59.101 //connnect to nodes of docker
  docker ps | grep nginx 
  ```

### Connect to a container

```
$ docker exec -it e390a73c4ef8 sh 
 hostname 
nginx 

# hostname -i

172.17.0.3 

 curl 172.17.0.3 // will show welcome to nginx html page

exit

 kubectl get pods -o wide
```

if there are several container  in Pod - they share the same IP address 

```
kubectl get pods -o wide
```

```
@ delete pod 
```

 kubectl delete pod nginx // nginx deleted

 kubectl get pods // no pod found

 alias k="kubectl" // create alias for kubectl

 k get pods // using alias

```
### Deployment
```

 kubectl create deployment nginx-deployment --image=nginx

- deployment create pods automatically , deployment handle the pods
  
   kubectl get deployments // list of deployments
  
   kubectl get pods
  
  kubectl describe deployment nginx-deployment // details about deployments

- Selector are used to connect pods with deployment
  
   kube get pods // name will be replica-set + [hash]

- lebels pod-template-hash is same as replica-set
  
  kubectl scale deployment nginx-deployment --replicas=5 //create 5 replicas and all are running
  
  kubectl get pods -o wide // detail about the pods
  
  kubectl scale deployment nginx-deployment --replicas=3 //scale down to 3
  kubectl get pods -o wide //3 pods are running
  
  curl 172.17.0.5 // doesnt work
  
  minikube ip // 192.168.59.101
  
  ssh docker@192.168.59.101
  
  curl 172.17.0.5 // this work
  
  kubectl get pods -o wide // list of pods

```
@ 

### kubectl get deplyments
```

kubectl expose deployment nginx-deployment  --port=8080 --target-port=80

    // expose container's 80 port to deployment port 8080 

```
# kubectl get services
```

- cluster ip address is not excessable from outside world 
  $ curl 10.108.156.147:8080 //try to connect to cluster ip from local computer 

ssh docker@192.168.59.101  // ssh to conncect to node ip

kubectl describe service nginx-deployment //

```
### delete deployment & service 
```

 kubectl delete deplyment nginx-deplyment //delete deplyment

 kubectl delete servide nginx-deplyment

 kubectl get deploy // no resources found
