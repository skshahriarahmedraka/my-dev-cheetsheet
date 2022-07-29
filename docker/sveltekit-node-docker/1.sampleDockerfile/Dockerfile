FROM node:16 as build


# create a working directory 
WORKDIR /app


# Copy all local files into the image.
COPY . .

# clean install all dependencies
RUN npm ci



### 2nd stage
FROM node:16
# create a working directory 
WORKDIR /app

# copy your project file from build stage 
COPY --from=build /app .

# expose port from public access
EXPOSE 3000

# run index.js file
CMD ["node", "./build/index.js"]


