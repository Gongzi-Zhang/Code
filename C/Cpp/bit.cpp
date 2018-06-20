/* bit operation
 * &	and
 * |	or
 * ^	xor (exclusive or)
 * ~	not
 * <<	left shift, fill 0 in lower bits
 * >>	right shift, for unsign number, fill 0 in higher bits; for signed
 *	number, it depends on compiler, some fill sign bit (calculas right
 *	shift), others fill 0 (logical right shift)
 *	In gcc, it fills higher bits with sign bit.
 *
 *	special number:
 *	0   00000000
 *	-1  11111111
 */

int a=-15, b=15;
printf("%d %d\n", a>>2, b>>2);	// -4 3


// even or odd
for (i=0; i<100; ++i)
    if (i & 1) 
	printf("%d ", i);    // print all odd number
putchar('\n');

// exchange two numbers
void swap(int &a, int &b)
{
    if (a!=b)
    {
	a ^= b;	// XOR
	b ^= a;
	a ^= b;
    }
}

// exchange sign (取反后加1)
int signreversal (int a)
{
    return ~a + 1;
}

// absolute value
int abs(int a)
{
    int i = a >> 31;	// get the sign of a, 0 for positive number, and -1 for negative value.
    return i == 0 ? a : (~a + 1);   // i==0, positive, return itself; otherwise, return its opposite value
//  return ((a ^ i) - i);
}

/* XOR operation:
 * a number XOR with itself gives 0
 * XOR satisfy exchange rule
 */
int odd(){
    const int MAXN = 15;
    int a[MAXN] = {1, 347, 6, 9, 13, 65, 889, 712, 889, 347, 1, 9, 65, 13, 712};
    int oddNum = 0;
    for (int i = 0; i < MAXN; ++i)
	oddNum ^= a[i];
    return oddNum;
}
