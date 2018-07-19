# cmake
cmake is tools used for creating makefile, which is used by make to build software. 

# Key notation about makefile
Make only cares about **dependency** of files, it doesn't pay attention to
command compiling the target.

## 5 components of makefile
1. explicit rules, spicifing how to produce target.
2. hidden rules, bonus from make, allowing clean document.
3. variables
4. files including. like #include and #if in C. 
5. comments. 

## How make works
1. read in makefile
2. include other makefile
3. initialize variables
4. deduce hidden rules, and analyze all rules
5. create dependency for all target
6. decide which file need to be re-created according to dependency
7. execute command

* the pattern expansion (%) happen after variable and function expansion, while is expanded in the fly, while variable and function are expanded whne read in. 
