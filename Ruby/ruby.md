* In Ruby, everything is an object
    > nil is an object
* objects are strongly but dynamically typed
    > all member variables are private
    > all methods are always virtual
    > you can re-open a class (even built-in classes) anytime and add more methods (reflection)
    > variable assignment doesn't generate a new copy of an object, just add a new reference; but there are a few special cases:
	Fixnum, NilClass, TrueClass, FalseClass
    which are contained direclty in variables or constants. So assignment of them will physically produce a copy of objects
* mixin: there is no multiple inheritance. Though one may use mixin: a class definition may include a module, which inserts that module's methods, constants, etc. into the class.
* method searching order:
    1. singleton methods
    2. receiver own class
    3. receiver's superclass (including mixed in modules)
    4. search method_missing in the same order

    > destructive methods: that alters the state of an object. usually there will be two version: one with a plain name, which will creates a copy of the receiver, and then make changes to the copy; while the bang verion (followed by !) modifies the receiver in place.

* everything is an expression
    > things like **while** statements actually evaluate to an rvalue

* all variables live on the heap
    > you can assign any kind of object to a given variable (variables are reference)
    > There’s no way to unset a variable once set (like Python’s del statement). You can reset a variable to nil, allowing the old contents to be garbage collected, but the variable will remain in the symbol table as long as it is in scope.
* var could be a local variable
    > @var is an instance variable
    > $var is a global variable
* there is only two container types: **Array** and **Hash**

* blocks are always attached to methods.
    > blocks are actually objects, they just don't know it yet
    > similarly, methods are also objects in the making

* arguments to methods are passed by value, where the values are always object references
    > operators are syntactic sugar

* A **def** statement outside of a class definition, which is a function in Python, is actually a method call in Ruby. These ensatz functions become private methods of class Object, the root of the Ruby class hierarchy. 

* scope:
    > block introduce a new scope
    > **while**, **until** and **for** are control structures, so local variables within them will be accessible in the enclosing environment.
    > loop is a method and the associated block introduces a new scope

* An iterator is a method which accepts a block or a Proc object

* Modules are collections of methods and constants. They can't generate instances
