#/usr/bin/python

map(function, iterable, ...)
"""
    Apply function to every item of iterable and return a list of results.
If more than one iterable is passed, function must take that many arguments
and is applied to the items from all iterables in parallel; if one iterable
is shorter than others, than none item is assumed.
"""
def add100(x):
    return x+100

a=[1, 2, 3]
b=map(add100, a)
print b


def abc(a, b, c):
    return a*10000+b*100+c

list1 = [1, 2, 3]
list2 = [10, 20, 30]
list3 = [100, 200, 300]
b = map(abc, list1, list2, list3)
print b
