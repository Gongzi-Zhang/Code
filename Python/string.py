#!/usr/bin/python
import os

# compare the index with list and Bash string.
mystring = "Hello, World"
    +---+---+---+---+---+---+---+---+---+---+---+---+
    | H | e | l | l | o | , |   | W | o | r | l | d |
    +---+---+---+---+---+---+---+---+---+---+---+---+
    0   1   2   3   4   5   6   7   8   9   10  11  12   
   -12 -11 -10 -9  -8  -7  -6  -5  -4  -3  -2  -1  
mystring[0] # H
mystring[-1] # d 
mystring[:7] # Hello, 
mystring[7:] # World
mystring[42] # error, too large index; HOWEVER
mystring[7:42] # World
mystring[42:] # ''
mystring[2] = 'x'   # error, strings are immutable
len(mystring) # 12

3 * 'um' + 'ium' # umumumium

# frequently used methods
mystring.split()
#+ The split() method of the string object returns a list in which 
#+ each element is a word split by whitespace.
mystring.translate(None, ',.()"\'')
#+ The translate() method of a string takes two arguments, the first 
#+ is a translation table for mapping one set of characters to
#+ another set, and the second argument is the set of characters to 
#+ delete from the string.

# change decimal into string
Max=11
for x in range(1, int(Max)+1):
    os.system("mkdir tmp/"+str(x))


# encoding method
# string and unicode are two classes derived from basestring, while string doesn't store encoding 
# method, if the string is a multitype string, it will be cut.  On the other hand, for unicode type,
# Python store and use them in UTF-8 format.
str1 = '这是一个str'    # string like char(ASCII) array in C
for ch in str1:
    print(ch),

# python2 output:    � � � � � � � � � � � � s t r
# python3 output:    这是一个str

str2 = u'这是一个str'
for ch in str2:
    print(ch),

# python2 output:    � � � � � � � � � � � � s t r
'这是一个字符串'.decode('utf-8')    # string to UNICODE
# u'\u8f9d\u662f\u4e00\u4e2a\u5b57\u7b26\u4e32'
u'这是一个字符串'.encode('utf-8')   # UNICODE to string
# '\xe8\xbf\x99\xe6\x98\xaf\xe4\xb8\x80\xe4\xb8\xaa\xe5\xad\x97\xe7\xac\xa6\xe4\xb8\xb2'


# formatted string
## f(F)
year = 2016; event = 'Referendum'
f'Result of the {year} {event}'     # Result of the 2016 Referendum
F'Result of the {year} {event}'     # Result of the 2016 Referendum
f'Result of the {year:6} {event}'   # Result of the 2016   Referendum
f'pi: {math.pi:.3f}'                # pi: 3.142

## .format
yes = 42_572_654; no = 43_132_495
percentage = yes / (yes + no)
'{:-9} YES votes    {:2.2%}'.format(yes, percentage) # ' 42572654 YES votes    49.67%'
'The story of {0}, {1}, and {other}.'.format('Bill', 'Manfred', other='Georg') # The story of Bill, Manfred, and Georg
table = {'Sjoerd': 4127, 'Jack': 4098, 'Dcab': 8637}

# access dictionary
'Jack: {0[Jack]:d}; Sjoerd: {0[Sjoerd]:d}; ' 'Dcab: {0[Dcab]:d}'.format(table)
'Jack: {Jack:d}; Sjoerd: {Sjoerd:d}; Dcab: {Dcab:d}'.format(**table)

## modifier
'''
    !a  ==> ascii()
    !s  ==> str()
    !r  ==> repr()
'''
# rjust, ljust, center. 
# zfill: pad numeric string on the left with zeros
for x in range(1, 11):
    print(repr(x).rjust(2), repr(x*x).rjst(3), end=' ')
    print(repr(x**3).rjust(4))
#  1   1    1
#  2   4    8
#  3   9   27
#  4  16   64
#  5  25  125
#  6  36  216
#  7  49  343
#  8  64  512
#  9  81  729
# 10 100 1000
animals = 'eels'
f'a animal: {animals}'      # a animal: eels
f'a animal: {animals !r}'   # a animal: 'eels'


# convert to string
s = 'Hello Wrold'
str(s)      # 'Hello World'
# the repr() of a string adds string quotes and backslashed.
repr(s)     #"'Hello Wrold'"
x = 32.5; y = 40000
repr((x, y, ('spam', 'eggs')))      # "(32.5, 40000, ('spam', 'eggs'))"

