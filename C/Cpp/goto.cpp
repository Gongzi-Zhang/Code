#include<iostream>
#include <cstdlib>

using namespace std;

int main()
{
std::cout << "Compare a random number?(y/n)";
char ans;
std::cin >> ans;

if(ans== 'n')
  goto done;

int ran;
ran = std::rand();
std::cout << ran;

done:
  return 0;

return 0;
}
