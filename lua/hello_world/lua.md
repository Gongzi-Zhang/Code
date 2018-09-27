* ENVIRONMENT variable
    LUA_INIT    @filename   :: run it before running its arguments
			    :: configuring lua interpreter

* Any numeric operation applied to a string tries to convert the string to a number. 
  Lua applies such coercions not only in arithmetic operatiors, but also in other places that expect a number.
  Conversely, whenever Lua finds a number where it expects a string, it converts the number to a string.

* **Table** is the only data structuring mechanism in Lua.
  
* Like in a multiple assignment, only the last (or the only) element of the list can result in more than one value

* coroutine: 
    "yield" suspends a function, and "resume" resumes a function
    A call to resume returns, after the true that signals no errors, any arguments passed to the corresponding yield
    Symmetrically, yield returns any extra arguments passed to the corresponding resume
    When a coroutine calls yield, it does not enter into a new function; instead, it returns a pending call (to resume). Similarly, a call to resume does not start a new function, but returns a call to yield.
