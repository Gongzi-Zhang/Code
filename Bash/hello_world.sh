#!/bin/bash

echo hello world

a=hello
a+=world
echo $a		# helloworld

# array
a=( "hello" "world" )
echo ${a[0]} ${a[1]}
echo $a	    # "hello"


# flow control
for (( local i=0; i<${#var}; i++ )); do
    ...
done


# func
function fun{
    ...
}

fun() {
    ...
}
