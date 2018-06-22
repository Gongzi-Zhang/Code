#include <stdio.h>

FILE * fout = fopen("output", "w");
if ( !fout ) 
{
    printf ("Error, Unable to create file: output\n");
    return 1;
}
fprintf (fout, "this is file output\n");
fprintf (stdout, "file printf: %s", "need to specify output file, here is stdout.\n");
fclose(fout);



putchar('a');
