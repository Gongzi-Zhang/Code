'''
small anonymous functions, it can be used whereever function objects
are required. They are syntactically restricted to a single 
expression. Semantically, they are just syntactic sugar for a 
normal funciton definition.
'''
def make_incrementor(n):
    return lambda x: x + n

f = make_incrementor(42)
f(0)    # 42
f(1)    # 43


pairs = [(1, 'one'), (2, 'two'), (3, 'three'), (4, 'four')]
pairs.sort(key=lambda pair: pair[1])
