# errors
* sudo cd /some/dir/	
> > sudo: cd: command not found
    1. sudo only applies to programs, cd is not a program but an built-in command.
    2. If it were possible to use sudo to **cd** to a protected directory, then you would be in that dir. as a normal user, which is not allowed.
> > > workaround:
    sudo -i	OR sudo su
    cd /some/dir/
