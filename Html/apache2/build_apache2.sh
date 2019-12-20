#!/bin/bash

# compile source code
./configure --help  # check available options
./configure --enable-mpms-shared='prefork worker event'	# build mpm module as shared module, rather than static one (if not specified, ubuntu will use mpm_event by default)
