# ssh connection
1. in Android device: (need package openssh)
> sshd -p 8888 
* adding you public key
    one can't do password authentication in Termux, therefore you need 
    to put you OpenSSH public key into the authorized_keys file
2. in pc:
> ssh username@ip -p 8888  
