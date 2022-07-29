# we will take the long term release version of docker 
FROM registry.access.redhat.com/ubi8/nodejs-14 as builder  

# we want to be a production image
ENV NODE_ENV=production 

# this is the directory  we will post the app
WORKDIR /app 

# copy the package.json and lockfile 
COPY ["package.json","package-lock.json","./"]

# perform an npm install to install dependency
RUN npm ci --production 

# set the user as node,  so we dont run as root 
USER 100

# set the user as node,so we dont run as root 
COPY src/. .

FROM quay.io/chrishayuk/nodejs-base:14.15.4-ubi-minimal

USER node 
COPY --from=builder  /app /app 
WORKDIR /app 

# start the server 
CMD ["node","server.js"]



