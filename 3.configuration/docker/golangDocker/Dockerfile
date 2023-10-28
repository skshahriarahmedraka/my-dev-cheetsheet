FORM golang:latest 

RUN makdir /build
WORKDIR /build 


RUN export GO111MODULE=on
RUN go get github.com/AdminTurnedDevOps/GoWebAPI/main
RUN cd /build && git clone https://github.com/AdminTurnedDevOps/GoWebAPI/main.git

RUN cd /build/GoWebAPI/main && go build

EXPOSE 8080 

ENTRYPOINT [ "/build/GoWebAPI/main/main" ]


