## pull latest image

    sudo docker pull mysql/mysql-server:latest 
    sudo docker run -p 3306:3306 -d --name=mysql mysql/mysql-server:latest
    
    sudo docker exec -it [imageName] bash
    mysql -h 127.0.0.1 -P 3306 -u root -p mysql
    
    
    sudo docker run --name [imageName]  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=111187 -d mysql

## for exit from interactive terminal

    exit