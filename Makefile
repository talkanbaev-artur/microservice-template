#docker image name
IMAGE_NAME = golang-test
#this value tags the docker image
IMAGE_VERSION = 0.1

all: build #default command build the project

.SILENT: run clean #these commands run silently

# DEVELOPMENT OPERATIONS

build:
	go build -o bin/main main.go
	
run:
	go run main.go

#Run docker image on host network
drun: image
	docker run --name $(IMAGE_NAME) --network=host -d $(IMAGE_NAME):latest
# PRODUCTION BUILDS

#create image and tag it as latest
image: mod_tidy create_docker tag_latest

create_docker:
	docker build --tag $(IMAGE_NAME):$(IMAGE_VERSION) .

tag_latest:
	docker image tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):latest

mod_tidy: #preparation step - in case of go.sum file is missing
	go mod tidy

# CLEANING

clean: 
	rm -f bin/main