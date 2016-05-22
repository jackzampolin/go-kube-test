package main

import (
	"flag"
	"fmt"
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

var port *string

func init() {
	port = flag.String("port", "8080", "set app port")
	flag.Parse()
}

func main() {
	r := mux.NewRouter()
	// Routes consist of a path and a handler function.
	r.HandleFunc("/", HelloWorldHandler)

	log.Printf("Listening on port :%v", *port)
	http.ListenAndServe(fmt.Sprintf(":%v", *port), r)
}

// HelloWorldHandler is a HelloWorldHandler
func HelloWorldHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello World\n"))
	log.Printf("GET / %v", http.StatusOK)
}
