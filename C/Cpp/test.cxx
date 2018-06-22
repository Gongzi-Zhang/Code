#include <iostream>
using namespace std;

int main()
{
  cout << __FILE__ << "\t" << __LINE__ << endl;
  cout << "Hello" << "\v" << "World" << "\t" << "This" << "\r" << "is a test";
  return 0;
}
