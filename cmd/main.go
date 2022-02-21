package main

import (
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
)

func greet(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	fmt.Fprintf(w, "Hello World! Your route is %s", vars["key"])
}

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/{key}", greet)

	http.ListenAndServe(":8000", r)
}
