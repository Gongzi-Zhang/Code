#include <sstream>
#include <string>

// convert number into string.
for (int i=0; i<6; i++)
{
    std ostringstream os;
    os << "hist" << i;
    string hist = os.str();
}

string s = std::to_string(42);
// convert string into number
string a = "2";
atof(a.c_str());

// Raw string: R"()"
string s = R"(\zhang\\san)" // escape \ in string in order to express RE more concisely
