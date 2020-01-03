#!/bin/bash

# one line solution using perl
perl -ne 'print ((0 == $. % N) ? $_ : "")' file	# print every Nth line
perl -ne 'print neless ($. % 4)' file
sed -n '0~4p' file

perl -pe 's/bar/baz/' file  # substitution
sed -i 's/bar/baz/' file
