#include <iostream>
#include <fstream>

void read_file_1( string file_name )
{   
// read text file word by word
    string get;
    ifstream input(file_name.c_str(), std::ios_base::in);
    if ( input.is_open() )
    {
	while ( ! input.eof() )
	{   // do not use this style, while will not work as you expect it to 
	    // because the eofbit will not be set until after a failed read due to end of file.
	    // while means it will read the final word two times.
	    input >> get;
	    cout << get << endl;
	}

	// use this style
	while ( input >> get )
	{   cout << get << endl;    }
    }
}

void file_exist(const char * fileName)
{
    std::ifstream infile(fileName);
    return infile.good();
}
