# we will take the long term release version of docker 
FROM node:14.15.4 

# we want to be a production image
ENV NODE_ENV=production 

# this is the directory  we will post the app
WORKDIR /app 

# copy the package.json and lockfile 
COPY ["package.json","package-lock.json","./"]

# perform an npm install to install dependency
RUN npm ci --production 


# set the user as node,  so we dont run as root 
USER node 

# set the user as node,so we dont run as root 
COPY src/. .

# start the server 
CMD ["node","server.js"]



