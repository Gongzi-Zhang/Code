# design rules
* lua is used also as a data-description language
* Tables are the main (in fact, the only) data structuring mechanism 
in Lua, and a powerful one.
* * functions are first-class values with proper lexical scoping


# conventions
* conserve identifiers starting with an underscore followed by upper-case 
    letters (e.g. _VERSION) for special use.

* Lua consider both zero and the empty string as true in conditional tests. Only 'false' and 'nil' are considered as false, everything else is regarded as true.

* Any numeric operation applied to a string tries to convert the string to a number.  Lua applies such coercions not only in arithmetic operatiors, but also in other places that expect a number. Conversely, whenever Lua finds a number where it expects a string, it converts the number to a string.

* Like in a multiple assignment, only the last (or the only) element of a table constructor or a argument list can result in more than one value;
  you can force a call to return exactly one result by enclosing it in an extra pair of parentheses.

* coroutine: 
    "yield" suspends a function, and "resume" resumes a function
    A call to resume returns, after the true that signals no errors, any arguments passed to the corresponding yield
    Symmetrically, yield returns any extra arguments passed to the corresponding resume
    When a coroutine calls yield, it does not enter into a new function; instead, it returns a pending call (to resume). Similarly, a call to resume does not start a new function, but returns a call to yield.

* when number of arguments, variables doesn't match (e.g. in multiple assignment, function call), the extra variables will be assigned nil, while the extra value will be discarded.

* A somewhat confusing notino in Lua is that functions, like all other values, are anonymous; they do not have names. When we talk about a funciton name, such as print, we are actually talking about a variable that holds that function. 
    a = {p = print}
    a.p("hello world")
    print = math.sin
    a.p(print(1))
    sin = a.p
    sin(10, 20)
Though silly, these statements are all correct.

* closure: is a function plus all it needs to access non-local variables correctly --> context. Technically speaking, what is a value in Lua is the closure, not the function. The function itself is just a prototype for closures.

* most Lua libraries use functions in table field. (e.g. io.read, math.sin)

* An iterator is any construction that allows you to iterate over the elements of a collection. When called, it returns the **next** elements from the collection. Every iterator needs to keep some state between successive calls, so that it knows where it is and how to proceed from there. Closure is exactly a solution for this task.

* Lua will always evaluates its arguments before calling the funciton.
    file = assert(io.open("no-file", "r"))
  Notice here the error message from io.open goes as the second argument to assert.
* private variable ???
