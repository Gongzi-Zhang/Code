#!/bin/python

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
