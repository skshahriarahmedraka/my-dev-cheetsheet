## run redis container 
    sudo docker pull redis
    sudo docker run --name my-redis -p 6379:6379 -d redis
    sudo docker ps
    sudo docker exec -it my-redis sh
    # redis-cli
    sudo docker stop my-redis
