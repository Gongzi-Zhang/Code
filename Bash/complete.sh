# The Bash 'complete' and 'compgen' builtin make it possible for tab 
# completion to recognize partial parameyters and options to commands

# e.g.
touch sample_command
touch file1.txt file2.txt file3.txt file4.txt file5.zzz
chmod +x sample_command
complete -f -X '!*.txt' sample_command
# the -f option to complete specifies filenames, and -X the filter pattern.

# completion options
local cur   # var that hold current completion wrods
COMPREPLY()

cur=${COMP_WORDS[COMP_CWORD]}

case "$cur" in 
    -*)
	COMPREPLY=( $( compgen -W '-a -d -f -l -t -h --aoption \
	--debug --file --log --test --help --' -- $cur ))
	;;
esac
