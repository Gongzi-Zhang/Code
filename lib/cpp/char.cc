// test of char.h
#include "char.h"
#include <iostream>

using namespace std;

int main(){
    cout << "length:\t" << len("Hello World") << endl;
    cout << "position:\t" << pos("Hello World", 'l') << endl;
    cout << "concatenate:\t" << cat("Hello ", "World") << endl;
    cout << "delete:\t" << del("Hello World", 6) << endl;
    cout << "slim:\t" << slim("Hello World", 'l') << endl;
    cout << "reverse:\t" << reverse("Hello World") << endl;
    cout << "strip head:\t" << strip_head("Hello World", 'H') << endl;
    cout << "strip tail:\t" << strip_tail("Hello World", 'd') << endl;
    cout << endl;

    cout << "Null string:" << endl ;
    cout << "length:\t" << len("") << endl;
    cout << "position:\t" << pos("", 'l') << endl;
    cout << "concatenate:\t" << cat("", "World") << endl;
    cout << "delete:\t" << del("", 0) << endl;
    cout << "slim:\t" << slim("", 'l') << endl;
    cout << "reverse:\t" << reverse("") << endl;
    cout << "strip head:\t" << strip_head("", 'H') << endl;
    cout << "strip tail:\t" << strip_tail("", 'd') << endl;
    return 0;
}

