#include <iostream>

using namespace std;

void swap(int &a, int &b){
    a ^= b;
    b ^= a;
    a ^= b;
}

int main() {
    int a=1, b=3, c=8;
    float h=19.8, i=4.4, j=3.4e3;

    cout << "Int:\t" << a << "\t" << b << "\t" << c << "\n";
    cout << "Int:\t" << h << "\t" << i << "\t" << j << "\n";

    cout << "Cycling the values:" << endl;
    swap(a, b);
    swap(b, c);

    cout << "Int:\t" << a << "\t" << b << "\t" << c << "\n";
    return 0;
}
