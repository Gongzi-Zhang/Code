#include<iostream>
#include<iomanip>
#include<cstdlib>
#include"quicksort.h"

int main()
{
	int dim;

	// Get the number of integers to sort
	std::cout << " How many integers? " << std::endl;
	std::cin >> dim;

	// Build an array of random integers
	int * arrs = new int[dim+1];
	int i;
	for (i=0; i < dim; i++)
		arrs[i] = std::rand();

	// Display the random integers
	std::cout << std::endl << "-----unsorted-----"
		<< std::endl;
	for(i=0; i< dim; i++)
		std::cout <<  std::setw(16) << arrs[i];

	// Sort the array
	quicksort(arrs,dim);

	// Display the sorted integers.
	std::cout << std::endl << "------sorted------"
		<< std::endl;
	for(i=0; i<dim; i++)
		std::cout <<  std::setw(16) << arrs[i] ;
	delete arrs;

return 0;
}
