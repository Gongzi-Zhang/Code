#!/bin/bash

############################################
# input and output of bash
############################################


# redirection
exec 1>/dev/null
echo "Hello World"

read -p "what's your name?"
echo "your name is: $REPLY"
