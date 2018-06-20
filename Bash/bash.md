# Process

## How parent process produce child process
The parent process (pid=a) will firstly fort itself to produce a copied 
process (pid=b, ppid=a), then the child process executes the command you
give to form a new process. That's why the child process can inherites
the environment of parent process.
