#!/usr/bin/python

# Lists are analogous to arrays in other languages.
#+ But, python lists are far more flexible, they can hold any 
#+ combination of data types within a list

mylist = ['Hello', 12, 23.5 ]
mylist[0]
mylist[0:2]   # all elements between 0 and 2, element 2 excluded.
mylist[::2]   # the even elements
mylist[::-1]  # reverse list
mylist[2] = "New String"  # ['Hello', 12, 'New String']
len(mylist)     # 3

numlist = [1.2, 3.5, 33, 65]
numlist * 2   # [1.2, 3.5, 33, 65, 1.2, 3.5, 33, 65] 
numlist + numlist   # [1.2, 3.5, 33, 65, 1.2, 3.5, 33, 65] 

# frequently used methods
mylist.append("World")
mylist.remove(12)
mylist.insert(1, "macro")
mylist.index(12)    # 2

# list comprehensions
# List comprehensions provide a concise way to write statements that 
#+ produce a list. A list comprehension consists of an expression 
#+ with a for statement within brackets. More for or if statments may 
#+ follow the initial for. 
powertwo = [2**i for i in range(10)]
powertwo = [2**i for i in range(10) if i%2 != 0]

# iterate through a list 
a = ['a', 'b', 'c', 'd', 'e']
for index, item in enumerate(a):
    print (index, item)
