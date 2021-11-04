IMAGE_NAME = golang-test #docker image name
IMAGE_VERSION = 0.1 #this value tags the docker image

all: build #default command build the project

.SILENT: run clean #these commands run silently

# DEVELOPMENT OPERATIONS

build:
	go build -o bin/main main.go
	
run:
	go run main.go

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