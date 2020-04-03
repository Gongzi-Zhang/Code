// A c file template

// LICENCE

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


// defines
#define OPTSTR "vi:o:f:h"
#define ERR_FOPEN_INPUT "fopen(input, r)"


// external declarations
extern int errno;   // out-of-band communication channel used by the standard C lib. to communicate why funcation have failed
extern char *optarg;
extern int opterr, optind;  // used by getopt() 


// typedef
typedef struct {
    int		verbose;
    uint32_t	flags;
    FILE       *input;
    FILE       *output;
} options_t;


// global var. declarations
int g_var = 1;


// function prototypes
void usage(char *progname, int opt);

// main()
int main(int argc, char *argv[]) {
    // parsing command line arguments
    int opt;
    options_t options = {0, 0x0, stdin, stdout};
    opterr = 0;

    while ((opt = getopt(argc, argv, OPTSTR)) != EOF) 
	switch(opt) {
	    case 'i':
		if (!(options.input = fopen(optarg, "r"))) {
		    perror(ERR_FOPEN_INPUT);
		    exit(EXIT_FAILURE);
		}
		break;

	    case 'o':
		if (!(options.output = fopen(optarg, "w"))) {
		    perror(ERR_FOPEN_OUTPUT);
		    exit(EXIT_FAILURE);
		}
		break;
	    default:
		usage(basename(argv[0]), opt);
		break;
	}
}
