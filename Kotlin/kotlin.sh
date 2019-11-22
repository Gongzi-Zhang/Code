#!/bin/bash

# kotlin compiler
## compiler a standalone exectuable
kotlinc hello_world.kt -include-runtime -d hello_world.jar
java -jar hello_world.jar

## compile a library that doesn't contain the runtime 
kotlinc hello_world.kt -d hello_world.jar
kotlin -classpath hello_world.jar Hello_WorldKt	    # Hello_WorldKt is the main class name that kotlinc generated for source file hello_world.kt



# interactive shell (REPL)
kotlinc-jvm
