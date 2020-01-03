#include <iostream>
#include <cstdlib>
#include <string>
#include <regex>
/* usage:
 * count_binary_1 number1 number2 ...
 * the number is integer only
 */

using namespace std;
int main(int argc, const char* argv[]) {
    if (argc == 1) {
	cout << "Error: At least 1 argument needed" << endl;
	exit(1);
    }
    int index = 1;
    while (index < argc) {
	int value = atoi(argv[index]);
	if (value == 0) {
	    string arg(argv[index]);
	    regex non_zero("[^0]");
	    if (regex_search(arg, non_zero)) {
		cerr << "Invalid argument: " << argv[index] << endl;
		index++;
		continue;
	    }
	}

	string binary;
	int val_copy = value;
	do {
	    binary = ((val_copy%2==0) ? "0" : "1") + binary;
	    val_copy /= 2;
	    // binary = (val_copy & 0x1) ? "1" : "0" + binary;
	    // val_copy >>= 1;
	} while (val_copy>0);
	binary = "0b" + binary;

	int count = 0;
	while (value) {
	    count++;
	    value &= (value-1);	// !!! highlight !!!
	}
        cout << "the " << index << " argument " << argv[index] << " has " << count << " 1 in its binary expression: " << binary << endl;
	index++;
    }
}
