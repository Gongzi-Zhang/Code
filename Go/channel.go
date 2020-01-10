package main

import "fmt"

/*  by default, sends and receives block until the other side is ready. This allows goroutines to synchronize without explicit locks or condition variables
*/
func sum(s []int, c chan int) {
    sum := 0
    for _, v := range s {
	sum += v
    }
    c <- sum	// send value to channel
}

func main() {
    s := []int{7, 2, 8, -9, 4, 0}

    c := make(chan int)	// create channel
    go sum(s[:len(s)/2], c)
    go sum(s[len(s)/2:], c)
    x, y := <-c, <-c	// receive from channel


    // buffered channel
    ch := make(chan int, 2) // buffer length as 2
    ch <- 1
    ch <- 2 // sends to a buffered channel block only when the buffer is full, receives block when the buffer is empty


    // close a channel: only the sender should close a channel, never the receiver. Sending on a closed channel will cause a panic
    v, ok := <-ch   // test if a channel has been closed in receiver side using an extra variable
    for i := range c {}	// receives values from a channel until it is closed
    close(ch)

    // select: lets a goroutine wait on multiple communication operations; a select blocks until one of its cases can run; it chooses one at random if multiple are ready
    func fibonacci(c, quit chan int) {
	x, y := 0, 1
	for {
	    select {
	    case c <- x:
		x, y = y, x+y
	    case <-quit:
		fmt.Println("quit")
		return
	    default:
		fmt.Println("   .")
		time.Sleep(50 * time.Millisecond)
	    }
	}
    }

    c := make(chan int)
    quit := make(chan int)
    go func() {
	for i := 0; i<10; i++ {
	    fmt.Println(<-c)
	}
	quit <- 0
    }()
    fibonacci(c, quit)
}
