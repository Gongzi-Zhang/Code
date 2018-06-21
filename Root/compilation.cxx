/*
 * In order to make a code block executable stand-alone, an entry 
 * point for the OS is needed, in c++ this is the procedure int main();
 * The easiest way to turn a ROOT macro code into a stand-alone 
 * applicaion is to add the following "dressin code" at the end of 
 * the macro file. This define the procedure main, the only purpose 
 * of which is to call your macros:
 */

#ifndef __CINT__
int main()
{
    ExampleMacro();
    return 0;
    }
#endif


/*
 * Within ROOT, the symbol __CINT__ is defined, and the code enclosed 
 * by #ifndef __CINT__ and #endif is not executed; 
 * on the contrary, when running the system compiling g++, this symbol 
 * is not defined, and the code is compiled. To create a stand-alone 
 * program from a macro called ExampleMacro.C, simply type:
> g++ -o ExampleMacro.exe ExampleMacro.cxx `root-config --cflags --libs`
 * and execute it by typing:
> ./ExampleMacro.exe
 */

/*
 * This procedure will, however, not give user access to the ROOT 
 * graphics as neither control of mouse or keyboard events nor access 
 * to the graphics windows of ROOT is available. If you want your 
 * stand-alone application have display graphics output and respond to 
 * mouse and keyboard, a slightly more complex piece of code is used.
 * In the example below, a macro ExampleMacro_GUI is executed by the 
 * ROOT class TApplication. 
 */

#ifndef __CINT__
void StandaloneApplication(int argc, char** argv)
{
    // call the ROOT macro
    ExampleMacro_GUI();
}

int main(int argc, char** argv)
{
    gROOT->Reset();
    TApplication app("Root Application", &argc, argv);
    StandaloneApplication(app.Argc(), app.Argv());
    app.Run();
    return 0;
}
#endif

// complie it with
> g++ -o ExampleMacro_GUI.exe ExampleMacro_GUI.cxx `root-config --cflags --libs`
// to compile a file Example.c that uses root:
> g++ -c -I `root-config --incdir` Example.c
// to compile and link a file that uses root:
> g++ -I `root-config --incdir` -o ExampleMacro_GUI.exe ExampleMacro_GUI.cxx `root-config --libs`
