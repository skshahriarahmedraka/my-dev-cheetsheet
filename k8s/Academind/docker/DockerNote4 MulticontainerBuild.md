-------------------

Create NetWork
-------------------

docker network create goals-net
--------------------------

Run mongodb Container
--------------------------

docker run -- name mongodb \
-e MONGO_INITDB_ROOT_USERNAME=max \
-e MONGO_INITDB_ROOT_PASSWORD=secret \
-v data:/data/db \
-d \
-rm \
--network goals-net \
mongo

---------------------------

Build node Api image
------------------------------

docker run --name goals-backend \ 
-e MONGODB_USERNAME =max \
-e MONGODB_PASSWORD= secret \
-v logs:/app/logs \
-v /USER/DEV/dockerproject/backend:/app \
-v /app/node_modules \
--rm \
-d \
--network goals_net \
-p 80:80 \
goals-node

----------------------------------

Build React SPA Image
----------------------------------

docker build -t goal-react .
-----------------------------------

Run Node API Container
-----------------------------------

docker run --name goals-frontend \
-v /USER/DEV/dockerproject/src:/app/src \
--rm \
\d \
-p 3000:3000 \
-it \
goals-react

---------------------------------------

stop all containers
---------------------------------------

docker stop mongodb goals-backend goals-frontend 
