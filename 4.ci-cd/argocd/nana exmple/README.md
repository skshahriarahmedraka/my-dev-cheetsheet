git repository
- Git repository on Gitlab with deployment service  yaml files

docker hub
- public docker repository, hosting the docker images with 3 tags 

k8s cluster
- empty minikube cluster on your local machine

# steps 
1. install ArgoCD in k8s cluster
2. configure ArgoCD with "Application" CRD

# here 
nanajanashia/argocd-app:1.0  is a public docker image form docker hub

Install Argo CD
```
    kubectl create namespace argocd
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```
This will create a new namespace, argocd, where Argo CD services and application resources will live.

If you are not interested in UI, SSO, multi-cluster features then you can install core Argo CD components only:
```
    kubectl create namespace argocd
    kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/core-install.yaml
```

## see the running pod
```
    kubectl get pods -n argocd
```
## see the running service
```
    kubectl get svc -n argocd
```

## port-forward the service
```
    kubectl port-forward svc/argocd-server -n argocd 8080:443
```

## login to the UI
```
    argocd login localhost:8080
```

## get the password
```
    kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
## get secret from argocd
```
    kubectl -n argocd get secret argocd-initial-admin-secret -o yaml
```
here password is encoded in base64

## decode password
```
    echo [passord]  | base64 --decode
```

- ArgoCd polls git repository every 3 miniutes 

## apply the application
```
    kubectl apply -f application.yaml
```

- editing anything inside the deployment.yaml file will trigger a new deployment 

## change the deployment file directly
```
    kubectl edit deployment  -n myapp myapp
```
 - if we change some thing 



