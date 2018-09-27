* SyntaxError
* ImportError
* NameError:	name not defined
* TypeError:	can't convert from one type to another
* OSError
* StopIteration

try:
    some codes
except(RuntimError, TypeError, NameError):
    handlers
except:
    default handler
