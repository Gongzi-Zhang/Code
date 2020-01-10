# Terminology of Programming

EOF: end of file
    <Ctrl-D> on Unix, <Ctrl-Z> on Windows

Library type
> STATIC 
> SHARED 
> MODULE: which can be dynamically loaded into an executable. On many OS this is tha same as SHARED,
	  but on other OS such as Mac OS X it is different.

Version
    major[.minor[.patch[.tweak]]]

# Syntax
* Definition >= Declaration
    a declaration can be done many times while definition only once

  in C:
    int var;	// declare a variable; no memory allocation for it yet
    var = 5;	// define a variable
    int func(float arg1) {} // declare a function
