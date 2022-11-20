## Data 3 types inside docker

    - Appliation 
        - written& provided by developer 
        - added to docker image and container in build phase 
        - fixed can't be change onced image is built
        - Read-only, hence stored in image 
    - Temporary App Data 
        - fetch/produced in running container 
        - stored in memory or temporary file 
        - Dynamic and changing but cleared regularly
        - Read + Write , temporary , hence stored in Containers 
    - Permanent App Data 
        - fetch /produced in running container in running container 
        - stored in filed or a database 
        - Must not be lost if container stops/restarts 
        - Read + Write, permanent , stored with container & volumes 

## data-volumes-01-starting-setup

    // build  
    docker build -t feedback-node .
    
    // run feedback-node image 
    docker run -p 3000:80 --name feedback-app --rm feedback-node 

## Understanding volumes

    - Volumes are folders on your host machine ("made available ", mapped) into container 
    - Host (your container)
        - /some-path   (inside container)
        - /app/user-data  (host computer)
    - Volumes persist if container shutdown. if a container shutdown . if a container (re-) start and mounts a volume , any data inside of that volume is available in the container . 
    - A container can write data into a volume and read data from it .

## 2 types of external Data Storage

    - Volumes
        - Volumes (managed by docker )
            - Anonymus Volumes 
            - Named Volumes
            -- Docker sets up a folder / path on your host machine, extact location is unknown to you (= dev) . Manged Via "docker volume" commands.
            -- A defined Path is the container is maped to created volume/mount . e.g. /some-path on your hosting machine is mapped to /app/data
            -- gret for data which should be persistent but which you dont need to edit directly

## add a volume

    // docker command
    VOLUME ["/app/feedback"]
    // see the volume
    docker volume ls

## add a name volume

    // we have to specify the name of the volume when running the container 
    docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback feedback-node:volumes
    // run the application 
    // restart the feedback-app 
    docker stop feedback-app
    // see the volumes 
    docker volume ls
    //start again 
    docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback feedback-node:volumes

## bind mounts(managed by you)

    - you define a folder / path on your host machine
    - great for persistent ,editable (by you) data (e.g. source code)

## run with bind mount

    docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "/mnt/rust/my dev cheetsheet/k8s/Academind/data-volumes-01-starting-setup:/app" feedback-node:volumes
    
    // this container will shutdown imediately
    
    
    docker run -d -p 3000:80 --rm --name feedback-app -v feedback:/app/feedback -v "/mnt/rust/my dev cheetsheet/k8s/Academind/data-volumes-01-starting-setup:/app" -v /app/node_modules feedback-node:volumes
    // here "-v /app/node_modules" is a anonymus folder 
    // it's same as "VOLUME ["/app/node_modules"]"
    // when your project code and bind mount directory has same directory , bind bount overwrites the existing folder , if 
    // there is more specific directory present like here "/app/node_modules" is more specific than "/app" so more specific wins 

## volumes & bind mounts

    docker run -v /app/data 
    - anonymous Volume
    docker run -v data:/app/data 
    - Name Volume
    docker run -v /local/path/to/code:/app/code 
    - Bind Mount

## Volumes comparison

    Anonymous Volumes
    - created specifically for a single container
    - Survives container shutdown/restart unless --rm is used
    - Can not be shared across containers 
    - since it's anonymous it cann't be reused (even on same image)
    -- can be created use -v flag "-v /app/node_modules" OR "VOLUME ["/app/node_modules"]" inside Dockerfile 
    
    Named Volumes
    - created in  general - not tied to any specific container
    - servives container shutdown/restart - removal via Docker CLI
    - can be shared across containers 
    - can be reused for same container (accross restart)
    -- "-v feedback:/app/feedback "
    Bind Mounts 
    - location on host file system not tied to any specific contaniner
    - Survives container shutdown/ restart removal on host fs
    - canbe shared accross container
    - can be re-used for some container (across restarts )
    -- "-v "/user/raka/develop/file:/app" "
    -- "-v "/user/raka/develop/file:/app:ro" " //read only from docker file

## why need COPY . .  when mounting premanet directory

    -- container will run in a  production environment , by using copy . . it will take a snapshot of code . 

## ignore

    - ".dockerignore" this file list of all the direcory which will be ignore by docker

## ARGumerns & ENVironment variables

    - Docker supports build-time  ARGument and runtime ENVironment veriables 
    -- ARG
        - Available inside of "Dockerfile", not accessible in cmd or any application code 
        - Set on image build(docker build) via --build-arg 
    -- ENV
        - Available inside of "Dockerfile" & in application code 
        - Set via "ENV"  in "Dockerfile" or via "--env" on "docker run" 
    ```
    ENV PORT 80 
    EXPOSE $PORT 
    ```
    - we can set invironment variable "--ENV PORT=8000" or "-e PORT=8000" 
    ```
    ARG DEFAULT_PORT=8080
    ```
    load .env file
    ```
    --env-file ./.env
    ```

## access env var inside nodejs

    console.log(process.env.PORT)

## summary

    - Container can read +write data . "Volumes" can help write data storage, "bind Mounts" can help with direct contaienre interaction
    - Container can read + write data , but written data is lost if the contaiener is removed 
    - Volumes are folders on the host machine, managed by docker which are mounted into the container
    - "Name Volumes" servive container removal and can there fore be used to store persistent data 
    - "Anonymous Volumes " are attatched to a container - they can be used to save (temporary ) data inside the contaienr
    - "Bind Mounts" are folders on the host on the host machine which are specified by the user and mounted into containers like "Name Volumes"
    - build ARGument and RUNTIME ENVironment variables can be used to  make images an containers more dynamic / configurable
