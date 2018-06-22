# CPP

# order of operator
()
! + - ++ -- // single operator
/ * %
+ -
< <= > >= == !=
&&
||
= += /= %= \*= 




# Take Care
the default precision in Cpp is 6, which means you'll get large number of 
Memory
------


# some keywords about C++ language
specifier:
    virtual
    override
    final
    static 
    friend
    pure
qualifiers: (appears after the name of the function in declaration)
    const
    volative
    reference
In the body of cv-qualified function, the 'this' pointer is 
cv-qualified, e.g. in a 'const' member func, only other const member
functions may be called normally.

Doubts
------
* cross compilation
* compiled time and run time, run time check, who and how to do it
* vtable: virtual function call tables
* when I try to compile cpp file "arguments.cpp" with the command
" gcc -c -o arguments arguments.cpp" , the resulting binary is 
  unable to run on my processor, and give out error: can't execute
  binary file: Exec format error. But if I compile it with another
  command "g++ -o arguments arguments.cpp", the resulting binary 
  will be executable??? 
 
* double quotes and single quotes in c++


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
