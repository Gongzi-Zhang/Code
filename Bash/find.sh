# findutils

# usage examples
# find DIR criteria action
find path1 [path2...] criteria action
find <path> -name <searchstring>

## examples
# size
find . -size +5000k	# find files bigger then 5MB
find . -size -1G
# for GNU find, this doesn't mean files whose size less than 1G, but that the number of G (round up) for a file less than 1, so this find only 0 size file, because any file less than 1G will be round up to 1G (just think of a 1G block), therefore, to do the job, one should use:
find . -size -2G
find . -size -1024M

find . -type f -size +10485760c
    # find files larger than 10 megabytes	# without the tailing C, the argument would be interpreted as a number of blocks, which are generally 512 bytes
find . -mtime -1
    # find files that were modified within the last day
find . -mtime +30
    # find files older than 30 days
find . -mtime 30
    # find files that are exactly 30 days old
find . -mtime 1
    # find files that were modified one day ago
find . -mmin(amin, cmin) 30
    # measure time in minutes
find . -newer /var/log/backup.timestamp -print

find . -type f -mtime +120 -mmin -480 -exec more {} \;
    # ls all files that are modified in the past 2 to 8 hours.

find . -ftype f	
    # find out regular files
find . -type f -atime -30 -exec mv {} ../ \;	
    # find all files that is visited within 30 days and move them to upper dir.

# -perm
find . -perm 0644 -print    # files with exactly these permission
find . -perm -0644 -print   # files include such permission
find . -perm /0644 -print   # files with any of the permission
find . -perm /6000 -print   # files with SUID permission
find . -perm -o=r -print

# bulk operation
if not specify, find will apply action to the file each time it finds
a file satisfy the criteria, which is slow and time-wasting. To apply 
action to all the found files( but not one by one), one can use +

find . -name '.jpg' -exec rm {} +
# this will rm all found jpg file with one rm command another way to do bulk job is to use xargs, but be careful with it, xargs is a dangerous UNIX command, it will parse each word from the file name and even parses quotation marks. To prevend such possible bad side effect, there comes a walkaround: -print0 | xargs -0 -print0 will tell find to tail each found result with NUL char (ASCII 00) rahter than its default '\n', and the -0 option tell xargs to read NUL-delimited words instead of space-delimited ones.

# glob
# find uses globs to express filename-matching patterns. So we had to 
# quote the glob in order to prevent the shell from expanding it.
find . -name '*.jpg' -print 
# parentheses
# enclose things in parentheses when you want them to be treated as a 
# single unit.
find . \( -name '*.mp3' -o -name '*.jpg' \) -print

# logical and
# If you want a file to meet multiple criteria, you can specify 
# multiple flags. There is an implicit logical 'and' any time you put
# two filters together without the -o in between them:

# in find, -a and -o is not equivalent, -a take precedence over -o
find . -false -o -false -a -printf 'nope\n' -o -printf 'yep\n' -o -printf 'nope\n'
<yep>
which equal to :
find . -false \( -false -a -printf 'nope\n' \) -o -printf 'yep\n' -o printf 'nope\n'

find . -true -o -false -a -printf 'yep\n'
<no output>

find . -name '*.autosave.*' -o -name '*.bak' -a -print
 this will only print out files whose name end with .bak
find . -name '*.autosave.*' -o -name '*.bak'	# equal to
find . \( -name '*.autosave.*' -o -name '*.bak'	\) -a -print
 


# -name
# this option matches only the file's name inside of the deepest dir.
# so:
find -name 'foo.*' -print
# will match only foo.jpg, but not foo/bar.jpg
# -path
# if we want to look at the dir name, we must use the -path filter:
find . -path 'bar*' -print  # no output
find . -path './bar*' -print	# -path looks at the entire pathname (see what we get in the output of find -print), which contains the leading ./ in the pathname.

## -exec COMMAND {} \;
find -type f -atime +5 -exec rm {} \;
# curly brackets are placeholder for the path name output by find
# the command is terminated by a semicolon (;), so we need to protect
# it from being interpreted by bash with '\'

## bash command
find . -type f -name '*.ext' -exec bash -c 'name=${1##*/}; echo "$name  -> ${name^^}"' _ {} \;
    # in the above command, the '_' in the bash command is used as $0 for
    # the bash script, otherwise, the first result of find will be used
    # as $0. Just a placeholder.

# rm badnamed files ( containing non-alphabetical chars or space )
find . -name '*[+{;"\\=?~()<>&*|$ ]*' -maxdepth 0 -exec rm -f '{}' \;

# inode number
find . -inum $inum -exec rm {} \;

# permission
permissions="+4000"
find . -perm "$permissions"

# exclude path
find . -type -f -name "*.csh" -not -path "./tmp/*" -not -path "./script/*"
# note the * under each excluded dir

# -prune
" If the current file is a dir, and the -prune operator is evaluated, 
then find won't descend into that dir. Thus -prune allows skipping 
subdir and their contents 
But -prune doesn't disable the implicit -print, so "
    find . -name foo -prune	
    $ ./foo	    # this dir. is not descended
    $ ./bar/bar/foo
" will still print all found files "

find . -path ./misc -prune -o -name '*.txt' -print
# exclude ./misc, because in find, -prune is an action, that acts on 
# the criteria -path ./misc


# delete file
find . -name "*.csh" -delete # only suitable for files, not dir
## delete multiple files
find . -name "*.csh" -o -name "*.py" -delete # will only delete the last find file in each dir, to delete all:
find . \( -name "*.csh" -o -name "*.py" \) -delete
## delete dir
find . -name "tmp" -exec rm -r {} + 
## delete all the files except one
find . ! -name 'file.txt' -type f -exec rm -f {} +
## explanation
mtime = last modification time
ctime = last status change time ( via 'chmod' or otherwise)
atime = last access time

