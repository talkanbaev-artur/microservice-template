# Golang microservice template for SEA AUCA club

Version: 0.1.0

This template is widely used in learning the service development in SEA club ecosystem, and is a basis of AU cloud services' structure.

## How to use this template

1. Clone this repo - `git clone https://github.com/sea-auca/microservice-template.git`
2. Edit `go.mod` file - change the name of the service (like `sea-auca/my_service`)
3. Use the documentation and structure advises from below - **this is the step for building your service**
4. Change this file according to the specified *readme* recommendations. 
5. Edit your `Dockerfile` accordingly to your service's needs
6. Deploy!

### Development opeartions

This is a section which suggests useful tools for devlopment and standatises the workflow.

1. Use `make` to create a working build of your program
2. Use `make run` instead of `go run` - edit all your environment setup and default inputs in the `Makefile`
3. Use `make package` to create a docker container using the docker file

TODO:
* Add documentation standards
* Add basic libraries standards
* Add directory standard
* Add code style standard