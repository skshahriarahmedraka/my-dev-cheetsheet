## k8s and networking

connecting pods, containers & world

- another look at services

- pod internal communication

- Pod To Pod Communication

#### create docker compose

docker-compose.yml

```
version: "3"
services:
    auth:
        build: ./auth-api
    users:
        build: ./user-api
        environment:    
           AUTH_ADDRESS:auth
        ports:
         - "8080:8080"
   tasks:
      build: ./task-api
      ports:
        - "8000:8000"
      environment:
        TASKS_FOLDER: tasks
```

```
docker build -t academind/kub-demo-users:latest .


docker push academind/kub-demo-users:latest 
```

user-deloyment.yml

```
apiVersion: apps/v1
kind: Deployment
metadata: 
    name: user-deployment
spec:
    replicas: 1
    selector:
        matchLabels:
            app: users
    template:
        metadata:
            labels:
                app: users
        spec:
            containers:
                - name: users
                  image: academind/kub-demo-users
```

now apply this yml file

```
kubectl apply -f=user-deployment.yml
kubectl get pods
```

create an service yml file for public access

users-service.yml

```
apiVersion: v1
kind: Service
metadata:
    name: users-service
spec:
    selector:
        app: users
    type: LoadBalancer
    ports:
        - protocol: TCP
          port: 8080
          targetPort: 8080
```

apply this service

```
kubectl apply -f= users-service-yml
minikube service users-service
```

create a user-deployment with more than one container and one is public and one is private

user-deployment.yml

```
apiVersion: apps/v1
kind: Deployment
metadata: 
    name: user-deployment
spec:
    replicas: 1
    selector:
        matchLabels:
            app: users
    template:
        metadata:
            labels:
                app: users
        spec:
            containers:
                - name: users
                  image: academind/kub-demo-users
                - name : auth
                  image: academind/kub-demo-auth:latest
```

if 2 container wants to communicate with each other , you have to set environvariable with  value `localhost` , and use those enviroment variable as ip address

now  we  will create 3 pod  one  is private to cluster and 2 are public 

`auth-deployment.yml`

```
apiVersion: apps/v1
kind: Deployment
metadata: 
    name: auth-deployment
spec:
    replicas: 1
    selector:
        matchLabels:
            app: auth
    template:
        metadata:
            labels:
                app: auth
        spec:
            containers:
                - name : auth
                  image: academind/kub-demo-auth:latest
```

`auth-service.yml`

```
apiVersion: v1
kind: Service
metadata:
    name: auth-service
spec:
    selector:
        app: auth
    type: LoadBalancer
    ports:
        - protocol: TCP
          port: 80
          targetPort: 80
```



for  cluster internal  comunication  there is `namespace`

set in `user-deployment.yml`



```
apiVersion: apps/v1
kind: Deployment
metadata: 
    name: user-deployment
spec:
    replicas: 1
    selector:
        matchLabels:
            app: users
    template:
        metadata:
            labels:
                app: users
        spec:
            containers:
                - name: users
                  image: academind/kub-demo-users

                  env: 
                    -name: AUTH_ADDRESS
                    value: "auth-service.default" 


```
