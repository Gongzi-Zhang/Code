#include <iostream>

cout << __FILE__ << "\t" << __LINE__ << endl;



// tips
/* if there are more than one sentence within one MACRO, we need to 
 * use do{...} while(0) to wrap it.
 * otherwise:
 */

// wrong 1
#define M() a(); b()
if(cond)
    M();
else
    c();

// extented to:
if(cond)
    a(); b();
else	// else without corresponding if
    c();

// only {} doesn't work sometimes either
#define M()  { a(); b(); }
if(cond)
    M();
else
    c();

// extented to:
if(cond)
    { a(); b(); };  // the semi-colon end if statement
else	// else without corresponding if
    c();


// do while
if(cond)
    do { a(); b(); } while(0);
else
    c();
