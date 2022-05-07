package main

import (
	"fmt"
	"net/http"
)


func main() {
	fmt.Printf("hello\n")
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(r.URL.Path))
	})
	http.ListenAndServe(":8080", nil)
}