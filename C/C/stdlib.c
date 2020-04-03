// standard libraries in c
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <libgen.h>
#include <errno.h>
#include <string.h>
#include <getopt.h>
#include <sys/types.h>

/* stdio:   FILE, stdin, stdout, stderr and fprint() families of fun
 * stdlib:  malloc(), calloc() and realloc()
 * unistd:  EXIT_FAILURE, EXIT_SUCCESS
 * libgen:  beasename()
 * errno:   defines the external errno var. and all the values in can take on
 * string:  memcpy(), memset() and strlen()
 * getopt:  supplies external optarg, opterr and getopt()
 * sys/types:	typedef shortcuts like unit32_t and unit64_t
 */
