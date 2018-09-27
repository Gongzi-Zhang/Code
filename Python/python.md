package > module > functions 
# data structure
## sequnce type
* sequence unpacking requires that there are as many variables on the left side of the equal sign as there are elements in the sequence.

## mapping type
* dictionaries


* A namespace is a mapping from names to objects.
* A scope is a textual region of a Python program where a namespace is directly accessible.
* Assignments do not copy data — they just bind names to objects. The same is true for deletions
# functions
* functions definition
    def func(para, *tuple_args, **dic_args){}
Note that the **order** of argment list, dic_args must come last, and tuple_args comes second-last (last if there is no dic_args)

* The default values are evaluated at the point of function definition in the defining scope.
  The default value is evaluated only once. This makes a difference when the default is a mutable object such as a list, dictionary, or instances of most classes.

* lambda expressions 
    are syntactically restricted to a single expression. Semantically, they are just syntactic sugar for a normal function definition.


# sequence structure
> tuple: (1234, 2345, 'hello')
> list:  [1234, 2345, 'hello']
> string: 'hello world'

* tuple is immutable, list is mutable; but tuple can contain mutable objects
