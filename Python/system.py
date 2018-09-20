#!/usr/bin/env python
import os
import commands
import time
import sys

path = os.getcwd()
os.system("mkdir tmp")
os.chdir("tmp/")
os.environ


sys.argv[0]

sys.path    # module searching path
base, ext = os.path.splittext(filename)
sys.ps1     # prompt 1
sys.ps2     # prompt 2
sys.stderr.write('Warning, log file not found, starting a new one\n')
sys.exit()


import shutil   # shell utilities
shutil.copyfile('data.db', 'archive.db')
shutil.move('/build/executables', 'installdir')

import glob # wildcard searches
glob.glob('*.py')


# threading
import threading

class AsyncZip(threading.Thread):
    def __init__(self, infile, outfile):
        threading.Thread.__init__(self)
        self.infile = infile
        self.outfile = outfile

    def run(self):
        f = zipfile.ZipFile(self.outfile, 'w', zipfile_ZIP_DEFLATED)
        f.write(self.infile)
        f.close
        print('Finished background zip of:', self.infile)

background = AsyncZip('mydata.txt', 'myarchive.zip')
background.start()
print('The main program continues to run in foreground.')

background.join()   # wait for the background task to finish
print('Main program waited unitl background was done.')
