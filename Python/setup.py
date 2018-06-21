#!/usr/bin/python

from distutils.core import setup

setup(  name='Distutils',
        version='1.0',
        description='Python Distribution Utilities',
        author='Greg Ward',
        author_email='gwar@python.net',
        url='https://www.python.org/sigs/distutils-sig/',
        packages=['distutils', 'distutils.command'],
        )
