/*  extern extends the visibility of funcitons/variables so that any
 *  other files that includes the declaratino can used them.
 *  
 *  so one may define some variables in one source file, and then
 *  use them in another source file by declaring them rather than 
 *  including the source file.
 *
 *  Function:
 *	when function is declared or defined, the extern keyword is 
 *	implicitly assumed.
 *  var:
 *	extern can declare a var. without defining it
 */

int foo(int arg1, char arg2);
extern int foo(int arg1, char arg2);	// compiler version

extern int var;	    // declare a variable
int var;	    // declare and define a variable


extern int bad;	    // declare without defining it, no memory is allocated
bad = 10;	    // error: assign value to non-existing var.

extern int good = 1;	// declaration with initialization is thought of as definition
good = 10;	    // ok
