# compiling errors 


# link error
* If one file can be compiled, but gives out linking error:
>   undefined reference to ....
Then it is the problem of library. Note that libraries need to be 
specified on the command line **after** the files needing them. e.g.
> g++ -o a example.cc `root-config --cflags --libs`
> **NOT** g++ `root-config --cflags --libs` -o a example.cc
