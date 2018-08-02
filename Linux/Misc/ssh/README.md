# no-password login
You can add your local public key to a remote server in the 
** authorized_keys ** file, so that you don't need to input passwd for
every connection (this only work when the ssh deamon in remote server
allows passwordless login)
> ssh-copy-id user@host

# some possible reasons for failure of no-password login
1) permission: .ssh-- 700; authorized_keys -- 600



# socket proxy
> ssh -D 8080 user@host.com
then set proxy host as localhost and port as 8080

## use ssh proxy connected to a internal-host: 10.11.50.10
> ssh -L 8080:10.11.50.10:27017 user@host.com
> ssh -L 8080:10.11.50.10:27017 -L 8888:10.11.50.12:11211 user@host.com   : connect to multi-destination

## reverse forward
ssh -R 8080:localhost:8888 user@example.com
Now others can open http://example.com:8080 to access your host.

