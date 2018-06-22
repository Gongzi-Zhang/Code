#include<iostream>
#include<fstream>

int main()
{
	std::cout << "Creating file..." << std::endl;
	std::ofstream tfile("test.dat");

	std::cout << " Writing to file ..." << std::endl;
	tfile << "These are test data";

return 0;
}
