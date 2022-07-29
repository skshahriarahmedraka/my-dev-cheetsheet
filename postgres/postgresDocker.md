docker run --name auth-psql -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=test -d postgres:latest

docker inspect auth-psql

sudo docker run --name my-postgresql -p 5432:5432 -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=password -d postgres:latest

sudo  docker exec -it my-postgresql psql -U admin


