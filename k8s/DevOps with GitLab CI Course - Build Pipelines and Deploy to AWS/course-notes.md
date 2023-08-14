# Introduction to GitLab CI & DevOps with AWS - Course Notes

## Unit 1 - Introduction to GitLab

### Lesson 1 - Welcome

- this course is for people new to DevOps who want to use GitLab to build, test and deploy their software
- you will get hands-on experience building pipelines with GitLab CI and deploying software to AWS

#### 📚 Resources
* [Stay THANK YOU for this course by subscribing on YouTube](https://www.youtube.com/@vdespa?sub_confirmation=1)
* [Join the DevOps newsletter](https://sendfox.com/lp/1x9k59)

### Lesson 2 - Your first GitLab project

- we will be using GitLab.com in this course
- create a free GitLab.com account
- by default, you will get a free trial, and your account will be downgraded to a free one after 30 days
- change the theme: Profile > Preferences > Syntax highlighting theme > Monokai
- Enable *Render whitespace characters in the Web IDE*
- GitLab CI pipelines are defined in a file called .gitlab-ci.yml
```
test:
   script: echo "Hello world"
```
- to run your pipeline using the GitLab.com infrastructure, you need to verify your account with a credit card
- validation troubleshooting:
    * Validation is stuck. Nothing happens. If the interface is stuck or loading after 2-3 minutes of waiting, open a new tab and return to your main project page. If you don't see the message that you need to validate your account, it could mean that the validation was successful. 

#### Update 3 June 2023: GitLab New Navigation

- recently GitLab has rolled out a new navigation
- to be able to follow along with the course, it recommend switching back to the old navigation

![GitLab New Navigation](old-new-nav.png)

#### 📚 Resources
* [How to set up your SSH key for GitLab on Windows 10](https://medium.com/devops-with-valentine/2021-how-to-your-ssh-key-for-gitlab-on-windows-10-587579192be0?sk=b836675d967a923ea81d911d73702629)
* [How to set up your SSH key for GitLab on macOS](https://medium.com/devops-with-valentine/2021-how-to-setup-your-ssh-key-for-gitlab-on-macos-dfccec6904fb?sk=fe992efb74d7bd794cf76bb8a26f0437)
* [How to set up your SSH key for GitLab on Linux](https://medium.com/devops-with-valentine/2021-how-to-your-ssh-key-for-gitlab-on-linux-1b94e2a3a49a?sk=1bca4bdb5c879f29be839aa42623113d)
* [Git for GitLab (Beginner's FULL COURSE)](https://www.youtube.com/watch?v=4lxvVj7wlZw)
* [How to Configure your own GitLab Runner with a Docker Executor on AWS EC2](https://medium.com/devops-with-valentine/how-to-configure-your-own-gitlab-runner-with-a-docker-executor-on-aws-ec2-d76c7be0660d?sk=fcb49b94811d5daeb5eb182e0afe467f)
* [How to Configure your own GitLab Runner with a Docker Executor on Windows 10 or Windows 11](https://medium.com/devops-with-valentine/setup-gitlab-ci-runner-with-docker-executor-on-windows-10-11-c58dafba9191?sk=b550a70c0a7a60f1a3250a53145a3541)


### Lesson 3 - Your first pipeline

- when we build and ship software, we need to follow a series of steps
- we define the GitLab CI pipeline using YAML
- a job can execute one or multiple commands
- `mkdir build` - creates a new folder called `build`
- `touch file.txt` - creates a new file called `file.txt`
- `>>` is called a redirection operator and appends the output from a previous command to a file
- `cat` can be used for displaying the contents of a file
- use Linux Alpine for this job because it is a very lightweight distribution
- if no stage is defined in the job config, the *test* stage will be assigned
- a pipeline is composed of a series of jobs organized in stages

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-1-03-.gitlab-ci.yml)
* [Alpine Linux](https://www.alpinelinux.org/)

### Lesson 4 - Help, my pipeline is not working

- here are some common mistakes that lead to errors in the jobs:
    * no space after `-`, like `-echo "Foo"`
    * bad indentation
    * forgetting to add column `:` after stages: , build: , script: 

#### 📚 Resources

* [Top 10 Most Common Errors In GitLab CI Pipelines](https://medium.com/devops-with-valentine/top-10-most-common-errors-in-gitlab-ci-ce5d206e8c03?sk=0b57f50bea597d3d97736fc90dac9d51)


### Lesson 5 - What is YAML?

- you need to know some YAML basics to write GitLab CI pipelines
- YAML is somewhat similar to JSON or XML
- XML, JSON and YAML, and human-readable data interchange formats
- YAML is being often used for storing configurations

### Lesson 6 - What is a shell?

- we typically run commands such as `echo`, `touch`, `mkdir`, `cat` and so on through a command-line interface or CLI
- to automate the building & releasing of software, we rely on tools that have no UI, so we need to use the CLI

#### 📚 Resources
* [How to setup a Linux environment on Windows](https://fixme)

### Lesson 7 - GitLab architecture

- at a minimum, the GitLab architecture contains the GitLab Server (also known as the coordinator) and a GitLab Runner
- the GitLab server manages the execution of the pipeline and its jobs and stores the results
- when a job needs to be executed, the GitLab server will find a runner to run the job
- a runner is a simple program that executes a job
- a working GitLab CI setup must have at least one runner, but there are often more of them to help distribute the load
- there can also be specific runners that have a particular software or hardware configuration (this is outside of the scope of this course)
- this is a simplified overview of the steps involved when a job is executed:
    * the GitLab server (coordinator) locates a GitLab Runner and sends instructions for running the job
    * the GitLab Runner will pull the Docker image specified in the job configuration  (or the default image if no Docker image is specified)
    * the GitLab Runner will start the Docker container
    * the GitLab Runner will get the files stored in the Git repository
    * the GitLab Runner run the commands from the `script` keyword inside the Docker container
    * the GitLab Runner report back to the GitLab server (coordinator) the results of the job execution
    * the GitLab Runner will terminate the Docker container

#### 📚 Resources
* [Docker in 100 Seconds](https://www.youtube.com/watch?v=Gjnup-PuquQ)
* [What is Docker](https://docs.docker.com/get-started/overview/)


### Lesson 8 - Pipeline stages

- by default, a job will be assigned to the *Test* stage
- if two or more jobs belong to the same stage, they will be executed in parallel
- the `stages:` keyword allows us to define the stages of the pipeline
- the keyword `stage:` allows us to associate a job with a stage

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-1-08-.gitlab-ci.yml)


### Lesson 9 - Why do pipelines fail?

- CLI programs indicate if their execution was successful or not by returning an exit code
- an exit code 0 will indicate that a program has been executed successfully 
- any other exit code, which can be from 1 to 255, indicates failure
- if GitLab detects a non-zero exit code, the job execution stops
- **Highly important tip:** reading the job logs from top to bottom is KEY to understanding WHY a job has failed


### Lesson 10 - Job artifacts

- every job is executed in a separate container, so by default, no files are shared
- to save the build results, we need to define the file(s) or folders as artifacts
- in GitLab, we do this by using the artifacts keyword:
```
build laptop:
    ...
    artifacts:
        paths:
            - build

```

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-1-10-.gitlab-ci.yml)


### Lesson 11 - Testing the build

- our goal is to automate both the build process and the test process
- currently, we are only testing the content of the file by downloading the job artifacts or by using the `cat` command
- to automate the testing process, we will use the `grep` command
- `grep` allows us to search for a specific string in a file.
```
        - grep "Display" build/computer.txt
```
- tests play a very important role in automation
- you need to "test" the tests, to ensure that they will fail if needed

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-11-.gitlab-ci.yml)

### Lesson 12 - Variables
- we prefer to use variables instead of repeating a string in the pipeline configuration
- variables can be defined in scripts or using the `variables:` keyword
- to reference the variable, we use the dollar sign before it
```
variables:
  BUILD_FILE_NAME: laptop.txt
```
- variables can be defined locally in the job or globally for all jobs
- when using spaces or some special characters, you may need to put the entire value between quotes

### Lesson 13 - What is DevOps

- DevOps is not a standard and does not have an universally agreed definition
- DevOps is not a standard or a tool, but a set of practices
- DevOps uses automation to that help us build successful Products
- DevOps requires a different mindset and works really well with Agile & Scrum

#### 📚 Resources

* [Introduction to Agile & Scrum](https://skl.sh/3LciAkr)


## Unit 2 - Continuous Integration with GitLab CI

### Lesson 1 - Unit overview

- we will start working on a simple website project
- we want to automate any of the manual steps required for integrating the changes of multiple developers
- we will create a pipeline that will build and test the software we are creating


### Lesson 2 - Your first GitLab project

- we will try to automate the build and deployment of a simple website project build with JavaScript using the React framework
- forking allows making a copy of a project
- the key to automation is to be familiar with the CLI tools we plan to use in GitLab CI

#### 📚 Resources

* [Website project (fork this)](https://gitlab.com/gitlab-course-public/freecodecamp-gitlab-ci)


### Lesson 3 - Building the project

- most software projects have a build step where code is compiled or prepared for production-use
- yarn is a Node.js package manager that helps with managing the project by running scripts and installing dependencies
- for a Node.js project, the `node_modules` folder contains all project dependencies
- project dependencies are installed using `yarn install` but are NOT stored in the Git repository
- it is really a bad idea to store project dependencies in the code repository
- image tags that contain `alpine` or `slim` are smaller in size as they use a lightweight Linux distribution

#### 📚 Resources

* [Official Node.js images on Dockerhub](https://hub.docker.com/_/node)
* [Check the current Node.js LTS version](https://nodejs.org/en/)
* [Yarn CLI documentation](https://yarnpkg.com/cli/)
* [Pipeline after this lecture](docs/pipeline-configs/lesson-2-03-.gitlab-ci.yml)


### Lesson 4 - Assignment

- Create a job to verify that the build folder contains a file named index.html
- Create another job that runs the project unit tests using the command yarn test


### Lesson 5 - Assignment solution

#### 📚 Resources

* [My solution to the assignment](docs/pipeline-configs/lesson-2-05-.gitlab-ci.yml)


### Lesson 6 - How do we integrate changes?

- we use Git to keep track of code changes
- we need to ensure we don't break the main pipeline

#### 📚 Resources

* [Git for GitLab](https://www.youtube.com/watch?v=4lxvVj7wlZw)


### Lesson 7 - Merge requests

- we need to ensure that the chances of breaking the main branch are reduced
- here are some project settings for working with Merge Requests that I recommend:
    * Go to Settings > Merge requests
    * Merge method > select *Fast-forward merge*
    * Squash commits when merging > select *Encourage*
    * Merge checks > check *Pipelines must succeed*
- protect the master by allowing changes only through a merge request: 
    * Settings > Repository > Branch main > Allowed to push - select *No one*

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-2-07-.gitlab-ci.yml)


### Lesson 8 - Code review

- merge requests are often used to review the work before merging it
- merge requests allow us to document why a specific change was made
- other people on the team can review the changes and share their feedback by commenting
- if you still need to make changes from the merge request, you can open the branch using the Web IDE

#### 📚 Resources

* [Real-world merge request example](https://gitlab.com/gitlab-org/gitlab/-/merge_requests/79236)


### Lesson 9 - Integration tests

- before we ship the final product, we try to test it to see if it works
- testing is done of various levels but high-level tests typically include integration and acceptance tests
- we use cURL to create an HTTP call to the website

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-2-09-.gitlab-ci.yml)


### Lesson 10 - How to structure a pipeline

- our current pipeline structure is just an example, not a rule
- there are a few principles to consider
- principle #1: Fail fast
    * we want to ensure that the most common reasons why a pipeline would fail are detected early
    * put jobs of the same size in the same stage
- principle #2: Job dependencies
    * you need to understand the dependencies between the jobs
    * example: you can't test what was not already built yet
    * if jobs have dependencies between them, they need to be in distinct stages


## Unit 3 - Continuous Deployment with GitLab & AWS

### Lesson 1 - Unit overview

- we will learn about deployments and take our website project and deploy it to the AWS cloud. 
- learn about other DevOps practices such as CI/CD

### Lesson 2 - A quick introduction to AWS

- AWS (Amazon Web Services) is a cloud platform provider offering over 200 products & services available in data centers all over the world
- you need an AWS account to continue with the rest of the course

#### 📚 Resources

* [Amazon Web Services](https://aws.amazon.com/)


### Lesson 3 - AWS S3

- the first AWS service that we will use is AWS S3 which stands for simple storage service
- the website is static and requires no computing power or a database
- we will use AWS S3 to store the public files and serve them over HTTP
- AWS S3 files (which AWS calls objects) are stored in buckets
- the name of the bucket needs to be unique
- the AWS console allows us to manually upload files through the web interface

### Lesson 4 - AWS CLI

- to interact with the AWS cloud services, we need to use a CLI tool called AWS CLI
- we will use AWS CLI v2 throughout the course
- when using Docker images in pipelines, I highly recommend specifying a tag or at least a major version (if available)
- if you don't specify a tag, at least log the version of every tool you use, as this can help with debugging later on
- example: `aws --version`

#### 📚 Resources

* [AWS CLI documentation](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/index.html)
* [AWS CLI on Dockerhub](https://hub.docker.com/r/amazon/aws-cli)
* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-04-.gitlab-ci.yml)


### Lesson 5 - Uploading a file to S3

- to upload a file to S3, we will use the copy command `cp`
- `aws s3 cp` allows us to copy a file to and from AWS S3 

#### 📚 Resources

* [AWS CLI for S3 documentation](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/index.html)
* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-05-.gitlab-ci.yml)


### Lesson 6 - Masking & protecting variables

- to define a variable, go to *Settings > CI/CD > Variables > Add variable*
- we typically store passwords or other secrets
- a variable has a key and a value
- it is a good practice to write the key in uppercase and to separate any words with underscores
- flags:
    * Protect variable: if enabled, the variable is not available in branches, apart from the default branch (main), which is a protected branch
    * Mask variable: if enabled, the variable value is never displayed in clear text in job logs

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-06-.gitlab-ci.yml)


### Lesson 7 - Identity management with AWS IAM

- we don't want to use our username and password to use AWS services from the CLI (I am not even sure if this is even possible!)
- as we only need access to S3, it makes sense to work with an account with limited permissions
- IAM allows us to manage access to the AWS services
- we will create a new user with the following settings:
    * account type: programmatic access
    * permissions: attach existing policy: AmazonS3FullAccess
- the account details will be displayed only once
- go to *Settings > CI/CD > Variables > Add variable* and define the following unprotected variables:
    * AWS_ACCESS_KEY_ID
    * AWS_SECRET_ACCESS_KEY
    * AWS_DEFAULT_REGION
- AWS CLI will look for these variables and use them to authenticate


### Lesson 8 - Uploading multiple files to S3

- using cp to copy individual files can take a lot of space in the pipeline config
- some file names are generated during the build process, and we can't know them in advance
- we will use sync to align the content between the build folder in GitLab and the S3 bucket

#### 📚 Resources

* [AWS S3 sync command documentation](https://awscli.amazonaws.com/v2/documentation/api/latest/reference/s3/sync.html)
* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-08-.gitlab-ci.yml)


### Lesson 9 - Hosting a website on S3

- files in the S3 bucket are not publicly available
- to get the website to work, we need to configure the bucket
- from the bucket, click on *Properties* and enable Static website hosting
- from the bucket, click on the *Permissions* tab and disable *Block public access*
- from the bucket, click on the *Permissions* tab and set a bucket policy

#### 📚 Resources

* [S3 bucket policy example](docs/s3-bucket-policy-example.json)


### Lesson 10 - Controlling when jobs run

- we don’t want to deploy to production from every branch
- to decide which jobs to run, we can use `rules:` to set a condition
- `CI_COMMIT_REF_NAME` gives us the current branch that is running the pipeline
- `CI_DEFAULT_BRANCH` gives us the name of the default branch (typically main or master)

#### 📚 Resources

* [GitLab reference for the .gitlab-ci.yml file - rules:](https://docs.gitlab.com/ee/ci/yaml/#rules)
* [Predefined variables in GitLab](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html)
* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-10-.gitlab-ci.yml)

### Lesson 11 - Post-deployment testing

- we will use `cURL` to download the index.html file from the website
- with `grep`, we will check to see if the index.html file contains a specific string

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-11-.gitlab-ci.yml)


### Lesson 12 - What is CI/CD?

- the pipeline goes through multiple stages: build, test & deploy
- right now, we consider the website hosted at AWS S3 our production environment
- quite often, pipelines will also have a staging environment
- a staging environment is a non-production, usually non-public environment that is very close to the actual production environment
- we often use automation to create these environments and to ensure that they are indeed identical
- we use a staging environment as a pre-production environment
- essentially, we try out our deployment in the pre-production environment
- CD can refer to two concepts:
    * Continuous Deployment - where every change is automatically deployed to production
    * Continuous Delivery - where every change is automatically deployed to staging but where we need some manual intervention to deploy to production


### Lesson 13 - Assignment

- create a staging environment and add it to the CI/CD pipeline


### Lesson 14 - Assignment solution

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-14-.gitlab-ci.yml)


### Lesson 15 - Environments

- every system where we deploy an application is an environment
- typical environments include test, staging & production
- GitLab offers support for environments
- we can define environments in *Deployments > Environments*

#### 📚 Resources

* [Predefined variables in GitLab](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html)
* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-15-.gitlab-ci.yml)


### Lesson 16 - Reusing configuration

- sometimes, multiple jobs may look almost the same, and we should try to avoid repeating ourselves
- GitLab allows us to inherit from an exiting job with the `extends:` keyword

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-16-.gitlab-ci.yml)


### Lesson 17 - Assignment

- the goal of this assignment is to expand the post-deployment tests to ensure that the correct version has been deployed
- add a file named `version.html` which contains the current build number
- the current build number is given by a predefined GitLab CI variable named `CI_PIPELINE_IID`

#### 📚 Resources

* [Predefined variables in GitLab](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html)


### Lesson 18 - Assignment solution

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-18-.gitlab-ci.yml)


### Lesson 19 - Continuous Delivery pipeline

- adding `when: manual` allows us to manually trigger the production deployment

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-3-19-.gitlab-ci.yml)


## Unit 4 - Deploying a dockerized application to AWS

### Lesson 1 - Section overview

- modern applications tend to be more complex, and most of them use Docker 
- we will build & deploy an application that runs in a Docker container

### Lesson 2 - Introduction to AWS Elastic Beanstalk

- AWS Elastic Beanstalk (AWS EB) is a service that allows us to deploy an application in the AWS cloud without having to worry about managing the virtual server(s) that runs it

### Lesson 3 - Creating a new AWS Elastic Beanstalk application

- when creating an EB app, choose the *Docker* platform and deploy the sample app
- AWS EB will use two AWS services to run the application:
    * EC2 (virtual servers)
    * S3 (storage)
- to deploy a new version, go to the environment in EB and upload the file in templates called `Dockerrun.aws.public.json`

#### 📚 Resources

* [Dockerrun.aws.public.json](templates/Dockerrun.aws.public.json)


### Lesson 4 - Creating the Dockerfile

- create a new file called `Dockerfile` in the root of the project
- add the following contents to it:
```
FROM nginx:1.20-alpine
COPY build /usr/share/nginx/html
```

#### 📚 Resources

* [Official build of Nginx on Dockerhub](https://hub.docker.com/_/nginx)


### Lesson 5 - Building the Docker image

- to build the Docker image, we will use the command `docker build`
- to build Docker images from a GitLab CI pipeline, we need to start the Docker Daemon as a service

#### 📚 Resources

* [docker build command reference](https://docs.docker.com/engine/reference/commandline/build/)
* [Docker in Docker (dind) on Dockerhub](https://hub.docker.com/_/docker)
* [Predefined variables in GitLab](https://docs.gitlab.com/ee/ci/variables/predefined_variables.html)
* [docker image ls](https://docs.docker.com/engine/reference/commandline/image_ls/)
* [Pipeline after this lecture](docs/pipeline-configs/lesson-4-05-.gitlab-ci.yml)


### Lesson 6 - Docker container registry

- to preserve a Docker image, we need to push it to a registry
- Dockerhub is a public registry with Docker images
- GitLab offers a private Docker registry which is ideal for private projects

#### 📚 Resources

* [docker login command reference](https://docs.docker.com/engine/reference/commandline/login/)
* [docker push command reference](https://docs.docker.com/engine/reference/commandline/push/)
* [Pipeline after this lecture](docs/pipeline-configs/lesson-4-06-.gitlab-ci.yml)


### Lesson 7 - Testing the container

- we want to test the container to see if the application running on it (web server) is working properly
- to start the container, we will use the `services:` keyword

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-4-07-.gitlab-ci.yml)


### Lesson 8 - Private registry authentication

- AWS EB requires authentication credentials to pull our Docker image
- GitLab allows us to create a Deploy Token that AWS can use to log to the registry
- to generate a Deploy Token, from your project, go to *Settings > Repository > Deploy tokens*.
- create a new Deploy Token with the following scopes:
    * read_repository
    * read_registry

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-4-08-.gitlab-ci.yml)

### Lesson 9 - Deploying to AWS Elastic Beanstalk

- a new deployment to AWS EB happens in two steps
- step 1: we create a new application version with `aws elasticbeanstalk create-application-version`
- step 2: we update the environment with the new application version with `aws elasticbeanstalk update-environment`

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-4-09-.gitlab-ci.yml)


### Lesson 10 - Post-deployment testing

- updating an EB environment does not happen instantly
- we will use `aws elasticbeanstalk wait` to know when the environment has been updated

#### 📚 Resources

* [Pipeline after this lecture](docs/pipeline-configs/lesson-4-10-.gitlab-ci.yml)

## Unit 5 - Conclusion


### Lesson 1 - Final assignment

- request access as a member to the project
- add your name to the list of people who have completed this course

#### 📚 Resources

* [Join the project](https://gitlab.com/gitlab-course-public/who-is-learning-gitlab-ci)
* [How to fix merge request conflicts](https://vdespa.medium.com/7f86bf79e58b?sk=b0fd024ce8ddc4a7c3b998be622ab10d)


### Lesson 2 - Conclusion

- THANK YOU for sticking until the end
- if this course was helpful and you have learned something new
- YOU can help me create more content like this one by subscribing to my YouTube channel

![Valentin saying thank you](docs/thank-you.png)


#### Fun facts about this project

* 🕐 150 hours of work (and counting)
* ☕️ 74 coffees
* ∞ amount of fun!

#### 💬 Let's stay in touch 

* [Stay THANK YOU for this course by subscribing on YouTube](https://www.youtube.com/@vdespa?sub_confirmation=1)
* [Join the DevOps newsletter](https://sendfox.com/lp/1x9k59)
* [Follow me on Twitter](https://twitter.com/vdespa)
* [Let's connect on LinkedIn](https://www.linkedin.com/in/vdespa/)

#### 📚 Offical GitLab resources

* [10 tips to make you a productive GitLab user](https://about.gitlab.com/blog/2021/02/18/improve-your-gitlab-productivity-with-these-10-tips/)
* [Here's how to do GitOps with GitLab](https://about.gitlab.com/blog/2021/10/21/gitops-with-gitlab/)
* [GitLab Infrastructure management](https://docs.gitlab.com/ee/user/infrastructure/)
