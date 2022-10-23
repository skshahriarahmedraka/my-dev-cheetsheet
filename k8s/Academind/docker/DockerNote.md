## for building a Dockerfile

    // create a file name "Dockerfile"
    // add docker command in "Dockerfile"
    docker build .
    // will show a container id 
    // run docker id  
    docker run -p 3000:3000 [containerID]
    // see running docker 
    docker ps -a 
    docker stop [containerName] 

- images : templates/blueprint for containers , contains code + required tools/runtimes 
- container : running "unit of software" , multiple containers can be created based on one image 

## run official docker image

    docker run node 
    // node official image willbe downloaded from docker hub 
    
    docker run -it node 
    // run with a interactive shell 
    
    docker ps
    // only shows the running containers
    
    docker ps -a 
    // show all the processes running and exited 
    // 
    
    docker run -it node 

## docker commands

    FROM node
    // here node is from any local image / dockerhub image
    COPY . .
    // first "." means the directory where "Dockerfile" is 
    // second "." means the directory inside docker Container , 
    // we can explicitly tell that "COPY . /app"
    here its the root directory
    WORKDIR /app
    // selecting a folder as working directory 
    // after setting WORKDIR all the directory "." will be WORKDIR 
    
    RUN npm install 
    // RUN will run when image is created 
    CMD node server.js
    // CMD will rull command when container is started
    CMD ["node","server.js"] 
    - if you dont specificy  a CMD , the CMD of the base image will be executed .with no base image  and CMD , you'd get an error 
    EXPOSE 80
    // EXPOSE , docker will expose port 80 to connect to outside the container , docker has its own network sestem  

## now the docker file

    FROM  node 
    WORKDIR /app
    COPY . /app
    RUN npm install 
    EXPOSE 80
    CMD ["node","server.js"]

## build Dockerfile

    docker build .
    // it will give a docker id at the end 

## run Dockerfile

    docker run [imageID]
    // this will not be accessable from local pc
    docker run -p 3000:80 [dockerID]
    // -p = publish port, here 3000 and 80 is EXPOSE port
    // will show the output on terminal
    docker run -p 3000:80 -d [dockerID]
    // -d : deteach mode
    // -a : attach mode
    //we can attach a detach container
    docker attach [containerID/name] 
    // start a constainer
    docker start [containerName]
    
    //see all past log 
    docker logs [containerName]
    // see all logs live , attach mode
    docker logs -f [ContainerName]
    // -f : follow mode 
    // 
    // run docker with interractive terminal 
    docker run -it [ContainerID]
    // if we wants to restart with a iteractive terminal 
    docker start -a -i [ContainerName]
    
    // remove container 
    docker rm [ContainerName]
    // running container cannot be removed , you have to stop them first
    
    // remove multiple
    docker rm [ContainerName] [ContainerName] [ContainerName]
    
    // Image list 
    docker images 
    
    // to remove images
    docker rmi [imageID]
    docker rmi [imageID] [imageID] [imageID] 
    - if a image is used by a container then all the container must be removed , than the image can be removed
    
    // remove all the unused imaged
    docker image prune
    
    // remove container  when it stoped
    // use --rm 
    docker run -p 3000:80 -d --rm [imageID]
    
    //inspect image 
    docker image inspect [imageID]
    
    // copy file from local to running container 
    docker cp dummy/. [conatainerName]:/test
    // there is a dummy folder in local computer and in docker contaner files will be paste in /test/ directory
    
    //copy container  to local pc 
    docker cp  [conatainerName]:/test dummy/.
    
    // create container with name 
    docker run -p  3000:80 -d --rm --name MyNodeContainer [imageID]
    
    //stop 
    docker stop MyNodeContianer
    
    - image name should be small latter 
    
    sudo docker image prune -a

## share  docker images

    docker push IMAGE_NAME 
    // default host name will be dockerhub 
    
    docker pull IMAGE_NAME
    // default hsot name will be dockerhub
    
    docker pull shahriarraka/[imageName]:tagname 
    
    - to publish a local image in dockerhub you can rebuild image 
    docker build -t shahriarraka/[ImageName] .
    
    - OR create from a existing tag 
    docker tag node-demo:latest shahriarraka/node-hello-world 
    docker push shahriarraka/node-hello-world
    
    docker login

## delete

    docker image prune -a 
    // delete all images 
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)

## pull and run

    docker pull shahriarraka/node-hello-world 
    
    docker run -p 8000:3000 --rm shahriarraka/node-hello-world

## run custom named docker file name 
    docker build -f [my-custom-dockerfile-name] [path] 
    // example
    docker build -f Dockerfile.dev .
    