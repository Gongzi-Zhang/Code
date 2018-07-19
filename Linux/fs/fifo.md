# pipe
A pipe is a temperary file in memory. It even can't be stored in memory
for a while, when some program write to a pipe, there must be another 
program to read it.

A named pipe can't exist with only one process (synchronous)

e.g.
> mkfifo test
> cat > test
> hello world
> ^D

> > When you output to test but without a program to read it, then you 
> > can't close input with Ctrl-D; only with
> cat < test
> > can you stop the previous program.

Similarly, when you close the read program, the write program will be
closed automatically without ^D.
> cat > test
> hello 
> world
> > It will be closed automatically

> cat < test	"in a different terminal"
> ^C


You can have multi-porcesses write to a pipe, but the read process will 
not distinguish them. You can also make multi-processes read from the same
pipe, but only the last connected process will get the data. The pipe will
exist as long as there is at least one input and at least one output.
