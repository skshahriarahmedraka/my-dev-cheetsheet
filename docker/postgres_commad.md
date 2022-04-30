## run docker postgresql container 
    sudo docker pull postgres 
    sudo docker run --name my-postgres -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:latest
    sudo docker run my-postgres
    sudo docker exec -it my-postgres psql -U root
