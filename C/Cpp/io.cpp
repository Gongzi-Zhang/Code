#include <iostream>
#include <fstream>

#include <iomanip>  // std::setprecision
using namespace std;

int main(){
    string input;
    // Basic
    cout << "Hello World !" << endl;
    cin >> input;
    clog << "What you input is " << input << endl;
    cerr << "This is a error message !" << endl;

    std::streamsize ss = std::cout.precision();	// default precision: 6
    /// to set back the default precision after a precision(pre) operation, you have to do it with:
    /// std::setprecision(ss)

    // Formatted output
    double f = 3.1415926;
    /// setprecision: include all numbers ( number before decimal point )
    cout << setprecision(5) << f << "\n";   // 3.1416
    cout << setprecision(5) << 0.009876543 << "\n"; // 0.0098765
    cout << setprecision(9) << f << "\n";   // 3.1416926
    cout << fixed;  // output in standart notation, the opposite of fixed flag is scientific
    cout << setprecision(5) << f << '\n';   // 3.14159
    cout << setprecision(5) << 0.009876543 << "\n"; // 0.00988
    cout << setprecision(9) << f << '\n';   // 3.141592600
    cout << scientific << setprecision(ss);
    /// setwidth
    cout << setw(5) << f << "\n";   // 3.14159
    cout << setw(10) << f << "\n";  // □ □ □ 3.14159
    cout << setprecision(5) << setw(10) << f << "\n";  // □ □ □ □ 3.1416
    cout << setprecision(ss);
    /// justified
    cout << left << setprecision(5) << setw(10) << f << endl;	// 3.1416□ □ □ □
    cout << right << setprecision(5) << setw(10) << f << endl;	// □ □ □ □ 3.1416
    /// fill
    cout << setfill('-') << setw(10) << f << endl;  // ----3.1416
    /// base
    cout << setbase(16) << 32;	// 20

    // file IO
    ofstream fout("output.txt");
    if ( fout.is_open() )
    {
	fout << "Ming Xiao \t" << "Male \t" << "20 \t" << "Industry" << endl ;
	fout << "Hong Zeng \t" << "Female \t" << "21 \t" << "Service Related" << endl;
	cout << "Write data successfully into output.txt" << endl;
	fout.close();
    }
    else
    {
	cout << "Unable to open output.txt" << endl;
    }

    return 0;
}
