## development to prduction : things to watch out for 
1. Bind mount should not be used in production 
2. Containerized apps might need a build step
3. multi-container projects might need to split(should be split) across multiple host/remote machines
4. trade-offs between control and responsibility might be worth it

## 1 example : standalone nodejs app
    just nodejs no database,nothing else
    1 image and container

    possible deployment approch 
    install docker on a remote host (via ssh ) push and pull image, run container based on image on remote host

## deploy to aws EC2

    AWS EC2 is  service that allows you to spin up and manageyour own remote machine
    1. create and launch EC2 instance , VPC and security group 
    2. configure security group to expose all required ports ot www 
    3. connect to instance (ssh) install Docker and run container


## simple nodejs 

    docker build -t node-dep-example .
    // build image from files from this directory
    docker run  -d --rm --name node-dep -p 80:80 node-dep-example

## bind Mount, volumes & copy 
    // here in production we will not use any bound mount 

## in Development
    - container should encapsulate the run time environment but not necessary the code 
    - Use "Bind mount" to provide your local host project files to the running container 
    - Allow for instant update Without restarting the container 
## in Production
    - image /container is the single source of truth
    - A Container should really work standalone , you should not have source code on your remote machine 
    - use copy to copy the code snapshot into the image 
    - Ensure that every image runs without any extra , surrounding configuration code

## amazon EC2 instance 

    sudo yum update -y 
    sudo amazon-linux-extras install docker
    // install docker in ec2 instance
    sudo service docker start
## deploy source code vs image 

    option1. deploy source code (unnecessary complexity)
        Build image on remote machine 
        push source code to remote machine , run docker build and then docker run
    option2. Deploy Build image (avoid unnescessary remote server work)
        Build image before deploymnet (on local machine)
        just execute docker run
## build container ./7.nodejs

    docker build -t node-dep-example-1 .

    docker tag node-dep-example-1 academind/node-example-1 
    // create name for this 
    docker push academind/node-dep-example-1
    docker login

    // run the  container
    docker run -d --rm -p 80:80 academind/node-example-1

## update docker image 
    // change some thing in source 
    docker build -t node-dep-example-1 .
  docker tag node-dep-example-1 academind/node-example-1 
    // create name for this 
    docker push academind/node-dep-example-1

    // now in ec2 instance 
    docker pull academind/node-example-1
    docker stop [previouscontainer ]
    docker run -d --rm -p 80:80 academind/node-example-1

## a managed / automated approch
    // aws ec2 
    // your own remote machine 
    // you need to crearte them , manage them update , monitor ,scale them etc
    // great if your a cloud expert

    // aws ecs 
    // creation , management update is handled automatically monitor them and scale is simplified
    great if you simply want to deploy your app/ container

##  in nodejs backend when useing  aws ecs 
    // dont use container name as ip 
    // in nodejs set environtment variable 
    // use `process.env.MONGODB_URL`
    // in '.env' `MONGODB_URL=mongodb`

    // in aws ECS  instance we can use `localhost` to communicate with containers 

## current archetechture
    - AWS ECS
        - ECS Task
    - aws load balance 
        -nodejs rest api
        -mongodb 
        - volume : AWS EFS Storage 

## 2nd architecture
    - AWS ECS
        - ECS Task
    - aws load balance 
        -nodejs rest api
    -mongodb (mongo Atlas) 
        - mongodb connected with backend

## final architechture
    - AWS ECS
        - ECS Task
    - aws load balance 
        -react frontend
        -nodejs rest api (connected with atlas mongo    )
    
    -mongodb (mongo Atlas) 
        - mongodb connected with backend