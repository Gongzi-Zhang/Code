# header
############################################
# include other makefile, wildcard is allowed
include foo.make *.mk $(bar)	
## make will search files in the following dir.:
#> current dir.
#> dir. specified by -I or --include-dir in command line
#> <prefix>/include (usually /usr/local/bin or /usr/include)

# If include file is not found, make will warns about it; and finally crash if still not found after reading all makefile. To ignore those broken files, add a '-' before include:
#     -include <filename>
# add '-' to ignore command errors



# variables
############################################
CC	  := cc		# the C compiler
CFLAGS	  := -g		# optimization
CXX	  := c++	# the C++ compiler
CXXFLAGS  := -g
INCLUDES  := -I.	# contains any -I options to the compiler if there are any
LIBS	  := -L/usr/X11R6/lib -lX11	# needed libs
# F77	:= f77		# fortran compiler
SHELL	  := bash



# syntax
############################################
target: prereq1 prereq2
	commands
# default target is the first one appear in makefile if not specified in command line
# if other key is wanted, it should be declared with the built-in var: RECIPEPREFIX

## e.g.
test_link: test_link.c libmymath.so
	gcc -o test_link test_link.c libmymath.so

libmymath.so: libcubed.o libpowerfour.o
	gcc -shared -Wl,-soname,libmymath.so -o libmymath.so \
	    libcubed.o libpowerfour.o

libcubed.o: libcubed.c
	gcc -fPIC -c libcubed.c
libpowerfour.o: libpowerfour.c
	gcc -fPIC -c libpowerfour.c

.RECIPEPREFIX = ># replace default 'tab' in command line with >
all:
> echo hello world



# comment
# make use line comment, if you add comment following other words, then space before '#' will be add to that word
var = test sample   # here var = "test sample   "
## so, to define a space
nullstring :=
space := $(nullstring) # end fo the line
space := $(nullstring) $(nullstring)



# pattern
# to use %, one has to include it at least in target, otherwise this will be a regular rule; '%' matchany non-empty string
%.o: %.c
	gcc -fPIC -c $<
## the target %.o means any target with an extension .o, the portion 
## before the extension being called the stem, stem is what transferred.
## when a filename cantains '/', the dir. part will firstly be move away, 
## the left filename will be matched; if matched with the pattern, the 
## dir. part will be added back to form stem.
c%r: e%t# if you find a file src/eat, then src/a is stem, and the target will be src/car



# keyword
# virtual path to specify the dir. to search for dependencies and target fiels.
vpath <pattern> <directories>	# set search dir. for files match pattern
vpath <pattern>		# clear search dir. for files match pattern
vpath 			# clear all search dir.
## use % in pattern
vpath %.h ../include	# search .h file in dir. ../include (if not find in current dir.)
vpath %.c foo:bar	# search .c file in dir. foo, and then bar, which equal to:
vpath %.c foo
vpath %.c bar



# multitask
bigoutput littleoutput : text.g
	generate text.g -$(subst output,,$@) > $@
## which equals to 
bigoutput : text.g
	generate text.g -big > bigoutput
littleoutput : text.g
	generate text.g -little > littleoutput

## static mode
<targets...>:<target-pattern>:<prereq-patterns...>
	<commands>
# the target-pattern will choose needed targets from the given target set,
# and use them as the 'real' targets.
objects = foo.o bar.o
$(objects): %.o: %.c
	gcc -fPIC -c $< -o $@
## which equals to 
foo.o : foo.c
	gcc -fPIC -c foo.c -o foo.o
bar.o : bar.c
	gcc -fPIC -c bar.c -o bar.o



# Special targets

## Phony
#+ A phony target will always be executed
clean:
	rm *.o *.so test_link

# in case there is a file called clean in current dir. use phony (fake target) to specify 
# it explicitly
.PHONY: clean
clean: 
	rm *.o *.so test_link

.SUFFIXES:	# clear default suffixes hidden rule
.SUFFIXES: .hack .win	# add suffixes hidden rule

.IGNORE: 	# IGNORE target 
	commands goes here, and any errors during command execution will be ignored.



# Command
## make will print every command by default; to disable it, prepend @ to command
echo  show command and then execute command
@echo execute command without showing command
## command execution
## what should be kept in mind is that every command is executed in
## independent shell, without inheritence. 

# e.g.
var-lost:
	export foo=bar
	echo "foo=[$$foo]" # this example is unable to read the value of "foo", to do that:

var-kept:
	export foo=bar; echo "foo=[$$foo]"
