## laravel needs 6 containers for building complete environment 

## run a specifc container from a docker-compose file 
    docker-compose run --rm composer create-project --prefer-dist laravel/laravel .

## docker compose run specific containers 
    docker-compose up -d server php mysql
    // run only server php mysql container from compose file

docker-compose run --rm artisan migrate

docker-compose   up -d --build server