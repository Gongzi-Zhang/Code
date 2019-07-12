gSystem->Load("libPhysics"); // load shared library
gSystem->AddIncludePath("Path/to/Include/File");
gSystem->CompileMacro("MyMacro.cxx","k"); // this will compile the macro and load it if successful
gSystem->UnixPathName("file_name");
// run the function defined in the macro
MyMacro("variable");
