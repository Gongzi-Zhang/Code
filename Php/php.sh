#!/bin/bash

php -r 'echo "Hello World!\n";'
php -r 'var_dump($argv);' -- -h
# array(2) {
#   [0]=>
#   string(19) "Standard input code"
#   [1]=>
#   string(2) "-h"
# }


# server: using php as a server
php -S localhost:8000	# use current dir. as root dir.
php -S 0.0.0.0:8000	# set other interface
php -S localhost:8000 -t foo/	# specify root dir.
php -S localhost:8000 router.php    # run a php script at the start of each request
