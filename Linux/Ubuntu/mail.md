# how to install a send-only mail server

## Installation
> apt install mailutils (which include postfix)
> > mail configuration:	Internet Site
> > System mail name:	Domain Name

## Configuration:
vim /etc/postfix/main.cf
    change the field inet_interfaces from all to loopback-only (localhost)
restart postfix to apply the changes
    sudo service postfix restart

## testing 
echo "Hello World" | mail -s "test" mail@host
