@ 

# docker ps -a

delete all containers 

sudo docker rm -vf $( sudo docker ps -aq)

delete all images 

sudo docker rmi -f $( sudo docker images -aq)

## build and push docker image

sudo docker build -t shahriarraka/game_station_golangapi:latest .

sudo docker push shahriarraka/game_station_frontend:latest
