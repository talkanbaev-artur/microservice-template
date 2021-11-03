all: build

.SILENT: run clean

build: 
	go build -o bin/main main.go
	
run:
	go run main.go

clean: 
	rm -f bin/main