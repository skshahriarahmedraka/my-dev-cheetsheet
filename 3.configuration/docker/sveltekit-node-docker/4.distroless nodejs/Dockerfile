FROM node:18 AS build-env
ENV NODE_ENV=production 

COPY . /app
WORKDIR /app

RUN npm run build  

FROM gcr.io/distroless/nodejs:18
COPY --from=build-env /app /app
WORKDIR /app
EXPOSE 3000
CMD ["node", "./build/index.js"]