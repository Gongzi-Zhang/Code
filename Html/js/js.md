* Js is a OO programming language for performing computations and manipulating computational objects within a **host environment**. A web browser provides a host environment for client-side computation. A web server provides a different host environment for server-side computation.

* An **object** is a collection of zero or more properties each with attributes that determine how each property can be used. Properties are containers that hold other objects: primitive values or functions.
  an object is an instance of the built-in type **Object**; and a function is a callable object; a function that is associated with an object via a property is called a method.

* In Js, **null** is not a reference to a non-existing object or a null pointer. It's just a special value which represents "nothing", "empty" or "value unknown"

* Functions:
    parameters of function are passed by a copy of value
    A Function Declaration can be called earlier than it is defined.For example, a global Function Declaration is visible in the whole script, no matter where it is.

* methods of primitive
    1. primitive must be fast and lightweight
    2. There are many things one would want to do with a primitive, it would be nice to access them as methods.
    > the solution looks a little bit awkward, but here it is:
    1. primitive are still primitive, a single value, as desired
    2. the language allows access to methods and properties of strings, numbers, booleans and symbols
    3. When called, a special "object wrapper" that provides the extra functionality is created, and then is **destroyed** (immediately after the usage).
    * null and undefined have no methods (wrapper objects)
