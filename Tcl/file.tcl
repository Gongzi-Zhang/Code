#!/usr/bin/tclsh


# file info: glob and file
# file provides three sets of functionality:
# String manipulation appropriate to parsing file names
file dirname ....... Returns directory portion of path
file extension ..... Returns file name extension
file join .......... Join directories and the file name to one string
file nativename .... Returns the native name of the file/directory
file rootname ...... Returns file name without extension
file split ......... Split the string into directory and file names
file tail .......... Returns filename without directory
# Information about an entry in a directory:
file atime ......... Returns time of last access
file executable .... Returns 1 if file is executable by user
file exists ........ Returns 1 if file exists
file isdirectory.... Returns 1 if entry is a directory
file isfile ........ Returns 1 if entry is a regular file
file lstat ......... Returns array of file status information
file mtime ......... Returns time of last data modification
file owned ......... Returns 1 if file is owned by user
file readable ...... Returns 1 if file is readable by user
file readlink ...... Returns name of file pointed to by a symbolic link
file size .......... Returns file size in bytes
file stat .......... Returns array of file status information
file type .......... Returns type of file
file writable ...... Returns 1 if file is writeable by user
# Manipulating the files and directories themselves:
file copy .......... Copy a file or a directory
file delete ........ Delete a file or a directory
file mkdir ......... Create a new directory
file rename ........ Rename or move a file or directory

## example
file atime name	    ;# returns the number of seconds since last accessed; error if the file doesn't exist or the access time can't be queired
file copy [-force] name target
file delete [-force] name
file lstat name var ;# returns the info as that from system call lstat. The results are placed in the associative array var. The indexes in var are:
file stat name var ;# returns the info as that from system call stat. The results are placed in the associative array var. The indexes in var are:
    # atime 
    # ctime ...... time of last file status change
    # dev   ...... inode's device
    # gid
    # ino   ...... inode's number
    # mode  ...... inode's protection mode
    # mtime ...... time of last data modification
    # nlink ...... number of hard links
    # size  ...... file size, in bytes
    # type
    # uid
file rename [-force] name target

# glob pattern (the same as bash glob)
#: {a,b,...} Matches any of the strings a,b, etc.
#: A "." at the beginning of a filename must match a "." in the filename. The "." is only a wildcard if it is not the first character in a name.
#: All "/" must match exactly.
#: If the first two characters in pattern are ~/, then the ~ is replaced by the value of the HOME environment variable.
#: If the first character in pattern is a ~, followed by a login id, then the ~loginid is replaced by the path of loginid's home directory.
