'''
In many ways the object returned by range() behaves as if it is a list, but in
fact it isn't. It is an object which returns the successive items of the
desired sequence when you iterate over it, but it doen't really make the list,
thus saving space.

We say such an object is iterable, that is, suitable as a target for functions
and constructs that expect something from which they can obtain successive
items until the supply is exhausted. The "for" statement is such an iterator.
'''
for i in range(5):
    print(i)    # 0 1 2 3 4 

print(range(5)) # range(0, 5)
