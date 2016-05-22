package main

import (
	"flag"
	"net/http"

	"github.com/gorilla/mux"
)

var port *string

func init() {
	flag.StringVar(port, "port", "3000", "set app port")
}

func main() {
	r := mux.NewRouter()
	// Routes consist of a path and a handler function.
	r.HandleFunc("/", HelloWorldHandler)

	// Bind to a port and pass our router in
	http.ListenAndServe(*port, r)
}

// HelloWorldHandler is a HelloWorldHandler
func HelloWorldHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello World\n"))
}
