#include <vector>

/*
 * -- vectors guarantee their elements are in continuous block of memory
 * -- When you	create a vector, it might not initually allocate much memory for itself, 
 *  check with myVec.capacity(); When you push_back beyond the capacity of the vector, 
 *  the vectorwill try to allocate some more memory for itself. Therefore if you know 
 *  how big your vector might get in advance, reserve that memory: myVec.reserve(100);
 */

// Initializer
vector<string> vars_1 = {"pt", "eta", "phi", "m"};
vector<string> vars_wrong("wrong"); // Error !!!

std::vector<double> myVector(8);    // a vector with fixed number of elements.
// though declared with fixed number, it size can be changed
myVector.push_back(9.);
myVector.size();

// convert vector into array
double* myArray = myVector.data();
