# Errors encounted when running bash

## ~weibin
when ~weibin is not expanded, then you will encounter such error as 
```shell
CODE="~weibin/Code"	&& cd $CODE
bash: cd: ~weibin/Code: No such file or dir.
```

## permission denied with redirection of sudo command
sudo echo "Hello World" &> log
In some root-owned dir., it will prompt such error:
> -bash: log: Permission denied
Although you issue the echo command as sudo, the redirection is performed by the shell which doesn't have the permission to write to log. The redirection is not performed by sudo.

There are several solutions:
1. sudo sh -C 'echo "Hello World" &> log'
2. create a shell script and then run the script with sudo
3. sudo tee
    sudo echo "Hello World" | sudo tee log > /dev/null

