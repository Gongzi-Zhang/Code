#!/usr/bin/python
import sys

# input
## input from stdin
ip = raw_input("Enter word :")
x = int(input("Please enter an integer: "))

## sys.stdin
count = 0
for line in sys.stdin:
    for word in line.lower().translate(None, ',.()"\'').split():
        if word == sys.argv[1]:
            count += 1
print(count) # count the occurence of a word

## file input
#+ the open() built-in is used to open a file for reading or writing.
#+ if it succeeds, it return a file object.
ifile = open(sys.argv[1], 'r')
for line in ifile:
    cols = line.split()
    if "C" in cols[0]:
        print(line, end = ',') 

ifile.close()

### open mode
#+ 'r' for reading
#+ 'w' for writing
#+ 'rw' for both

# output
print( "Prepare-commit-msg: File: %s\nType: %s\nHash: %s" % (filepath, type, hash) )
a, b = 0, 1
while b < 1000:
    print(b, end=',')   # the 'end' argument can be used to avoid the '\n'
    a, b = b, a+b       # after the output
