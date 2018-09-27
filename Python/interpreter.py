##########################  intepreter  ##########################
# class: everything is an object, and therefore has a class (type)
object.__class__
# the dir() built-in prints the members of a module or class.
dir(math)
dir()   # without arg, it lists the names you have defined currently
help(obj.func)  # help for the func of object

# in order to know the type of a variable, use type()
type(math.asin) # <type 'builtin_function_or_method'>
type(math.pi)   # <type 'flaot'>

## while in script, we can test type by the following ways:
if type(L) == type([]): print("L is list")
if type(L) == list: print("L is list")
if isinstance(L, list): print ("L is list")     # prefer

sys.path    # system path for searching modules
# the last printed expression is assigned to the variable _
tax = 12.5 / 100
price = 100.50
price * tax     # 12.5625
price + _       # 113.0625
round(_, 2)     # 113.06



##########################  special methods  ##########################
def func(para1: str) -> None:
    pass
func.__doc__
func.__annotations__
