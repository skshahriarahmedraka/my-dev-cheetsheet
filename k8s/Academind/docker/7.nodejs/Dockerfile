FROM node:14-alpine

WORKDIR /app

COPY  package.json .

RUN npm install 
COPY . .
EXPOSE 80

ENV MONGODB_USERNAME=root
ENV MONGDB_PASSWORD=secret 
ENV MONGODB_URL=mongodb

CMD ["node","app.js"]


