#!/bin/bash

### options ###
make -f file
    # use specified file rather than default makefile
make -n --just-print --dry-run --recon
    # just print commands, but not execute them
make -B --always-make
make -i --ignore-errors
    # ignore errors while executing command, same as adding '-' before command
make -k --keep-going
    # if some errors happen, only stop current rule, but continue with other rules.
make -w --print-directory
    # print dir. useful for nested making
make -W <file> --what-if=<file> --assume-new=<file> --new-file=<file>
    # if used with -n, then print out commands that will be run assuming file is updated; otherwise, same as --touch
make -s --silent
    # show no command
