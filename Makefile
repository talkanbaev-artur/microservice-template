IMAGE_NAME = golang-test
IMAGE_VERSION = 0.2

all: build

.SILENT: run clean

build: 
	go build -o bin/main main.go
	
run:
	go run main.go

image: mod_tidy create_docker tag_latest

create_docker:
	docker build --tag $(IMAGE_NAME):$(IMAGE_VERSION) .

tag_latest:
	docker image tag $(IMAGE_NAME):$(IMAGE_VERSION) $(IMAGE_NAME):latest


mod_tidy:
	go mod tidy

clean: 
	rm -f bin/main