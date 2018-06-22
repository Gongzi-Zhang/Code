#include <random>
#include <iostream>

using namespace std;

int main()
{
    // define the default random engine
    default_random_engine reng;
    // create a uniform dist. between 0 and 25
    uniform_int_distribution<int> uni_dist(0,25);

    // use seed from random_device
    random_device rnd_device;
    reng.seed(rnd_device());

    // print out random number
    const int n = 4;
    char code[n];
    for (int i = 0; i<n; i++)
    {
	// call random engine in distribution to produce random number
	code[i] = 'A' + uni_dist(reng);

	cout << code[i];
    }

    return 0;
}
