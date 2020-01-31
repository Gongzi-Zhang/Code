#!/bin/bash

# ampersand can't be followed by semicolon; because both are command
# terminators, meaning bg and fg respectively.
# but bash doesn't allow empty commands; so &; is invalid (;; too)
for i in {1..10}; do echo $i &; done	# WRONG
for i in {1..10}; do echo $i & done	# CORRECT

