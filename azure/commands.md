az group create --name myResourceGroup --location eastus
az aks create --resource-group myResourceGroup --name myAKSCluster --node-count 1 --enable-addons monitoring --generate-ssh-keys


helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install ingress-nginx ingress-nginx/ingress-nginx


az network dns zone create -g myResourceGroup -n mycustomdomain.com


kubectl get service -l app=ingress-nginx -n ingress-nginx


az network dns record-set a add-record -g myResourceGroup -z mycustomdomain.com -n '*' -a <External-IP>