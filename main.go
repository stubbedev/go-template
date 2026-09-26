// Command go-template is the starting point for new Go projects.
package main

import "fmt"

func main() {
	fmt.Println(greet("world"))
}

func greet(name string) string {
	return "hello, " + name
}