# or
var-kept:
	export foo=bar   \
	echo "foo=[$$foo]"

# or the .ONSHELL command:
.ONSHELL:
var-kept:
	export foo=bar;
	echo "foo=[$$foo]"



# nested making
subdir:
	$(MAKE) -C subdir
# which equals to:
subdir:
	cd subdir && $(MAKE)
# to pass some variables to nested make dir., you need to "export" them; or if you 
# don't want some variables to be passed, you need to "unexport" them. With
# "export" only (no arguments), all defined variables will be passed.




# variables
# Variables are created by simple assignment and referenced by 
# enclosing the variable name in $() or ${}
export variable = value# transfer variable to sub-MAKE 
unexport variable

OBJECTS = libcubed.o libpowerfour.o
libmymath.so: $(OBJECTS)
	gcc -shared -W1, -soname, libmymath.so -o libmymath.so $(OBJECTS)

## definition
!!! note the space after words in var definition !!!
!!! one can use comment to define a space !!!
var = $(foo)# use of variable before its definition
foo = bar

### nested definition
x = y
y = z
a := $($(x))# a = $(y) = z; note that x=y, not z
### ### ### ### ### ### ### ### ### ### ###

foo := bar
var := $(foo)# variable can only be used after its definition, it a varibale used is not defined, it expand to empty string

foo ?= bar# if foo is not defined, then its value is bar; else do nothing, which equal to:
ifeq ($(origin foo), undefined)
    foo = bar
endif

foo += bar# if foo is not defined, the foo = bar; else, add bar to its original value
# += operator will inherit previour equal opeartor
foo := bar
foo += san# foo := $(foo) san

foo = bar
foo += san# foo = $(foo) san; this is recurcive definition, but make will take care of it.
ifeq ($(origin foo), undefined)
    foo := bar
else
    foo := $(foo) bar
endif

### override
override var = value# use override to change the value of variables defined in command line

### replacement
sources = foo.c bar.c
objects := $(sources:.c=.d)	# replace ending .c with .d

### define multiline var, with define keyword, multi-lines definition is allowed 
define var
echo foo
echo $(var)
endef

## target-specific (local) variable: only available within target; target here can be a pattern
prog : CFLAGS = -g
prog : prog.o foo.o bar.o
	cc $(CFLAGS) prog.o foo.o bar.o

## mode variable: variables apply to all targets that match the mode
%.o: CFLAGS = -o# define CFLAGS for all .o files
%.o: override CFLAGS = -o

## special variables
VPATH=src:../include# search path for files, separated by :, current dir. always comes first.

## environment variables
## environmental variables will be inherited when invoking make, but it we define new values in Makefile or in command line, then the new value will override the old one. (with -e option in command line, environmental variable will override the one defined in Makefile)
MAKEFILES
    shell environment variable, if defined, its value will be included automatically as makefile. 
    Though, target from the makefiles included from "MAKEFILES" will not *works*, and errors 
    among them will also be ignored.
    Sometimes, when you found something strange from make, maybe you can check this environment 
    variable.
VPATH
    search path for include
    VPATH = src:../headers#

## automatic variables
$$	# '$' char
$@, $(output), $(target)
	Expands to the filename of the target
$(outputs), $(targets)
	multiple output files
$%	Expand to target when target is library file
$<, $(input), $(dependency)
	Expands to the first file in the prerequisites
$(inputs), $(dependencies)
	multiple input files
$?	Refer to all the prerequisite that is newer than target
$^ 	Expands to the "all" files in the prerequisites, and remove repeated
$+ 	Expands to the "all" files in the prerequisites, keep repeated
$*	Refer to what is matched by %. if the target doesnt include pattern, but its name extension is recognized by make, the this variable expand to the name except the extension (GNU make extension).
### you can add D/F to above variable to get dir/file name; for example:
$(@D) and $(@F)	
	Refer to the dir and file name of $@
$(<D) and $(<F)	
	The same with the above one
$(%D), $(%F)
$(^D), $(^F)
$(*D), $(*F)
$(+D), $(+F)
$(?D), $(?F)

test_link: test_link.c libmymath.so
	gcc -o $@ $^

libmymath.so: $(OBJECTS)
	gcc -shared -W1, -soname, $@ -o $@ $(OBJECTS)



