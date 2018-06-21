#!/usr/bin/env python
import os

with open('job.sh', 'w') as fout:
    fout.write("#!/bin/sh\n")
    fout.write("echo\n")
    fout.write("echo\n")
    fout.write("echo 'START----------------'\n")
    fout.write("echo 'WORKING  ' ${PWD}\n")
    fout.write("echo 'STOP-----------------'\n")
    fout.write("echo\n")
    fout.write("echo\n")

fout.close()
os.system("chmod 755 job.sh")
