#!/bin/bash

# one line solution using perl
perl -ne 'print ((0 == $. % N) ? $_ : "")' file	# print every Nth line
perl -ne 'print neless ($. % 4)' file
