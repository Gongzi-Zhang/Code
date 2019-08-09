'''
Iterable is a sequence of data, one can iterate over using a loop.
An iterator is an object adhering to the iterator portocol.
Basically this means that it has a "next" method, which, when called
returns the next item in the sequence, and when there's nothing to
return, raise the StopIteration exception.
'''
'''
Why is iterator useful. When an iterator is used to power a loop, the loop
becomes very simple. The code to initialise the state, to decide if the loop 
is finished, and t ofind the next value is extracted into a separate place,
therefore highlighting the body of the loop.
'''

'''
Calling the __iter__ method on a container to create an iterator 
object is the most straightforward way to get hold of an iterator.
The iter function does that for us. Similarly, the next function
will call the __next__ method of the iterator.
'''
