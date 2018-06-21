#!/usr/bin/python
import os

# compare the index with list and Bash string.
mystring = "Hello, World"
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
