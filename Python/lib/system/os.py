#!/usr/bin/env python

import os

os.getcwd()     # current working dir.
os.chdir('/new/dir')    #change cwd
os.system('mkdir dir')  # exec command in system shell

# delete all '.pyc' files in working dir.
for root, dirs, files in os.walk('.'):
    for filename in files:
        ext = os.path.splitext(filename)[1]
        if ext == '.pyc':
            os.unlink(os.path.join(root, filename))
