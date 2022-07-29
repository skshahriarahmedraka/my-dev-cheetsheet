FROM node:16 as build

ENV NODE_ENV=production 

# install dependencies
WORKDIR /app
COPY . .
COPY package.json package-lock.json svelte.config.js ./
RUN npm run build 

# Copy all local files into the image.

# RUN npm run build

###
# Only copy over the Node pieces we need
# ~> Saves 35MB
###
FROM node:16-alpine3.15

WORKDIR /app
COPY --from=build /app .
# COPY . .


EXPOSE 3000
CMD ["node", "./build/index.js"]

# sudo docker run -p 3000:3000 sveltekit:latest