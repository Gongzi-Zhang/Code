#include <iostream>
#include <vector>
//
// a code give out full child set of a set(全部子集)
//
using namespace std;

void pow(int a[], int n, vector<int> p)
{
    if(n == 0)
    {
	cout << "{" ;
	int count = p.size();
	if(count > 0)
	{
	    cout << p[count-1];
	    for (int i=count-2; i>=0; i--)
	    {
		cout << "," << p[i];
	    }
	}
	cout << "}" << endl;
    }
    else
    {
	pow(a, n-1, p);
	p.push_back(a[n-1]);
	pow(a, n-1, p);
    }
}

int main()
{
    int a[4] = {1,2,3,4};
    vector<int> p;
    pow(a, 4, p);
    return 0;
}
