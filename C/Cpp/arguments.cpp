#include <iostream>

using namespace std;

int main( int argc, char* argv[] ) {
    
    cout << "Test the usage of cpp arguments: argc and argv" << endl;
    cout << "* argc * there are totally " << argc << " arguments passed to this binary" << endl;
    cout << "* argv[] * \n" 
	 << "* argv[0] * the name of this binary is " << argv[0];
    if ( argc > 1) {
	for ( int i=0; i<argc; i++){
	    cout << "* argv[" << i << "] * the " << i << " argument passed to this binary is " << argv[i] << endl;
	}
    }
    return 0;
}
