#include <iostream>
using namespace std;


class lattice
{
public:
    int cage;
    int value;
};

void showSudoku(lattice sudoku[10][10])
{
    cout <<  "|---|---|---|---|---|---|---|---|---|" << endl;
    for(int i=1; i<10; i++)
    {	// row
	cout << "|";
	for(int j=1; j<10; j++)
	{ // column
	    cout << " " << sudoku[i][j].value << " |";
	    /*
	    if(sudoku[i][j].value > 0 )
	    {
		cout << " " << sudoku[i][j].value << " |";
	    }
	    else
	    {	cout << "   |";	}
	     */
	}
	cout << endl <<  "|---|---|---|---|---|---|---|---|---|" << endl;
    }
}

void initSudoku(lattice sudoku[10][10])
{
    for (int i=0; i<10; i++)
    {
	for (int j=0; j<10; j++)
	{
	    sudoku[i][j].value = 0;
	    sudoku[i][j].cage  = 3*((i-1)/3)+((j-1)/3) + 1;
	}
    }
    /*
    int row=0, col=0, value=0;

    // prompt for Init value
    cout << "input the initial value of sudoku in the form of: \n" <<  "row col value" << endl;
    cout <<  " Ctrl-D to end input" << endl;

    cin >> row >> col >> value;
    if(row == 10) // Ctrl-D here
    {
	cout << "end of input, your input initial sudoku look like this:" << endl;
	showSudoku(sudoku);
    }
    else
    {	sudoku[row][col].value = value;}
     */
}
int main()
{
    lattice sudoku[10][10];
    initSudoku(sudoku);
    showSudoku(sudoku);
    return 0;
}
