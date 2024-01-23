package main

import (
	"fmt"
	"golang.org/x/net/webdav"
	"log"
	"net/http"
	"os"
)

func main() {
	if len(os.Args) < 3 {
		fmt.Printf("%s <PORT> <DIRECTORY>\n", os.Args[0])
		os.Exit(1)
	}

	// Replace this path with the directory you want to share
	sharePath := os.Args[2]

	// Create a handler for the WebDAV server
	handler := &webdav.Handler{
		FileSystem: webdav.Dir(sharePath),
		LockSystem: webdav.NewMemLS(),
	}

	// Specify the host and port for the server
	host := "0.0.0.0" // Bind to all available network interfaces
	port := os.Args[1]

	// Set up the server
	server := &http.Server{
		Addr:    host + ":" + port,
		Handler: handler,
	}

	// Print a message indicating that the server is starting
	log.Printf("Starting WebDAV server on http://%s:%s", host, port)

	// Start the server
	err := server.ListenAndServe()
	if err != nil {
		log.Fatal("Error starting server: ", err)
	}
}
