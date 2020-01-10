// empty macro:
// 1. conditional compilation
// 2. explanation



#define IN
#define OUT

// more readable
void def(
    IN IN OUT OUT	// expand to blank line
    IN char * input;	// expand to: char * input
    OUT char * output;	// char * output
);


// conditional explanation
#ifdef IN
...
#else
...
#endif