# Judgement and loop, using the Bash grammer.
# for contditional expression, make will decide execution clause when reading makefile; so you'd better NOT use automatic variables (like $@) in conditional expressions, because they donot get value until actul running.
ifeq ($(CC),gcc)
# ifeq'<arg1>' '<arg2>'
# ifeq"<arg1>" "<arg2>"
# ifeq'<arg1>' "<arg2>"
# ifeq"<arg1>" '<arg2>'
    libs=$(libs_for_gcc)
else
    libs=$(normal_libs)
endif

ifneq (arg1, arg2)
    @echo arg1 not equal to arg2
endif

ifdef var
    @echo var is defined
else
    @echo var is not defined
endif
foo = 
ifdef foo
    frobozz = yes
else
    frobozz = no
endif## frobozz = no

ifndef var
    @echo var is not defined
endif



# functions 
## define func
define func
	echo $(firstword $^)
	@echo "Error message"
endef
## call a func
    $(function arguments)	#separate arguments with ","

## some build-in functions:

### string operation
$(subst <from>,<to>,<text>)	# substitution

$(patsubst <pattern>,<replacement>,<text>)	# pattern substitution
$(var:<pattern>=<replacement>) == $(patsubst <pattern>,<replacement>,$(var))
$(var:<suffix>=<replacement>) == $(patsubst %<suffix>,%<replacement>,$(var))
foo := a.o b.o c.o
bar := $(foo:.o=.c)	# a.c b.c c.c
bar := $(foo:%.c=%.c)	# static mode

$(strip <string>)		# remove beginning and ending space around string
$(findstring <find>,<in>)	# find string <find> in <in> string; if find, return <find> string; if not, return empty string
$(filter <pattern>,<text>)	# return string in <text> that match <pattern>
$(filter-out <pattern>,<text>)
$(sort <list>)			# sort and uniq
$(word <n>,<text>)		# take out the <n>th word in <text>, if <n> exceeds the number of word in <text>, then return empty string
$(wordlist <s>,<e>,<text>)	# <s> and <e> are numbers. If <s> is larger than the total word number in <text>, then return empty string; if <e> is larger than the total word number, then return wordlist begin from <s>, up to the end of <text>
$(words <text>)			# count the number of word
$(word $(words <text>),<text>)	# take out the last word in <text>
$(firstword <text>) == $(word 1,<text>)

### file manipulation
$(dir filepath)			# dirname, if no '/' found, return './'
$(dir src/foo.c hacks)		# return: src/ ./

$(notdir filepath)		# non-dir name
$(notdir src/foo.c hacks)	# return: foo.c hacks

$(suffix <filepath...>)		# if no suffix, return empty string
$(addsuffix <suffix>,<names...>)
$(addsuffix .c,foo bar)		# foo.c bar.c

$(basename <names...>)		# prefix 
$(basename src/foo.c hacks)	# return: src/foo hacks
$(addprefix <prefix>,<names...>)

$(join list1,list2)             # append word in list2 to corresponding word in list1; the unmatched words will bekept intact
$(join aaa bbb, 111 222 333)	# return: aaa111 bbb222 333
$(join aaa bbb ccc, 111 222)	# return: aaa111 bbb222 ccc

### Miscellaneous
$(shell echo src/{00..99}.txt)  # it will fork a new shell process to execute shell command; note use space rather than "," to seperate arguments in shell command

