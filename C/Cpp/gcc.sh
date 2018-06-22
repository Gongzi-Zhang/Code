# compilation with gcc
gcc -E test.c > test.txt    # preprocessing
:<<PREPROCESSIGN
    * file include
    * MACRO replacement
PREPROCESSIGN

gcc -S test.c	# convert source code into assembly language

:<<ASSEMBLY
    This stage assembles the assembly language program generated 
into a machine language object file
ASSEMBLY

:<<LINKING
    n the linking stage the object file is made into an executable 
after resolving dependencies with other object files and after adding 
startup and termination code. When writing a program, the source code 
for various parts or functions of the program may be defined in 
separate source files. The source code in one file may call functions 
which are defined in other files. Since each source file is compiled 
into a separate object file, the object file produced from one source
file may have a dependency on another object file. The function of 
the linker is to merge these object files so that any such dependencies
are resolved.
LINKING


gcc -c libtest.c libtest2.c
:<<OBJECT
    To compile a file as an object file, pass the -c option to gcc. 
This stops GCC from linking the object file into an executable and
produces the object files libtest.o, libtest2.o
OBJECT


# static library
ar rs libtest.a libtest.o libtest2.o
:<<LIBRARY
using ar to combine these two object into a single static library
LIBRARY

gcc -o test test.c libtest.a	# compile with library file included
gcc -o test test.c libtest.o libtest2.o	# same effect as the above one

# dynamic library
#+ firstly, generate "position independent code" object file
gcc -fPIC -c libtest.c libtest2.c
#+ then combine the object files into a dynamic library
gcc -shared -W1, -soname, libmymath.so -o libmymath.so libtest.o libtest2.o
#+ the shared option tells gcc to produce a shared object file
#+ -Wl,-soname,libmymath.so is a linker option that sets the internal 
#+ name of the library to libmymath.so. ??? Internal name
#+ And -o libmymath.so sets the name of the output dynamic library file
#+ to libmymath.so.

# link with dynamic library
gcc -o test test.c libmymath.so
# for the executable to run successfully, we need to add libmymath.so
#+ to dynamic linker search path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.

# using nm to resolve dependencies
nm --print-file-name *.so | grep funcname
# or
nm --print-file-name *.a | grep funcname

