#!/usr/bin/env  python3
# -*- coding: utf-8 -*-
import os
from math import pi
import numpy as np
from matplotlib import pyplot as plot

print("Hello, World!")

# primitive data type
x = None        # Nonetype
x = True        # bool
x = False
x = 1           # int
x = 1.          # float
x = "Hello, World"  # str

del x

# data structure
myList = [1, 2, 3]
myList = ["hello", "world"]
myList = [1, 2, "hello"]
myList = [1, [2, "hello"]]

mytuple = (1, 2, 3, 2)

myset = {1, 2, 3, 2}

mydic = {1:"hello", 2:"world"}

# list comprehension
[(x, y) for x in [1, 2, 3] for y in [3, 1, 4] if x != y]

# which equivalent to:
combs = []
for x in [1, 2, 3]:
    for y in [3, 1, 4]:
        if x != y:
            combs.append[(x, y)]


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
    ...

if expr1 or expr2:
    ...

if not expr:
    ...

# control flow
if something:
    ...
elif another:
    ...
else:
    ...

while something:
    ...

for i in a_list:
    ...

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
