'''
The act of altering a function or class object after it has been constructed
but before it is bound to its name is called decorating.
'''
@decorator
def fun():
    pass

'''
Decorator is intended to tweak the decorated object, not do something 
unpredictable. Therefore, when a function is decorated by replacing it with
a different funciton, the new function usually calls the original funciton,
after doing some preparatory work.
'''
def replacing_decorator_with_args(arg):
    print("defining the decorator")
    def _decorator(function):
        print("doing decoration, %r" % arg)
        def _wrapper(*args, **kwargs):
            print("inside wrapper, %r %r" % (args, kwargs))
            return function(*args, **kwargs)
        return _wrapper
    return _decorator

@replacing_decorator_with_args("abc")
def function(*args, **kwargs):
    print("inside function, %r %r" % (args, kwargs))
    return 14
# defining the decorator
# doing decoration, 'abc'
function(11, 12)
# inside wrapper, (11, 12) {}
# inside function, (11, 12) {}
# 14

# or, we can do it with a class way
class replacing_decorator_class(object):
    def __init__(self, arg):
        # this method is called in the decorator expression
        print("in decorator init, %s" % arg)
        self.arg = arg
    def __call__(self, function):
        # this method is called to do the job
        print("in decorator call, %s" % self.arg)
        self.function = function
        return self._wrapper
    def _wrapper(self, *args, **kwargs):
        print("in the wrapper, %s %s" % (args, kwargs))
        return self.function(*args, **kwargs)

deco_instance = replacing_decorator_class('foo')
# in decorator init, foo
@deco_instance
    def function(*args, **kwargs):
        print("in function, %s %s" % (args, kwargs))
# in decorator call, foo
function(11, 12)
# inside wrapper, (11, 12) {}
# inside function, (11, 12) {}


'''
When a new function is returned by the decorator to replace the original 
function, an unfortunate consequence is that the original function name, 
the original docstring, the original argument list are lost.
To transplanted these function attributes, set the following attributes for
the new returned funciton:
    __doc__, __module__ and __name__, __annotations__
This can be done automatically by using functools.update_wrapper
But the argument list is missing from the list of attributes that can be 
copied to the replacement funciton. The default values for arguments can be
modified through the __defaults__, __kwdefaults__ attributes, but 
unfortunately the argument list itself can't be set as an attribute.
'''
import functools
def replacing_decorator_with_args(arg):
    print("defining the decorator")
    def _decorator(function):
        print("doing decoration, %r" % arg)
        def _wrapper(*args, **kwargs):
            print("inside wrapper, %r %r" % (args, kwargs))
            return function(*args, **kwargs)
        return functools.update_wrapper(_wrapper, function)
    return _decorator

@replacing_decorator_with_args("abc")
def function():
    "extensive documentation"
    print("inside function")
    return 14
# defining the decorator
# doing decoration, 'abc'
function
print(function.__doc__)
# extensive documentation


''' Frequently used decorators '''
# classmethod       --> cause a method to become a 'class method'
class Array(object):
    def __init__(self, data):
        self.data = data

    @classmethod
    def fromfile(cls, file):
        data = numpy.load(file)
        return cls(data)

# staticmethod      --> make a method 'static'
# property          --> make a mehtod become a getter which is automatically called on attribute access
class A(object):
    @property
    def a(self):
        "an important attribute"
        return "a value"

A.a
# <property object at 0x...>
A().a
# 'a value'

'''
When the property decorator replaces the getter method with a property object.
this object in turn has three methods: getter, setter and deleter, which can 
be used as decorators
'''
# setter            --> setter decorator
class Rectangle(object):
    def __init__(self, edge):
        self.edge = edge

    @property
    def area(self):
        '''Compute area.

        Setting this updates the edge length to the proper value.
        '''
        return self.edge**2

    @area.setter
    def area(self, area):
        self.edge = area ** 0.5


