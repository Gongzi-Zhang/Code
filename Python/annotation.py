''' Function annotations
they are completely optional metadata about the types used by 
user-defined functions.
Annotations are stored in the __annotations__ attribute of the
function as a dictionary and have no effect on any other part of 
the funciton.
'''

# parameter annotation
def f(ham: str, eggs: str = 'eggs'):
    pass

# parameter annotation and return annotation
def f(ham: str, eggs: str = 'eggs') -> str:
    print("Annotations:", f.__annotations__)
    print("arguments:", ham, eggs)
    return ham + " and " + eggs

f('spam')
# Annotations: {'ham': <class 'str'>, 'return': <class 'str'>, 'eggs': <class 'str'>}
# Arguments: spam eggs
# 'spam and eggs'
