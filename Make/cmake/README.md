CMake is a cross-platform build system generator. projects specify their build process with platform-independent CMakelists.txt files included in each directory of a source tree. Users build a project by using CMake to 
generate a build system for a native tool on their platform.
#
# CMake 
#
> for command: case insensitive;
> parameters are separated by space.

## Help
--help-manual <man> [<f>]
    print one help manual. [print to <f>ile if given]
--help-manual-list [<f>]
    list available manuals
--help-command-list   
    list all available commands
--help-command <command>
    help for <command>
--help-commands [<f>]
    cmake-commands manual
--help-module-list
--help-module <MOD>
--help-variable-list   
    list all built-in variables
--help-variable <variable>
    help for <variable>
--help-command cmake_policy
--help-policies
--help-policy CMP0003


# files
## CMakeCache
Variables customize how the build will be generated. They are stored
in CMake cache. This is a file named CMakeCache.txt stored at the root
of your build dir. that is generated by cmake. Variables in the 
CMake cache are 'remembered', so you do not need to type them if
you execute cmake command again. It is recommended to delete the file
CMakeCache.txt to start from a clean configuration.


# Variable
## types
> BOOL
> PATH
> FILEPATH
> STRING

variable reference is replaced by the value of the variable, or by the empty string if the variable
is not set.

Variables in CMake have a scope that is a little different from most languages. When you set
a variable it is visible to the current CMakLists file or function, as well as any subdri. CMakeLists
files, any functions or macros that are invoked, and any files that are included using the INCLUDE
command. When a new subdir. is processed ( or a function called ) a new variable scope is created
and initialized with the current value of all variables in the calling scope. Any new variables 
created in the child scope, or changes made to existing variables, will not impact the parent scope.
**To set a variable in its parents' scope**:
	set (var value PARENT_SCOPE)

CMake Scripts, when processed with cmake -P, bind variables in one dir. scope.

* Evaluation; When evaluating Variable References, CMake first searches the function call 
stack, if any, for a binding and then falls back to the binding in the current directory scope, 
if any. If a “set” binding is found, its value is used. If an "unset" binding is found, or no 
binding is found, CMake then searches for a cache entry. If a cache entry is found, 
its value is used. Otherwise, the variable reference evaluates to an empty string.

* List: Although all values in CMake are stored as strings, a string may be treated as a list in
certain contexts, such as during evaluation of an Unquoted Argument. In such contexts, a
string is divided into list elements by splitting on ; characters not following an unequal
number of [ and ] characters and not immediately preceded by a \ . The sequence \;
does not divide a value but is replaced by ; in the resulting element.
> set(srcs a.c b.c c.c ) # sets "srcs" to "a.c;b.c;c.c"
> set(x a "b;c")    # sets "x" to "a;b;c", not "a;b\;c"

# Flow Control
## If operation
**Evaluation Order**
parenthetical groups > EXISTS,COMMAND,DEFINED > EQUAL,LESS,GREATER,STREQUAL,STRLESS,STRGREATER,
    MATCHES > NOT > AND,OR (from left to right)

*True*: ON, 1, YES, TRUE, Y
*false*: OFF, 0, NO, FALSE, N, NOTFOUND, \*-NOTFOUND, IGNORE (case insensitive)
> if (variable)
	True if the var's value is not empty, 0, FALSE, OFF, or NOTFOUND
> if (NOT variable)
> if (var1 AND var2)
> if (var1 OR var2)
> if (COMMAND command-name)
	True if the given name is a command that can be invoked, useful for version checking
> if (DEFINED var)
	True if the given var has been set, regardless of what value it was set to
> if (EXISTS file-name)
> if (EXISTS dir-name)
> if (IS_DIRECTORY name)
> if (IS_ABSOLUTE name)
> if (name1 IS_NEWER_THAN name2)
> if (var MATCHES regex)
> if (string MATCHES regex)

> > numeric comparison: EQUAL, LESS, GREATER
> > lexicographic comparison: STRLESS, STREQUAL, STRGREATER
> > version comparison: VERSION_LESS, VERSION_EQUAL, VERSION_GREATER

# classes in CMake
cmake --help-property-list

## source file
### properties
ABSTRACT
COMPILE_FLAGS
        compile flags specific to this source file, specified with -D and -I flags
GENERATED
	indicates that the source file is generated as part of the build process.
OBJECTED_DEPENES
	specify additional files on which this source file should depend
WARP_EXCLUDE

## directory
### properties
ADDITIONAL_MAKE_CLEAN_FILES
	specifies a list of additional files that will be cleaned as a part of the "make clean" stage
EXCLUDE_FROM_ALL
	indicates if all the targets in this dir. and all sub dir. should be excluded from the 
	default build target or not.
LISTFILE_STACK
	useful for debugging
