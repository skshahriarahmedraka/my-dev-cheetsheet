#### Module Content

- volumes

- Persistent Volumes & persistent Volume claims

- Environment Variables

understand 

   state is data created and used by your application which must not lost

- user generated data user accounts
  
  - Often stored in a database but could also be files (e.g. upload)

- intermediate results derived by the app 
  
  - often stored in memory temporary database tables or files

#### k8s and volumes

k8s can mount volumes into Containers

- A Broad varity of volume type/drivers are supported
  
  - local volumes(i.e. on Nodes)
  
  - Cloud Provider Specific Volumes

- Volume lifetime depends on the pod lifetime
  
  - volumes survive container restart (and removal)
  
  - Volumes are removed when pods are distroyed

#### K8s volumes

- k8s volumes 
  
  - supports many different drivers and types 
  
  - volumes are not necessarily persistent
  
  - volumes survive container restarts and Removals 

- Docker Volumes 
  
  - basically no driver/type support 
  
  - volumes persist until manually creared
  
  - volumes survive container restarts and removals

deployment.yml

```
apiVersion: apps/v1
kind: Deployment
metadata:
    name: story-develoyment
spec: 
    replicas: 1
    selector:
        matchLabels:
            app: story
    template:
        metadata:
            labels:
                app: story 
        spec:
            containers:
                - name: story 
                image: academind/kub-data-demo
```

service.yml

```
apiVersion: v1
kind: Service 
metadata:
    name: story-service
spec:
    selector:
        app: story
    type: LoadBalancer
    ports:
        - protocol: "TCP"
          port:80
          targetPort:3000
```

deployment.yml with **emtyDir**

```
apiVersion: apps/v1
kind: Deployment
metadata:
    name: story-develoyment
spec: 
    replicas: 1
    selector:
        matchLabels:
            app: story
    template:
        metadata:
            labels:
                app: story 
        spec:
            containers:
                - name: story 
                image: academind/kub-data-demo:1
                volumeMounts:
                    - mountPath: /app/story
                      name: story-volume
           volumes:
                - name: story-volume
                  emptyDir: {}
```

at the begining of the runnig there is no directory `/app/story` its just a empty directory

if you create multiple pod , every pod will face error at first because there is no `/app/story` directory , but after the create  the directory this error will gone

use `hostPath` to create host bind mounted directory

```
apiVersion: apps/v1
kind: Deployment
metadata:
    name: story-develoyment
spec: 
    replicas: 1
    selector:
        matchLabels:
            app: story
    template:
        metadata:
            labels:
                app: story 
        spec:
            containers:
                - name: story 
                image: academind/kub-data-demo:1
                volumeMounts:
                    - mountPath: /app/story
                     name: story-volume
           volumes:
                - name: story-volume
                  hostPath: /data
                  type: DirectoryOrCreate
```



### persistent volume

normal volume are destroid when pod is removed , `hostPath` partially works arround that in 'one Node' environment

`host-pv.yml`

```
apiVersion: v1 
kind: PersistentVolume
metadata:
    name: host-pv
spec:
    capacity:
        storage: 1Gi
    volumeMode: Filesystem
    accessModes:
        - ReadWriteOnce 
        #- ReadOnlyMany 
        #- ReadWriteMany
    hostPath:
        path:/data
        type: DirectoryOrCreate
```



for a pod to claim the persisten volume we need a claim yml file

 `host-pvc.yml`

```
apiVersion: v1
kind:PersistentVolumeClaim  
metadata:
    name:host-pvc
spec:
    volumeName: host-pv
    accessModes:
        - ReadWriteOnce 
    resources:
        requests: 
            storage: 1 Gi

```

inside deployment.yml 

 

```
   spec:
        containers:
            - name: story
             image: academind/kub-data-demo:1
              volumeMounts:
                  - mountPath:/app/story
                    name: story-volume
        volumes:
            - name: story-volume
              persistentVolumeClaim:
                    claimName: host-pvc
```



### storage class

`host-pv.yml`

```
apiVersion: v1 
kind: PersistentVolume
metadata:
    name: host-pv
spec:
    capacity:
        storage: 1Gi
    volumeMode: Filesystem
    storageClassName: standard
    accessModes:
        - ReadWriteOnce 
        #- ReadOnlyMany 
        #- ReadWriteMany
    hostPath:
        path:/data
        type: DirectoryOrCreate

```



 `host-pvc.yml`

```
apiVersion: v1
kind:PersistentVolumeClaim  
metadata:
    name:host-pvc
spec:
    volumeName: host-pv
    accessModes:
        - ReadWriteOnce 
    storageClassName: standard
    resources:
        requests: 
            storage: 1 Gi
```

now apply th deployment.yml

```
kubectl apply -f=deployment.yml
```

get  all persistant volume 

```
kubectl get pv
```

see all the claims 

```
kubectl get pvc
```

get deployment

```
kubectl get deployments
```

## state

state is data created and used by your application which must not be lost

- user generated data user account ..
  
  - often stored in a database but could also be files 

- intermediate result derived by the app 
  
  - often stored in memory , temporaty database tables or files
  
  -  

### Normal volume vs Persistent volumes

volumes allow you to persist data

normal volumes

- volume is attached to pod and pod lifecycle

- define and created together with pod

- repetitive and hard to administer on a global level

persistent volume 

- volume is a standalone cluster resource (not attach to a pod)

- created standalone , claime via a pvc 

- can be defined once and used multiple time



## environment variables



set env var

```

apiVersion: apps/v1
kind: Deployment
metadata:
    name: story-develoyment
spec: 
    replicas: 1
    selector:
        matchLabels:
            app: story
    template:
        metadata:
            labels:
                app: story 
        spec:
        containers:
            - name: story
             image: academind/kub-data-demo:1
             env: 
                - name: STORY_FOLDER
                  value: "story"
              volumeMounts:
                  - mountPath:/app/story
                    name: story-volume
        volumes:
            - name: story-volume
              persistentVolumeClaim:
                    claimName: host-pvc

```



now push the changed docker file where you used `process.env.STORY_FOLDER`

```
docker build -t academind/kub-data-demo:2 .


docker push academind/kub-data-demo:2 
```



apply  the updated docker file in kubernetes

```
kubectl apply -f=deployment.yml
```

you can  create different config map for storing env vars

`environment.yml`

```
apiVersion: v1
kind: ConfigMap
metadata: 
    name: data-store-env
data:
    folder: 'story'
    
```

now apply the environment.yml

```
kubectl apply -f=environment.yml
```

see the config map

```
kubctl get configmap
```



use `environment.yml` file in side `deployment.yml`

```

apiVersion: apps/v1
kind: Deployment
metadata:
    name: story-develoyment
spec: 
    replicas: 1
    selector:
        matchLabels:
            app: story
    template:
        metadata:
            labels:
                app: story 
        spec:
        containers:
            - name: story
             image: academind/kub-data-demo:1
             env: 
                - name: STORY_FOLDER
                  valueFrom:
                    configMapKeyRef:
                        name: data-store-env
                        key:folder
                
              volumeMounts:
                  - mountPath:/app/story
                    name: story-volume
        volumes:
            - name: story-volume
              persistentVolumeClaim:
                    claimName: host-pvc

```
