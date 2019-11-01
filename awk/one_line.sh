#!/bin/bash

# extract the Nth line after a matching pattern
awk 'c&&!--c; /pattern/{c=N}' file
## which equals to
awk 'c!=0 && --c==0 {print}; /pattern/{c=N}' file

# print all records from some pattern:
awk '/pattern/{f=1}f' file
awk 'BEGIN{f=1}; f; /pattern/{f=0}' file    # print all records to some pattern

# print all records after some pattern:
awk 'f; /pattern/{f=1}' file

#  print every record except the Nth record after some pattern:
awk 'c&&!--c{next} /pattern/{c=N} 1' file

# print the N records after some pattern:
awk 'c&&c--; /pattern/{c=N}' file

# print every record except the N records after some pattern:
awk 'c&&c--{next} /pattern/{c=N}1' file

# print the N recrods from some pattern:
awk '/pattern/{c=N}c&&c--' file

# print file between /patten1/ and /pattern2/
awk '/pattern1/{c=1}; c; /pattern2/{c=0}' file	# including both pattern line
awk '/pattern1/{c=1; next}; c; /pattern2/{c=0}' file	# don't include the beginning pattern line
awk '/pattern1/{c=1}; c&&($0 !~ /pattern2/); /pattern2/{c=0}' file  # don't include the ending pattern line
awk '/pattern1/{c=1; next}; c&&($0 !~ /pattern2/); /pattern2/{c=0}' file  # don't include both
