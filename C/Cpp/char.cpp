#include <iostream>
using namespace std;
// to express extented charset in C++ code, we need to use wide char type.
wchar_t cChs = L'张';	// L means encode with wide-character set(unicode), if no 'L', it will be encoded with multibyte-character set.
// set wcout to output Chinese chars.
wcout.imbue ( locale ( "chs" ) );
wcout << cChs << endl;

char *p = "hello world.";
p[0] = 'x'; // it can be compiled, but will raise a run time error: attempt to change a literal string
