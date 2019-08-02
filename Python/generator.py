#!/bin/python

'''
A generator is a function containing the keyword yield. 
It must be noted that the mere presence of this keyword completely
changes the nature of the function: this yield statement doesn't
have to be invoked, or even reachable, but causes the funciton
to be marked as a generator. When a normal function is called, 
all instructions contained in the body is executed. When a 
generator is called, the execution stops before the first 
instruction in the body. An invocation of a generaot creates a 
gneerator object,adhering to the iterator protocol.
When next is called, the function is exectued until the next yield
statement. Each encountered yield statement gives a value becomes
the return value of next. After executing the yield statement, the
execution of this function is suspended.
'''

'''
The main feature of generator is evaluating the elements on demand. 
When you call a normal function with a return statement the function 
is terminated whenever it encounters a return statement. In a function
with a yield statement the state of the function is saved from the 
last call and can be picked up the next time you call a generator
function
'''
'''
Because generator calculate element on demand, it doesn't store all
elements in cache, like a list. Therefore it is memory saving but 
time consuming compared to list.
'''
def my_gen():
    print("-- start --")
    yield 3
    print("-- middle --")
    yield 4
    print("-- finished --")

gen = my_gen()
'''
Contraty to a normal function call, where executing my_gen() will
immediately cause the first print to be executed, gen is assigned 
withoud executing any statements in the function body. Only when 
gen.next() is invoked by next, the statements up to the first yield
are exectued.
'''
next(gen)
# -- start --
# 3
next(gen)
# -- middle --
# 4
next(gen)
# -- finished --
# StopIteration

def my_gen():
    for x in range(5):
        yield x
# this equals to:
def my_gen():
    yield 0
    yield 1
    yield 2
    yield 3
    yield 4

my_gen  # <function.__main__.mygen>
my_gen()    # <generator object my_gen at 0x.....>
for i in my_gen():
    print(i)

'''
A generator is just a different way to create an iteraot object.
Everything that can be done with yield statements, could also be
done with next methods. Nevertheless, it make the definition of a 
iterable class much shorter, without writing the required next 
and __iter__ methods. So it is more like a syntatic suger
'''



'''
Generator expression allows creating a generator on a fly without a 
yield keyword. However, it doesn't share the whole power of generator
created with a yield funciton. The syntax and concept is similar to 
list comprehensions

'''
# a generator object can't be printed directly, but can be iterate through
a_generator = (item**2 for item in range(5))    # generator expression
a_list = [item**2 for item in range(5)]    # list comprehension
print(a_generator)  # <generator object <genexpr> >
print(next(a_generator))    # 0
print(next(a_generator))    # 1

# item
# a list is not a generator, needed to be converted to be iterator func.
a_list_generator = iter(a_list)
print(next(a_list_generator))   # 0
print(type(a_list), type(a_list_generator)) # <class 'list'> <class 'list_iterator'>

''' Bidirectinal communication 
using send() and throw() method to send argument value into the generator to
be used for the value of the yield expression
'''
import itertools
def my_gen():
    print("--start--")
    for i in itertools.count():
        print('--yielding %i--' % i)
        try:
            and = yield i
        except GeneratorExit:
            print('--closing--')
            raise
        except Exception as e:
            print('--yield raised %r--' % e)
        else:
            print('--yield returned %s--' % and)

it = g()
next(it)
# --start--
# --yielding 0--
# 0
it.send(11)
# --yield returned 11--
# --yielding 1--
# 1
it.throw(IndexError)
# --yield raised IndexError
# --yielding 2--
# 2
it.cloes()
# --closing--
''' Chaining generators 
yield from a subgenerator
'''
yield from some_other_generator()

