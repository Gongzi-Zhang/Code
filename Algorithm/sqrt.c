#include <stdio.h>
#include <stdlib.h>

float mysqrt(float x) {
    int i = 1;
    float z = 1;
    float diff = z*z - x;
    while (abs(diff) > 0.01) {
	printf("\t%d iteration: z=%f\tz^2 = %f\tz^2-%f=%f\n", i++, z, z*z, x, diff);
	z -= diff / (2*z);
	diff = z*z - x;
    }
    printf("\t%d iteration: z=%f\tz^2 = %f\tz^2-%f=%f\n", i, z, z*z, x, diff);
    return z;
}

int main() {
    float x;
    printf("A explanation of a sqrt algorithm: z = (z*z - x) / (2*z) !\n");
    printf("Please enter a positive number (0 to quit): ");
    scanf("%f", &x);
    while (abs(x) > 1e-9) {
	if (x < 0)
	    printf("negative number! Please retry\n");
	else
	    printf("The sqrt of %f is %f\n", x, mysqrt(x));
	printf("Please enter a positive number (0 to quit): ");
	scanf("%f", &x);
    }
    return 0;
}

