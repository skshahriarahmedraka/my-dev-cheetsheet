## see all the running container :

    docker ps -a

## run a docker image :

    docker run -d tmp-ubuntu

## pause

    docker pause happy_wilbur

## restart

    docker restart happy_wilbur

## stop:

    docker stop happy_wilbur

## remove

    docker rm happy_wilbur

## create a volume

    docker volume create

## publish for bridge network

    --publish 8080:80

## service monitoring

     docker stats
    
    docker pull mcr.microsoft.com/dotnet/core/samples:aspnetapp
    docker image list
    docker run mcr.microsoft.com/dotnet/core/samples:aspnetapp
    docker run -p 8080:80 -d mcr.microsoft.com/dotnet/core/samples:aspnetapp
    docker ps
    docker container ls
    docker stop elegant_ramanujan
    docker start elegant_ramanujan
    docker rm elegant_ramanujan
    docker container rm -f elegant_ramanujan
    docker image rm mcr.microsoft.com/dotnet/core/samples:aspnetapp

## create azure container registry

    az acr create --name myregistry --resource-group mygroup --sku standard --admin-enabled true

### Azure Container Registry repositories are private, meaning they do not support unauthenticated access. To pull images from an Azure Container Registry repository, use the docker login command and specify the URL of the login server for the registry. The login server URL for a registry in Azure Container Registry has the form <registry_name>.azurecr.io.

    docker login myregistry.azurecr.io

### Docker login will prompt you for a username and password. To find this information, you can either go to the Azure portal and look up the access keys for the registry, or you can run the following command.

    az acr credential show --name myregistry
    
    docker tag myapp:v1 myregistry.azurecr.io/myapp:v1
    
    docker push myregistry.azurecr.io/myapp:v1
    
    az acr repository list --name myregistry
    
    az acr repository show --repository myapp --name myregistry

## Use Azure Container Instance to run an image

    az container create --resource-group mygroup --name myinstance --image myregistry.azurecr.io/myapp:latest --dns-name-label mydnsname --registry-username <username> --registry-password <password>
    
    az container show --resource-group mygroup --name myinstance --query ipAddress.fqdn