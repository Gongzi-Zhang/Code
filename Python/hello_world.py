#!/usr/bin/env  python3
# -*- coding: utf-8 -*-
import os
import math
import numpy as np
from matplotlib import pyplot as plot
import decimal
import fractions

print("Hello, World!")

# primitive data type
x = None        # Nonetype (truth value: false)

x = NotImplemented  # NotImplemented (truth value: true)

x = True        # bool
x = False

x = 1           # int
x = 1.          # float
x = 1_000       # 1000; support after python3
x = 3.14e-10
x = 4E210
x = 4.0e+210
x = float("inf")
x = float("-inf")
1e500 == float("inf")
x = float("nan")    # not a number
x = 0o177           # octary
x = 0x9ff           # hexadecimal
x = 0X9FF           # hexadecimal, capital letter
x = 0b101010        # binary
x = hex(10)         # convert from decimal to hexadecimal
x = hex(0b1010)     # convert from binary to hexadecimal
x = hex(0o12)       # convert from binary to hexadecimal
x = oct(10)         # convert to octary
x = bin(10)         # convert to binary
x = 1 + 2j          # complex
x = 1 + 2J          # complex
x = decimal.Decimal('1.0')  # precise decimal
x = fractions.Fraction(4, 6)    # precise fraction: 4/6
x = math.pi
x = math.e

x = "Hello, World"  # str
x = 'x' * 1_00      # 'xxxx...xxx':  100 'x'
x = r'raw\string'   # raw str: treat backslash as literal
x = R'raw\string'   # raw str
x = r"\""           # result in two char raw string: \"
# x = r"\"          # raw string can't end with single backslash
x = f'formated string'  # formated string
x = b'hello'        # bytes type
x = '\u00A9'

x, y = y, x     # exchange
t = 1, 2.4, 'hello'
x, y, z = t

del x, y, z, t

## comparison
.1 + .1 == .2
.1 + .1 + .1 != .3

(1, 2, 3)   < (1, 2, 4)
[1, 2, 3]   < [1, 2, 4]
'z' > 'a' > 'Z' > 'A' > '9' > '1' > '0'
'ABC' < 'C' < 'Pascal' < 'Python'
(1, 2, 3, 4)    < (1, 2, 4)
(1, 2)      < (1, 2, -1)
(1, 2, 3)   == (1.0, 2.0, 3.0)
(1, 2, ('aa', 'ab'))    < (1, 2, ('abc', 'a'), 4)

# data structure
myList = list(1, 2, 3)
myList = [1, 2, 3]
myList = ["hello", "world"]
myList = [1, 2, "hello"]
myList = [1, [2, "hello"]]

print myList[0]
print myList[-1]
print myList[0:2]


myIter = iter(myList)
next(myIter)


myTuple = tuple(myList) # unmutable list
myTuple = (1, 2, 3, 2)
myTuple = (1, 2, 'hello', 2)



mySet = set('sjlncljeandg;ds')  # uniq list
mySet = {1, 2, 3, 2}
mySet = {1, 'hello', 1.5, 2, 2, 3}  # set is not subscriptable


for item in myList:
    print(item)

for i, item in enumerate(myTuple):
    print('{0} --> {1}'.format(i, item))


mydic = {1:"hello", 2:"world"}
myinfo = [('name', 'shred'), ('phone', 998746)]
mydic = dict(myinfo)
mydic = dict(start=1, end=10, step=2)   # keyword arg.

for key in (**mydic):
    print(key, mydic[key])

for k, v in mydic.items():
    print(k, v)


# list comprehension
[(x, y) for x in [1, 2, 3] for y in [3, 1, 4] if x != y]    # list
[i:i**2 for i in range(10)] # dict.



for item in zip(keys, values):
    ...

# generator; yield
def reverse(data):
    for index in range(len(data)-1, -1, -1):
        yield data[index]

# generator expression
sum(i*i for i in range(10))

# logical expression
if expr1 and expr2:
    expr1 && expr2
    ...

if expr1 or expr2:
    expr1 || expr2
    ...

if not expr:
    !expr1
    ...

if a is b:
    ...

# control flow
if something:
    ...
elif another:
    ...
else:
    ...

while something:
    continue

for i in a_list:
    break

x if y else z


try:
    do something here
except ValueError:
    do something for this error
except NameError:
    do something for another error
except:
    default error process
else:
    what to do when no exception
finally:
    end of try statement, will always be executed

# function
def myfun():
    ...

def myfun(arg1, arg2, kwarg="default_value"):
    ...

def myfun(arg1, arg2, kwarg="default_value", *varied_arg):
    ''' varied arguments with *arg'''
    ...

def myfun(arg1, arg2, arg="default_value", *varied_args, **varied_kwargs):
    ''' varied arguments with varied args: *varied_args and varied keyword args: **varied_kwargs'''
    for arg in *varied_args:
        print(arg)

    for key in **varied_kwargs:
        print(key, varied_kwargs[key])


def myfun(arg1:int, arg2:str) -> str:
    ...

@decorator_function
def myfun():
    var = "value"
    def do_local():
        var = "local value"

    def do_nonlocal():
        nonlocal var = "non local value"

    def do_global():
        global var = "global value"

    print(var)                      # value
    do_local()
    print("Do local: ", var)        # local value
    do_nonlocal()
    print("Do non local: ", var)    # non local value
    do_global()
    print("Do global: ", var)       # non local value

# context
with open("file.txt", "r") as f:
    ...

# class
class myclass:
    ''' An example class '''
    data_attribute = 12345

    # 'private' data: convention: begin with _
    __pseudo_private = "Hello"

    def __init__(self):
        self.data = "hello"
        self.index = len(data)

    def method(self, arg):
        ''' a method is also an attribute, myclass.method return a function object'''
        self.data = arg

    # 'private' method:
    __pseudo_private_method = method


    def __iter__(self):
        ''' return a object with __next__ method '''
        return self

    def __next__(self):
        ''' for iterator prupose '''
        if self.index == 0:
            raise StopIteration
        self.index = self.index - 1
        return self.data[self.index]

    def __delete(self):
        del self.data

x = myclass()
x.__doc__       # implicit attribute: An example class
x.__class__     # implicit attribute: type
x.method        # this is a method object
myclass.method  # this is a funciton object

class derivedClass (baseClass1, baseClass2):
    ...
