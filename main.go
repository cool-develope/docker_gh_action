package main

import (
	"fmt"

	"github.com/cool-develope/docker_go_private/add"
)

func main() {
	x, y := 100, 200
	fmt.Printf("Add: %d + %d = %d\n", x, y, add.Add_two_numbers(x, y))
}
