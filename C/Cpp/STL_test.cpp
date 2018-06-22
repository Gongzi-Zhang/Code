#include <iostream>
#include <vector>
#include <algorithm>

// the function to be called by for_each()
void show_val(char val)
{
	std::cout << val << std::endl;
}
int main()
{
	// Create the vector object;
	std::vector< char > charVector;

	// Populate the vector with values;
	charVector.push_back('T');
	charVector.push_back('H');
	charVector.push_back('E');
	charVector.push_back('R');
	charVector.push_back('E');
	charVector.push_back(' ');
	charVector.push_back('H');
	charVector.push_back('I');

	// Display the contents of the vector;
	std::cout << " Contents of vector:" << std::endl;
	for_each( charVector.begin(), charVector.end(), show_val);

	// Rotate the vector;
	rotate( charVector.begin(), charVector.begin()+6, charVector.end());

	// Display the contents of the new vector;
	std::cout << "Contents of vector:" << std::endl;
	for_each( charVector.begin(),charVector.end(), show_val);

return 0;
}
