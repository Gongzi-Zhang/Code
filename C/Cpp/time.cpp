#include <time.h>
#include <ctime>

/* use time function go give out the time cost for running a program.
 */

time_t t = time(0);

time_t begin, end;

time(&begin);
time(&end);

double timedif = difftime(end, start);
