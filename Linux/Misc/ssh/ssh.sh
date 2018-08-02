#!/bin/sh

# checking for existing SSH keys
ls -al ~/.ssh

# generating a new SSH key
ssh-keygen -t rsa -b 4096 -C "email@host" # Here you will be prompted to enter a file where you want to save the key and your passphrase.

ssh-keygen -p -f ~/.ssh/id_rsa	# to change password for a generated key

# to add your SSH key to the ssh-agent.
# ssh-agent: an management agency so that you won't have to reenter your passphrase every time you use your SSH keys.
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa # the -K option is needed only for Mac.

# Now, to enable ssh connection, just add your ssh to the server (ex: github.com)

# testing ssh connection
ssh -T git@github.com

# SSH key passphrase
# change passphrase for an existing privete key without regenerating the keypair 
ssh-keygen -p