$(wildcard src/*.txt)		# wildcard glob
objects = *.c	    		#_will not expand *.o here, the value of objects is *.o_
objects := $(wildcard *.c)	# this expression will expand *.c; list all .c file
$(patsubst %.c,%.o,$(wildcard *.c))	# list all corresponding .o files in above expression

$(foreach var,list,evaluation) 	# foreach: for each var in list, do evaluation; return the whole string compose of resulted string from each loop
$(foreach n,a b c d,$(n).o)	# a.o b.o c.o d.o

$(if condition,then-part)
$(if condition,then-part,else-part)

$(call expression, parm1, parm2, ..., parmn)	# use parm as $(1), $(2)...
reverse=$(2) $(1)
$(call reverse, a, b)		# b a

$(origin var)                   # where is var defined
##+ return value:
    undefined	
    default			# e.g. CC
    environment
    file			# defined in makefile 
    command line
    override
    autimatic

#+ ) error
$(error <text>)			# prompt an error message and exit; Note that error function will not be executed until they are called, so you can use it as the definition of a variable
ERR = $(error found an error!)	# use as definition, not executed immediately
.PHONY: err

err:; $(ERR)			# error executed here

$(warning <text>)		# prompt a warning message and continue running



# hidden rules
## e.g.
foo: foo.o bar.o
	cc -o foo foo.o bar.o $(CFLAGS) $(LDFLAGS)
## here we don'e specify rules for foo.o and bar.o, but make has hidden rules for object files, which is:
foo.o : foo.c
	cc -c foo.c $(CFLAGS)
bar.o : bar.c
	cc -c bar.c $(CFLAGS)
## if you really don't want hidden rules, then write explicit rules rather than only dependency
foo.o : foo.p
# here we specify foo.o depending on foo.p, but make will search its hidden rules; if it find foo.c, then the dependency:
foo.o : foo.c
## will be used, rather than what we give out, because the .o:.c hidden rule has higher priority than .o:.p

# dafault .suffixes list:
# .out, .a, .ln, .o, .c, .cc, .C, 
# .p, 
# .f, .F, .r, 
# .y, .l, 
# .s, .S, .mod, .sym, .def, .h, 
# .info, .dvi, .tex, .texinfo, .texi, .texinfo, .w, .ch, .web, .sh, .elc, .el

## 1. c 
<n>.o: <n>.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS)

## 2. c++
<n>.o: <n>.cc (<n>.C)
	$(CXX) -c $(CPPFLAGS) $(CFLAGS)

## 3. pascal
<n>.o: <n>.p
	$(PC) -c $(PFLAGS)

## 4. Fortran/Ratfor
<n>.o: <n>.r (<n>.F or <n>.f)
	.f $(FC) -c $(FFLAGS)
	.F $(FC) -c $(FFLAGS) $(CPPFLAGS)
	.r $(FC) -c $(FFLAGS) $(RFLAGS)

## 5. Modula-2
<n>.sym: <n>.def
	$(M2C) $(M2FLAGS) $(DEFFLAGS)
<n>.o: <n>.mod
	$(M2C) $(M2FLAGS) $(MODFLAGS)
	
## 6. Assemble
<n>.o: <n>.s
	$(AS) $(ASFLAGS) 
<n>.s: <n>.S
	$(AS) $(ASFLAGS)

## 7. object file
<n>: <n>.o
	$(CC) $(LDFLAGS) <n>.o $(LOADLIBES) $(LDLIBS)

## 8. Yacc C
<n>.c: <n>.y
	$(YACC) $(YFLAGS) 

## 9. Lex C
<n>.c: <n>.l
	$(LEX) $(LFLAGS)

## 10. Lex Ratfor
<n>.r: <n>.l
	$(LEX) $(LFLAGS)

## 11. Lint lib.
<n>.ln: <n>.c
	$(LINT) $(LINTFLAGS) $(CPPFLAGS) -i

## hidden variables
### compiler
AR  = ar	# package lib.
AS  = as        # assemble compiler
CC  = cc	# C compiler
CXX = g++	# C++ compiler
CO  = co	# rcs file
CPP = $(CC) -E	# C Pre-Processor
FC  = f77	# Fortran and Ratfor compiler
GET = get	# SCCS extended file
LEX = lex	# LEX analyser; for C or Ratfor
PC  = pc	# Pascall compiler
YACC= yacc	# Yacc grammer analyser, for C
YACCR=yacc -r	# Yacc grammer analyser, for Ratfor
MAKEINFO = makeinfo	# texinfo -> makeinfo
TEX = tex	# TeX compiler
TEXI2DVI = texi2div	# texinfo -> TeX DVI
WEAVE = weave	# Web -> TeX
CWEAVE = cweave	# C Web -> TeX
TANGLE = tangle	# C Web -> Pascal
CTANGLE = ctangle	# C Web -> C
RM  = rm -f	# remove
### flags
ARFLAGS	= rv
ASFLAGS = 
CFLAGS  =
CXXFLAGS=
COFLAGS =
CPPFLAGS=
FFLAGS  =
GFLAGS 	=	# GET
LDFLAGS =	# ld
LFLAGS  =	# Lex
PFLAGS  =	# Pascal
YFLAGS  =	# Yacc

### override hidden rule
%.c : %.c
	$(CC) -c $(CPPFLAGS) $(CFLAGS) -D$(date)

### remove one hidden rule
%.o : %.s	# without following compile command

## examples
ifeq (0, ${MAKELEVEL})
cur-dir		:= $(shell pwd)
whoami		:= $(shell whoami)
host-type       := $(shell arch)
MAKE		:= $(MAKE) host-type=${host-type} whoami=${whoami}
endif

# C specific
main : main.c
	cc -M main.c	# automatically find all header files in main.c
	cc -MM main.c	# for GCC
