## build production ready react 
    docker build -f frontend/Dockerfile.prod -t academind/goals-react ./frontend

    docker push academind/goal-react

## run only the builder stage
    docker build --target build -f frontend/Dockerfile.prod ./frontend

## from AWS to other
    AWS was a example 
        - manual installation of docker + management of the underlying sever 
            - possible with any provider that gives you fully controlled remote hosts/instances
        - managed container /docker services like AWS ECS 
            - many cloud provider offer managed docker/container services
## Docker kin development 
    -isolated , standalone environment 
    - reproducible enviroment , easy to share and use 
## Docker in production 
    - isolation , standalone environment
    - reproducible environment easy to share and use 