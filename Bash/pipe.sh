#/bin/bash

'The unnamed pipe exist only inside the kernel and cannot be accessed by
processes that create it.' 
'When connected with a named pipe, the first command appears to hang until the pipe is connected to a second command.'

mkfifo	pipe	# create named pipe
mkfifo	pipe1 pipe2
echo -n x | cat - pipe1 > pipe2 &
cat < pipe2 > pipe1
    # this create a endless loop by copying the letter 'x' back and forth
    # between the two pipes.

## command substitution
cat <(ls -l)
    # during the execution, Bash will create a temporary named pipe to
    # stored the result of running of the subshell
ls -l >(cat)	
    # same thing. Bash create a temp named pipe, so that command inside the
    # subshell can read from it.

## examples
cat script1 script2 script3; echo "%p" | ex - oldfile
    # , as usual, to stdout. And only the results of echo will be piped to
    # ex.
(cat script1 script2 script3; echo "%p" )| ex - oldfile
    # the output of the entire sequence will make it into the pipeline.

cmp <(ls dir1) <(ls dir2)
    # compare the files in two dir.
ls | tee >(grep foo | wc > foo.count)	\
	 >(grep bar | wc > bar.count)	\
	 | grep baz | wc > baz.count
    # count the # of occurences of foo,bar,baz in one command
cat <(cat <(cat <(ls -l)))
    # nested command substitution
