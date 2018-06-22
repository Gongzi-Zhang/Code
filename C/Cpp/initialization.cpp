void f() {
    int a;	// uncertain
    int b = int();  // initialized as 0, can not be expressed as int b(), this is a declaration of a function
    int * c = new int;  // unknown value
    int * d = new int();    // initialized as 0
    int e;
    new (&e) int();	// use placement new
}

struct Foo{
    Foo() : g() {}  // f is undefinied, g is initialize as 0
    int f;
    int g;
}
