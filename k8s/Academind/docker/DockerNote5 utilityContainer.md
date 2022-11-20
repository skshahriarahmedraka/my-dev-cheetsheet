## application container

    - environment 
    - your app 
    Docker run myapp
    run cmd and start app 
    runs CMD and start app

## utility container

    environment 
    docker run mynpm init 
    execute / append custom command

## create and execute command in docker

    docker exec -t container_name npm init
    // running docker init inside a runngin node container

## after creating ./2.utilityimage/dockerfile

    docker run -it node-util npm init
    
    docker run -it -v /mnt/rust/my dev cheetsheet/k8s/Academind/2.utilityImage:/app node-util npm init
    
    // now host machine project root directory is binded with docker container , now we can remove node from 

ENTRYPOINT in docker file execute command 
// if we add some command in  docker run command that will add after the enry point command  
docker run init mynpm intall 
// here install will append after entrypoint , like `npm install`

docker run init mynpm intall express --save
// example command

# docker yaml

    docker-compose run npm init 
    // it will run npm init inside npm(container) 
    docker-compose run --rm npm init 
    // when stops will remove auto matic