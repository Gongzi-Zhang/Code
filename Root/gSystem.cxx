gSystem->Load("libPhysics"); // load shared library
gSystem->AddIncludePath("Path/to/Include/File");
gSystem->CompileMacro("MyMacro.cxx","k"); // this will compile the macro and load it if successful
// run the function defined in the macro
MyMacro("variable");
