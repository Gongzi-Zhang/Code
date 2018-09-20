#!/usr/bin/python

# Tuples are a sequence type just like Lists and strings. Tuples are 
#+ created by separating values with commas and enclosing them in 
#+ parentheses. A trailing comma is necessary when creating a tuple 
#+ of one element so that python does not interpret it as an 
#+ expression. 

# As string, tuple is an immutable type.

mytuple = (1, 4.5, "World")
print mytuple   # (1, 4.5, ’World’)
print mytuple[2]    # World
mytuple[1] = 23 # TypeError: ’tuple’ object does not support item assignment
not_a_tuple = (24)
print not_a_tuple   # 24
a_tuple = (24,)     # note the trailing comma
print a_tuple   # (24,)


# unpacking 
t = 12345, 54321, 'hello'
x, y, z = t     
# sequnce unpacking requires that there are as many variables on the left side of the equals sign as there are elements in the sequence
