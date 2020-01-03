* In Rust, variables are immutable by default	==> Holy Shit
* No Garbage Collection, instead it uses the concept of ownership (and only one), once the ownership is out of scope, the object is released.
    * assigning a reference to a variable is considered a move of ownership
    * variables are by default passed by value (and hence transfer ownership), in order to pass a reference, use the **&** symbol
