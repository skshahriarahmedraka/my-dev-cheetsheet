
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
## creating container network
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