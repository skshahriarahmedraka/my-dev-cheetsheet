### imperative vs declarative kubernetes usage



Imperative 

- kubectl create deployment ...

- indivisula command are executed to trigger certain kubernetes actions 

- Comparable to using docker run only

Declarative 

- kubectl apply -f config.yaml 

- A Config file is defined and applied to change the desired state 

- Comparable with Compose files



check if there is any depolyment

```
kubectl get deployment 
// if there is any deployment delet them 
kubectl delete deployment [nameOfDeployment]

kubectl get pods // there should not be any pod
kubectl get services // there should be 1 service name kubernetes 
```



deployment.yml



```
apiVersion: apps/v1
kind: Deployment 
metadata:
    name: second-app-deployment 
spec: 
    replicas: 1
    selector:  // have to give
        matchLebels:
            app: second-app
            tier: backend
    template:
        metadata:
            labels:
                app: second-app
                tier: backend
        spec:
            containers:
                - name: second-node
                  image: academind/kub-first-app:2
```



deploy the deployment file 

```
kubectl apply -f=deployment.yml
```



service.yml 

```
apiVersion: v1 
kind: Service 
metadata:
    name: backend
spec:
    selector:
        app: second-app
    ports: 
        - protocol: "TCP"
          port: 80
          targetPort:8080
        # - protocol: "TCP"
        #   port: 443 
        #   targetPort: 443
    type: LoadBalancer
    

```



```
kubectl apply -f service.yml
kubectl get services // see all the running services 

```



see a service 

```
minikube service [serviceName]
```

if you change replica number in `deployment.yml` 

```
kubectl apply -f=deployment.yml

//see the deployments 
kubectl get pods
```



delete a deployment 

```
kubectl delete deployment [nameOfDeployment]
kubectl delete deployment -f=deployment.yml
 // deployment associated with the deployment.yml 
kubectl delete deployment -f=deployment.yml,service.yml
kubectl delete deployment -f=deployment.yml -f=service.yml 
```



    

### Use  a Master-Deployment.yml  for deployment & service



```
apiVersion: v1 
kind: Service 
metadata:
    name: backend

spec:
    selector:
        app: second-app
    ports: 
        - protocol: "TCP"
          port: 80
          targetPort:8080
        # - protocol: "TCP"
        #   port: 443 
        #   targetPort: 443
    type: LoadBalancer
    
---
apiVersion: apps/v1
kind: Deployment 
metadata:
    name: second-app-deployment 
spec: 
    replicas: 1
    selector:  // have to give
        matchLebels:
            app: second-app
            tier: backend
    template:
        metadata:
            labels:
                app: second-app
                tier: backend
        spec:
            containers:
                - name: second-node
                  image: academind/kub-first-app:2

```



delete previous deployment 

```
kubectl delete -f=deployment.yml -f=service.yml 
```

deploy  the master-deployment.yml

```
kubectl  apply -f=master-deployment.yml
```

see the running service 

```
minikube service [serviceName]
minikube service backend
```







```
 selector:  // have to give
        # matchLebels:
          #  app: second-app
          # tier: backend
     matchExpressions:
       - {key:app , operator:In, values:[second-app,first-app]}
       # optional expression to set key value
```



```
containers:
    - name: second-node 
      image: academind/kub-first-app:2
      livenessProbe:
        httpGet:
           path: /
           port: 8080
        periodSeconds: 10
        initialDelaySeconds: 5
```






