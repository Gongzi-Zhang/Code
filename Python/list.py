#!/usr/bin/python

# Lists are analogous to arrays in other languages.
#+ But, python lists are far more flexible, they can hold any 
#+ combination of data types within a list

mylist = ['Hello', 12, 23.5 ]
mylist[0]       # 'Hello'
mylist[-1]      # 23.5
mylist[0:2]     # 'Hello', 12
mylist[:]       # all elements
mylist[::2]     # start from 0, step by 2, until the end: 'Hello' 23.5
mylist[::-1]    # reverse list
mylist[2] = "New String"  # ['Hello', 12, 'New String']
len(mylist)     # 3

numlist = [1.2, 3.5, 33, 65]
numlist * 2   # [1.2, 3.5, 33, 65, 1.2, 3.5, 33, 65] 
numlist + numlist   # [1.2, 3.5, 33, 65, 1.2, 3.5, 33, 65] 

# frequently used methods
mylist.append("World")
mylist.extend(iterable)
mylist.remove(x)   # remove the first item from the list whose value ie equal to x, it raises a ValueError if there is no such item
mylist.insert(1, "macro")
mylist.index(12)    # 2
mylist.pop([i])     # remove the item at the given position
mylist.pop()        # remove the last item
mylist.popleft()
mylist.clear()  == del a[:]      # remove all items
mylist.index(x[, start[, end]])
mylist.count(x)
mylist.sort(key=None, reverse=False)
mylist.reverse()
mylist.copy()

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

# unpack list
args = [3, 6]
range(*args)        # 3 4 5


# loop techniques
for i, vin enumerate(['tic', 'tac', 'toe']):
    print(i, v)

questions = ['name', 'quest', 'favorite color']
answers = ['lancelot', 'the holy grail', 'blue']
for q, a in zip(questions, answers):
    print('What\'s your {0}? It is {1}.'.format(q, a))
