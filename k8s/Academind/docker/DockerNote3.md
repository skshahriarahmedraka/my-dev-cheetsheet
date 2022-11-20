host.docker.internal
// it translated as host pc domain

## mongodb

    docker run -d --name mongodb mongo
    // name mongodb
    docker container  inspect mongodb
    //inspect mongodb instance
    // network-> ipaddress (ipaddress of the contaienr)
    host.docker.internal 
    // this can be use instade local host

## find ip of a contaiener and use it to communicate with one another

    docker container inpect mongo
    // check NetworkSettings :  IPAddress

## creating container network

    docker network --help 
    // see help
    docker run --network my_network
    // within docker network all container can communicate with  each other and IPs are automatically resolved 

## docker network

    docker network create NetworkName
    docker network create favorites-net 
    // create network
    docker network ls
    // see all the available network
    
    docker run -d --name mongodb --network favorites-net mongo
    // run container with network
    // you can  use docker name as ip of the container
    docker run --name favorites --network favorites-net -d --rm -p 3000:3000 favorites-node 
    docker logs favorites
    // now can contaienr can use container name as ip of that container
    http://mongo:27017/favorite

## 

    docker run --name goals-backend --rm -d -p 80:80 goals-node
    
    //create front end docker file
    docker build -t goals-react .
    docker run --name goals-frontend --rm -p 3000:3000 -it goals-react
    // creating a network
    docker network create goals-net
    
    docker network ls 
    // see all the networks
    
    docker run --name mongodb --rm -d --network goals-net mongo
    
    docker run --name goals-backend --rm -d --network goals-net goals-node
    
    docker run -v /user/code/sourcecode/src:/app/src --name goals-frontend --rm -p 3000:3000 -it goals-react

## for backend

    docker run --name goal-backend -v /user/deve/project/:/app -v logs:/app/logs -v /app/node_modules -e MONGODB_USERNAME=max -d --rm -p 80:80 --network goals-net goals-node

## for front end

    docker run -v /user/dev/front/src:/app/src --name goals-frontend --rm -p 3000:3000 -it goals-react 

## for database

    docker run --name mongodb -v data:/data/db --rm -d --network goals-net -e MONGO_INITDB_ROOT_USERNAME=max -e MONGO_INITDB_ROOT_PASSWORD=secret mongo
