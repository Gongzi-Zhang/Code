error.md    errors encountered during compilation

symbol table:	offset of each function
> nm	list symbol table of object files

# compilation
.h, .c/cc ==> .o (Object file) =====> executive file
                  |            (link)
		  |
		.a/.lib (Archive file: package of object files)

.c/cpp, .h 
    | 
Preprocessing (preprocessor: cpp): include header, expand macro (.i, .ii)
    |
Compilation (compiler: gcc, g++...): assembly code (.s)
    |
Assemble (assembler: as): machine code (.o, .obj)
    | <- static lib (.lib, .a)
Linking (linker: ld): executable machine code (.exe)

the **compiler** needs the **header** files to compile the source code, 
the **linker** needs the **libraries** to resolve external references. 
For header file, the compiler searches the so-called **include-paths** for
included headers. The include-paths are specified via -Idir option, or 
environment variable CPATH. 
The linker searches the so-called **library-paths** for libraries needed
to link the program into an executable. the library-paths can be specified
with -Ldir option, or environment variable LIBRARY_PATH. In Unix, the 
library libxxx.a is specified via -lxxx option. In Windows, provide the 
full name such as -lxxx.lib. The linker needs to know both the dir. as 
well as the library names. Hence, two options needed to be specified.
> cpp -v    default include-paths
# options
-c: compile into object file by default, the object file has the same name as the source file with extension of ".o". No linking with other object files or libraries.
Linking is performed when the input file are object files ".o". GCC uses a separate linker program (ld) to link
-shared:    compiled into a shared lib (".dll" in Windows, ".so" in Unixes)
-D:	defining macro; -Dname or -Dname=value

# Language support
gcc -- C
g++ -- C++
gcj -- Java
gfortran -- fortran
gnat -- Ada
gccgo -- Go

# Versions:
GCC version 1 (1987): Initial version that support C.
GCC version 2 (1992): supports C++.
GCC version 3 (2001): incorporating ECGS (Experimental GNU Compiler System), with improve optimization.
GCC version 4 (2005):
GCC version 5 (2015):
GCC Version 6 (2016):
GCC Version 7 (2017):
