#!/usr/bin/python3

try:
    some codes
except(RuntimError, TypeError, NameError):
    exception handlers
except:
    default handler
else:
    print("something will be done if no exception")
finally:
    print("finally clause: do some clean-up actions")

# some exceptions
* SyntaxError
* ImportError
* NameError 	name not defined
* TypeError 	can not convert from one type to another
* OSError
* StopIteration
