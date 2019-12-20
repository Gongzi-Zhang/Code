// When use array as argument to a function, it will degrade to a normal point of its type
char a[] = "hello world";
char *p = a;
cout << sizeof(a) << endl;  // 12 bytes
cout << sizeof(p) << endl;  // 4 bytes

void func(char a[100]) {
    cout << sizeof(a) << endl;	// !!! 4 bytes !!!
}
