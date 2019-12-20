// manipulate memory directly
// assignment to memory address: 0x100000
(unsigned int*)0x100000 = 1234;

// goto a memory address and then executed from there
// convert it to a function pointer
*((void (*) ())0x100000 ) ();
