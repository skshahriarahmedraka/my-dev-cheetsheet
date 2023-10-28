FROM golang:latest 

LABEL maintainer="raka <skshahriarahmedraka@gmail.com>"

WORKDIR /app 

COPY go.sum .

COPY go.sum .

RUN go mod download 

COPY . .

ENV PORT 8000 

RUN go build 

CMD ["./golang-mux-api"]

