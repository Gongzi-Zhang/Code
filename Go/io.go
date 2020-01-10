package io

import (
    "fmt"
    "io"
    "strings"
    "os"
)

func main() {
    r := strings.NewReader("Hello, Reader!")

    b := make([]byte, 8)
    for {
	n, err := r.Read(b)
	fmt.Printf("n = %v err = %v b = %v\n", n, err, b)
	fmt.Printf("b[:n] = %q\n", b[:n])
	if err == io.EOF {
	    break
	}
    }
}


func file() {
    srcName := "src.txt"
    dstName := "dst.txt"
    src, err := os.Open(srcName)
    if err != nil {
	return
    }

    dst, err := os.Create(dstName)
    if err != nil {
	return
    }

    written, err := io.Copy(dst, src)
    dst.Close()
    src.Close()

    tty, err := os.OpenFile("/dev/tty", os.O_RDWR, 0)
    if err != nil {
	return nil, err
    }
}
