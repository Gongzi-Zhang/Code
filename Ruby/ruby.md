Keywords	::= 
		    class |
		    else | end |
		    false |
		    def | do
		    for
		    if |
		    until
		    while
* In Ruby, everything is an object
* var could be a local variable
  @var is an instance variable
  $var is a global variable
* blocks are always attached to methods.
* A **def** statement outside of a class definition, which is a function in Python, is actually a method call in Ruby. These ensatz functions become private methods of class Object, the root of the Ruby class hierarchy. 
* mixin: a class definition may include a module, which inserts that module's methods, constants, etc. into the class.
