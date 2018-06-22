#include <assert.h>
// Assertions, to asert a condition or set of conditions to be true,
// if not, an error message will be printed out.

static_assert(sizeof(long) >= 8, "64 bits platform is needed for compilation");
// the expression in static_assert statement must be constant expression.
int MyFunc(int a, double b)
{
    assert(a <= 5 && b >= 17);
    return 1;
}
