#!/usr/bin/python3

''' Classes partake of the dynamic nature of Python: they are created at runtime and can be modified after creation.  '''

class MyClass():
    name = "Wukong"
    def __init__(self, name):   # constructor
        self.name = name 

    def show(self):
        print "Welcome to here, my friend: ", self.name

    def __delete__(self):       # destructor
        print 'Destructor Deleting object -' self.name

''' 
Most OO languages pass this as a hidden parameter to the methods 
defined on an object; Python does not. You have to declare it 
explicitly. When you create an instance of a class and call its 
methods, it will be passed automatically.
'''

a = MyClass("Carpie Diem")
print a.name
print MyClass.name

''' class method

A class method can be invoked without creating an instance of the 
class. When a normal method is invoked, the interpreter inserts the 
instance object as the first positional parameter: self. When a 
class method is invoked, the class itself is given as the first 
parameter, often called: cls '''


''' difference between method object and function object

When a non-data attribute of an instance is referenced, the 
instance's class is searched. If the name denotes a valid class 
attribute that is a function object, a method object is created by 
packing (pointers to) the instance object and the function object 
just found together in an abstract object: this is the method object.
When the method object is called with an argument list, a new 
argument list is constructed from the instance object and the 
argument list, and the function object is called with this new 
argument list.'''


''' Generally speaking, instance variables are for data unique to 
each instance and class variables are for attributes and methods 
shared by all instances of the class'''

class Dog:

    tricks = []             # mistaken use of a class variable

    def __init__(self, name):
        self.name = name

    def add_trick(self, trick):
        self.tricks.append(trick)

d = Dog('Fido')
e = Dog('Buddy')
d.add_trick('roll over')
e.add_trick('play dead')
d.tricks                # unexpectedly shared by all dogs
#> ['roll over', 'play dead']

# correct design:
class Dog:

    def __init__(self, name):
        self.name = name
        self.tricks = []    # creates a new empty list for each dog

    def add_trick(self, trick):
        self.tricks.append(trick)

d = Dog('Fido')
e = Dog('Buddy')
d.add_trick('roll over')
e.add_trick('play dead')
d.tricks
#> ['roll over']
e.tricks
#> ['play dead']

'''Data attributes may be referenced by methods as well as by 
ordinary users ("clients") of an object. In other words, classes 
are not usable to implement pure abstract data types. In fact, 
nothing in Python makes it possible to enforce data hiding — it is 
all based upon convention.'''


''' Inheritance
all methods in Python are effectively virtual. Derived classes can
override methods of their base classes. 
'''

''' attribute of instance method objects '''
m.__self__      # instance object with the method m()
m.__func__      # the function obejct corresponding to the method
