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

### reading
ifile.read()    # read all files
ifile.read(size)    # read specified quantity of data and return it as string (in text mode) or bytes object (in binary mode)
ifile.readline()    # read a single line, end='\n'
ifile.readlines()   # read all lines
list(f)             # read all lines

### writing
ifile.write('This is a new line\n')

ifile.tell()    # current position: number of bytes from the beginning of the file (in binary mode); an opague number (text mode)

ifile.seek(offset, from_what=0)
## from_what:
#+ 0:   beginning 
#+ 1:   current position
#+ 2:   end
## in text mode, only only seeks relative to the beginning of the file are allowed

f = open('workfile', 'rb+')
f.write(b'0123456789abcdef')
f.seek(5)       # 5
f.read(1)       # b'5'
f.seek(-3, 2)   # 12
f.read(1)       # b'd'
ifile.close()

### open mode
#+ 'r' : reading
#+ 'w' : writing
#+ 'a' : appending
#+ 'b' : binary
#+ 'rw', 'r+' for both

# output
print( "Prepare-commit-msg: File: %s\nType: %s\nHash: %s" % (filepath, type, hash) )
a, b = 0, 1
while b < 1000:
    print(b, end=',')   # the 'end' argument can be used to avoid the '\n'
    a, b = b, a+b       # after the output



# formatting libraries
import reprlib
''' abbreviated displays of large or deeply nested containers'''

import pprint
'''print objects in a way that is readable by the interpreter'''

import textwrap
'''format paragraphs of text to fit a given screen width'''

import locale
'''cultrue specific data formats'''


# logging 
import logging
'''log messages are sent to a file or to sys.stderr'''
logging.debug('Debugging info')
logging.info('Informational message')
logging.warning('Warning: config file %s not found', 'server.conf')
logging.error('Error occurred')
logging.critical('Critical error -- shutting down')
