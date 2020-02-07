/* something that I think is irreasonable in C/C++
 */

// varaible declaration in for/while loop
while (int i=0; i<2; i++) {
    int a;  // here, a declaration inside a loop will not reset it to 0 for a new loop, but will continue value from previous loop; so it makes no difference whether declare it inside or outside the loop
    for (int j=0; j<5; j++)
	a += j;

    printf("in loop %d, a is %d", i, a);
}
