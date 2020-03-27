gSystem->Load("libPhysics"); // load shared library
gSystem->AddIncludePath("-IPath/to/Include/File");
gSystem->SetIncludePath("-IPath/to/Include/File");
gSystem->AddLinkedLibs("-L/my/path -llib"); // add lib for linking
gSystem->SetMakeSharedLib();
gSystem->CompileMacro("MyMacro.cxx","k"); // this will compile the macro and load it if successful
gSystem->UnixPathName("file_name");
// run the function defined in the macro
MyMacro("variable");
