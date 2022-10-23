FROM node:latest 

WORKDIR /app 

COPY package.json /app 

# here . is same as /app

RUN npm install 

COPY . .

EXPOSE 5000

CMD ["node", "server.js"]