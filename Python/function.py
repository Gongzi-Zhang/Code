#!/usr/bin/python

if __name__ = "__main__":
    do something here

# be careful with default real parameters
def foo(x=[]):
    x.append(1)
    print x

foo()   # [1]
foo()   # [1,1]
foo()   # [1,1,1]

'''
default values are evaluated when the function is defined, not when 
it is called. Be careful with mutable types
'''
bigx = 10
def double (x = bigx):
    return x*2

bigx = 1e9
double_it() # 20


''' Passing by value
Parameters to functions are references to objects, which are passed by value.
When you pass a variable to a function, python passes the reference to the 
object to thich the variable refers (the value), no the variable itself

If the value passed in a funciton is immutable, the function doesn't modify 
the caller's variable. If the value is mutable (e.x. list), the function may
modify the caller's variable in-place
'''
def try_to_modify(x, y, z):
    x = 23
    y.append(42)
    z = [99]
    print (x)
    print (y)
    print (z)

a = 77      # immutable value
b = [99]    # mutable value
c = [28]
try_to_modify(a, b, c)
# 23
# [99, 42]
# [99]
print(a)    # 77
print(b)    # [99, 42]
print(c)    # [28]

''' Variable number of parameters
Special forms of parameters:
    *args: any number of positional arguments packed into a tuple
    **kwargs: any number of keyword arguments packed into a dictionary
'''
def variable_args(*args, **kwargs):
    print('args is', args)
    print('kwargs is', kwargs)

variable_args('one', 'two', x=1, y=2, z=3)
# args is ('one', 'two')
# kwargs is {'y': 2, 'x': 1, 'z': 3}

''' Functions are first-class objects '''
va = variable_args
va('three', x=1, y=2)
# args is ('three')
# kwargs is {'y': 2, 'x': 1}


# a generator object can't be printed directly, but can be iterate through
a_generator = (item**2 for item in range(5))
print(a_generator)  # <generator object <genexpr> >
print(next(a_generator))    # 0
print(next(a_generator))    # 1

# item
# a list is not a generator, needed to be converted to be iterator func.
a_list_generator = iter(a_list)
print(next(a_list_generator))   # 0
print(type(a_list), type(a_list_generator)) # <class 'list'> <class 'list_iterator'>

# map
# map applies one function to one or more iterable objects, return a map object
print(map(abs, range(-4, 5)))   # <map object >
print(list(map(abs, range(-4, 5)))) # [4, 3, 2, 1, 0, 1, 2, 3, 4]
print(list(map(lambda x: x**2, range(5))))
print(list(map(lambda x, y: x**y, range(1, 5), range(1, 5))))

# reduce (library: functools)
# reduce element number by applying the function to all elements in a iterable objecti. 
# The last argument is the initial value, which is optional
print(reduce(lambda x,y: x+y, range(10)))   # 45
print(reduce(lambda x,y: x+y, range(10), 100))   # 145
print(reduce(lambda x,y: x+y, [[1, 2], [3, 4], [0]] ))  # [0,1,2,3,4]

# filter
# keep only those element which is judged to be true; pay attention to 0
# return filter object
print(filter(None, range(-4, 5)))   # <filter object>
print(list(filter(None, range(-4, 5)))) # [-4,-3,-2,-1,1,2,3,4,]
print(list(filter(lambda x: x>0, range(-4, 5)))) # [1,2,3,4,]

# all/any
# judge if all/any elements is true
print(all([0,1,2])) # False
print(any([0,1,2])) # True

# enumerate
# suitable for iteration of dictionary or tuple, which can tell you both index
# and value
for index, item in enumerate(range(5)):
    print("%d: %d" % (index, item))

# zip
# concatenate two or more iterable object to form new iterable objects
for a, b in zip([1, 2, 3], ["a", "b", "c"]):    # list is not a iterator ???
    print(a, b)     # 1 a \n 2 b \n 3 c


# Default argument value
''' The default values are evaluated at the point of function definition in
the defining scope. And the default value is evaluated only once. This makes a
difference when the default is a mutable object such as a list, dictionary, or
instances of most classes.
'''

def f(a, L=[]):
    L.append(a)
    return L

print(f(1)) # [1]
print(f(2)) # [1, 2]
print(f(3)) # [1, 2, 3]
''' if you don't want the default to be shared between subsequent calls, you
can write it as: '''
def f(a, L=None):
    if L is None:
        L = []
    L.append(a)
    return L
