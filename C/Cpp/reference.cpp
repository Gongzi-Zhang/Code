// use reference as function argument
string foo();
void bar (string & s);

/* The following statements will raise error because foo() and "hello world" 
 * will produce a *const* temperary string object, which can't be converted to
 * string & type.
 */
bar(foo()); 
bar("Hello world");

// return value
/* 1. don't return a reference of a local object, which will be destroyed after the end of the called funciton
 * 2. don't return a reference of a new object inside a funciton, though the newed obejct still exist after the funciton calling, there is no variable (reference is just a temp variable???) actually refer to it, therefore cause memory leak.
 * 3. the return value of stream operators "<<" and ">>" and assignment operator "=" returns a reference, that why we can use them consecutively.
 */
int& put(int n);
int vals[10];
int& put(int n) {
    if (n>=0 && n<=9) 
	return vals[n];
}
put(0) = 10;
put(9) = 20;
