# CPP
* cpp doesn't have reflection, can't eval some string as a function

# Take Care
* the default precision in Cpp is 6


Memory
------

# some keywords about C++ language
* specifier:
    virtual
    override
    final
    static 
    friend
    pure
* qualifiers: (appears after the name of the function in declaration)
    const
    volative
    reference
In the body of cv-qualified function, the 'this' pointer is 
cv-qualified, e.g. in a 'const' member func, only other const member
functions may be called normally.

* l-value:
    * array is not modifiable l-value: can't be assigned to, only initianlized

# concpts:
* copy
    The default copy constructor is sometimes refered to a "bitwise copy". The data is copied across bit for bit with disreguard as to what they actually contain. 
    This is not totally true, however. If an object in a structure/class has it's own default copy constructor, that desturctor will be called, which is why things like std::string and std::vector get copy constructed corretly using a default constructor. However, for base types (pointers, ints, arrays, etc...) they are just copied bit for bit. The implicitly-defined copy constructor for a class performs a memberwise copy of its subobjects.
    But the default copy method doesn't apply to array: because a lot of time you may have an array without knowing it's size, so it wouldn't be possible.

* array
    in C: array to pointer degradation is compulsory for all expressions of array type except in few cases such as sizeof or char str[] = "str" the pointer you get from the conversion can only be rvalue.

* container's value type:
  The type of the elements to be stored in a container must be both **copy constructible** and **assignable**

Doubts
------
* compiled time and run time, run time check, who and how to do it
* vtable: virtual function call tables


# tips
1: comparison of float number, use: 
    abs(a - b) < 0.0001, rather than 
    a == b


# stack overflow
what is stack:
    - Fast read/write
    - Relatively small
    - Automatically managed for you: you do not have to delete things 
      from it yourself
??? how many memory space(stack) is allocated to a program by the OS.

what is heap:
    - Slower than stack(not by any amount you will ever care about)
    - bigger than the stack
    - Managed by you

