#include <iostream>

/* varied parameters list, use initializer_list
 */

void test( initializer_list<int> s)
{
    for (auto i : s)	cout << s << endl;
}

// call test
test( {100, 200, 400, 600, 900} ); // call it with a list as parameter
