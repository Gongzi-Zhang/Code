#!/usr/bin/python

# Sets are a sequence type that is unordered and does not have 
#+ duplicates. Sets are mutable and elements can be added to an 
#+ existing set. But if a set already has an identical element, a 
#+ duplicate is not added. Sets are created by passing a sequence 
#+ type to the set() built-in function.
mylist = [1, 3, 4, 1, 'wordA', 'wordB', 'wordA']
mytuple = ('wordC', 4.5, 77, (1,2), 12, (1,2))
mystring = "queue"
print mylist    # [1, 3, 4, 1, 'wordA', 'wordB', 'wordA']
print mytuple   # ('wordC', 4.5, 77, (1, 2), 12, (1, 2))
print mystring  # queue
myset = set(mylist)
print myset     # set([1, 3, 4, 'wordA', 'wordB'])
myset = set(mytuple)
print myset     # set([4.5, (1, 2), 12, 77, 'wordC'])
myset = set(mystring)
print myset     # set(['q', 'e', 'u'])

# Sets support set operations such as union, intersection, difference 
#+ and symmetric difference. The operators are
'''
−
  Difference. Returns elements that are in one set but not in the 
  other
|
  Logical OR. Elements in either one set or the other.
&
  Logical AND. Elements that are in both sets.
^
    Logical Exclusive OR. Elements in either set but not both.
'''
mysetA = set(['apple', 'mango', 'strawberry'])
mysetB = set(['mango', 'pears', 'grapes'])
print mysetA - mysetB   # set(['strawberry', 'apple'])
print mysetB - mysetA   # set(['pears', 'grapes'])
print mysetA | mysetB   # set(['strawberry', 'mango', 'apple', 'grapes', 'pears'])
print mysetA & mysetB   # set(['mango'])
print mysetA ^ mysetB   # set(['strawberry', 'pears', 'grapes', 'apple'])
