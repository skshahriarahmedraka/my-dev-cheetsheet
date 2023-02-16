FROM golang:latest as build 

WORKDIR /service 
ADD . /service

RUN cd /service && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /main .

CMD ["/main"]

# TEST 
FROM build as test 

# PRODUCTION

FROM alpine:latest as production

RUN apk --no-cache add ca-certificates
COPY  --from=build /main ./ 

RUN chmod +x /main

ENTRYPOINT ["/main"]

EXPOSE 8080