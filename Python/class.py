#!/usr/bin/python

''' class definition in python '''

class MyClass():
    name = "Wukong"
    def __init__(self, name):   # constructor
        self.name = name 

    def show(self):
        print "Welcome to here, my friend: ", self.name

    def __delete__(self):       # destructor
        print 'Destructor Deleting object -' self.name


''' 
Most OO languages pass this as a hidden parameter to the methods defined 
on an object; Python does not. You have to declare it explicitly. When you
create an instance of a class and call its methods, it will be passed 
automatically.
'''

a = MyClass("Carpie Diem")
print a.name
print MyClass.name
