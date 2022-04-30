
## dockerize both app the python and node app

    1) create appropiate images for both apps (two separate images)
    2) lanch a container for each created image , making sure 
    that the app inside the container  works correctly  and is unable 
    3) re-recreate both containers and assign names to both containers . use these names to stop and restart container 
    4) clean up (remove) all stopped (and running) containers 
    5) Re-build the images - this time with names and tags assigned to them 
    6) run new container based on the re-buit images , ensure that containers are removed automatically when stoped. 
    
    1) sudo docker build .
    2) sudo docker run -p 5000:3000 [imageID]
    3) sudo docker run -it [imageID]
    4) sudo docker ps 
    5) sudo docker run -it --name pythonapp [imageID]
    6) sudo docker start 