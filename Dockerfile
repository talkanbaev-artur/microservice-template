#use small build environment
FROM golang:alpine as build 

#setup workdir
WORKDIR /app

#get dependencies
COPY go.mod ./
COPY go.sum ./
RUN go mod download

#copy the project
COPY *.go ./

#build
RUN go build -o /main

#Use deploy env
FROM alpine:latest

WORKDIR /

#Copy result
COPY --from=build /main /main

#Expose port 8000 - change in case of using other ports
EXPOSE 8000

ENTRYPOINT [ "/main" ]