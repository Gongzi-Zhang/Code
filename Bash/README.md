# Manual Page

##### Most ofter used #####
CONDITIONAL EXPRESSOINS
Parameter Expansion


* OPTIONS

* INVOCATION
    |--- login shell: /etc/profile, and then the first one of
	~/.bash_profile,~/.bash_login, ~/.profile
    |
    |-- non-login shell: /etc/bash.bashrc, ~/.bashrc

* DEFINITIONS
    |--- blank	A space or tab
    |--- word	A sequence of chars considered as a single unit by
		the shell. Also known as a tokne
    |--- name	A word consisting only of alphanumeric characters
		and underscores, and beginning with an 
		alphanumeric char or an underscore. Also 
		referred to as an identifier
    |--- metacharacter
		A character that, when unquoted, separates words. 
		|   &	;   (	)   <	>   <space> <tab>
    |--- control operator
		A token that performs a control function. It is one
		of the following symbols:
		||  &	&&  ;	;;  (	)   |	|&  <newline>

RESERVED WORDS
    !	case	coproc  do   done    elif    esac    fi
    for	function    if	in  select  then    until   while
    {	}   time    [[  ]]

GRAMMAR
    |--- Simple Commands
    |--- Pipelines  
	    A pipeline is a sequence of one or more commands
	    seperated by one of the control operators | or |&.
    |--- Lists	    
           A list is a sequence of one or more pipelines separated
           by one of the operators ;, &, &&, or ||, and optionally
           terminated by one of ;, &, or <newline>
    |--- Compound Commands
	    |
	    |-- (list)	executed in a subshell environment
	    |
	    |-- { list; }   executed in current shell env.
	    |
	    |-- ((expression))	evaluate expression
	    |
	    |-- [[ expression ]]    
		evaluate conditional expression. Word splitting 
		and pathname expansion are not performed on the 
		words between the [[ and ]]; tilde expansion,
		paramter and variable expansion, arithmetic 
		expansion, command substitution, process 
		substitution, and quote removal are performed.

		Expressions can be combined in the following ways:
		    |-- ( expression )
		    |-- ! expression
		    |-- expression1 && expression2
		    |-- expression1 || expression2
	    |
	    |-- for (( expr1; expr2; expr3 )); do list; done
	    |
	    |-- select name [ in word ]; do list; done
	    |
	    |-- case word in [ [(] pattern [ | pattern ] ... ) list ;; ] ... esac
	    |
	    |-- if list; then list; [elif list; then list; ] ...  [ else list; ] fi
	    |
	    |-- while list-1; do list-2; done
	    |
	    |-- until list-1; do list-2; done
    |
    |--- Coprocesses
    |
    |--- Shell Function Definitions
COMMENTS

QUOTING
    |--- escape character
	|-- $'string' are treated specially. The word expands to string,
	    with backslash-escaped characters replaced as specified by the
	    ANSI C standard.
	    \a	    alert
	    \b
	    \e
	    \E
	    \f
	    \n
	    \r
	    \t
	    \v
	    \\
	    \'
	    \"
	    \nnn
	    \xHH
	    \uHHHH
	    \UHHHHHHHH
	    \cx	    control-x char
    |--- single quotes
    |--- double quotes
PARAMETERS
    A parameter is an entity that stores values. A variable is a paramter
    denoted by a name. The null string is a valid value.
    |
    |--- Positional Parameters
    |
    |--- Special Paramters
	|
	|-- *	Expands to the positional parameters, starting from one.
	|-- @	Expands to the positional parameters, starting from one.
	|-- #	Expands to the number of positional parameters in decimal.
	|-- ?	Expands to the exist status of the most recently executed
		foreground pipeline
	|-- -
	|-- $	
	|-- !
	|-- 0	The name of the shell or shell script.
	|-- _	the absolute pathname used to invoke the shell or shell
		script.
    |
    |--- Shell Variables
	|-- BASH
	|-- BASHOPTS
	|
	.
	.
	.
	.
    |--- Arrays
	Bash provides one-dimentsional indexed and associative array
	variables.
EXPANSION
    Expansion is performed on the command line after it has been split into
    words.
    |
    |--- Brace Expansion
    |
    |--- Tilde Expansion
    |
    |--- Parameter Expansion
	    |
	    |-- ${parameter:-word}
	    |-- ${parameter:=word}
	    |-- ${parameter:?word}
	    |-- ${parameter:+word}
	    |-- ${parameter:offset}
	    |-- ${parameter:offset:length}
	    |-- ${!prefix*}
	    |-- ${!prefix@}
	    |-- ${!name[@]}
	    |-- ${!name[*]}
	    |-- ${#parameter}
	    |-- ${parameter#word}
	    |-- ${parameter##word}
	    |-- ${parameter%word}
	    |-- ${parameter%%word}
	    |-- ${parameter/pattern/string}
	    |-- ${parameter^pattern}
	    |-- ${parameter^^pattern}
	    |-- ${parameter,pattern}
	    |-- ${parameter,,pattern}
    |
    |--- Arithmetic Expansion
	    |
	    |-- $((expression))
    |
    |--- Command Substitution
	    |
	    |-- $(command)
	    |-- `command`
    |
    |--- Process Substitution
	    It is support on systems that support named pipes (FIFOs) or the
	    /dev/fd method of naming open files. Whne available, process
	    substitution is performed simultaneously with parameter and
	    variable expansion, command substitution, and arithmetic
	    expansion.
    |--- Word Splitting
	    The shell scans the result of parameter expansion, command
	    substitution, and arithmetic expansion that did not occur within
	    double quotes for word splitting.

	    Explicit null argument ("" or '') are retained. Unquoted
	    implicit null arguments, result from the expansion of parameters
	    that have no values, are removed. If a parameter with  no value
	    is expanded within double quotes, a null argument result is
	    retained.

	    Note that if no expansion occurs, no splitting is performed.
    |
    |--- Pathname Expansion
	    After word splitting, bash scans each word for the chars *, ?,
	    and [. If one of these chars appears, then the word is regarded
	    as a pattern, and replaced with an alphabetically sorted list of
	    filesnames matching the pattern.]

	    Pattern Mathcing
		|
		|-- *
		|-- ?
		|-- [...]   character classes

    Only brace expansion, word splitting, and pathname expansion can change
    the number of words of the expansion; other expansions expand a single
    word to a single word. The only exceptions to this are the expansions of
    "$@" and "${name[@]}".

    |
    |--- Quote Removal
	    After the preceding expansions, all unquoted occurrences of the
	    charecters \, ' and " that did not result from one of the above
	    expansions are removed.

REDIRECTOIN
    |--- files
	|--- /dev/fd/fd 
	|--- /dev/stdin
	|--- /dev/stdout
	|--- /dev/stderr
	|--- /dev/tcp/host/port    
	|--- /dev/udp/host/port
    |
    |--- Redirecting Input
	[n]<word    n is the file descriptor
    |--- Redirecting Output
	[n]>word
    |--- Appending Redirected Output
	[n]>>word
    |--- Redirecting Standard Output and Standard Error
	&>word	or >&word == >word 2>&1
    |--- Appending Standard Output and Standard Error
	&>>word	== >>word 2>&1
    |--- Here Documents
	<<[-]word
	    here-document
	delimiter
    |--- Here Strings
	<<<word
    |--- Duplicating File Descriptors
	[n]<&word
	[n]>&word
    |--- Moving File Descriptors
	[n]<&digit-
	[n]>&digit-
	[n]<>word
ALIAS

FUNCTIONS

ARITHMETIC EVALUATION
    N++ N--
	    post-increment and post-decrement
    ++N --N
	    pre-increment and pre-decrement
    - +	    unary minus and plus
    ! ~	    logical and bitwise negation
    **	    exponentiation
    * / %   multiplication, division, remainder
    + -	    addition, subtraction
    << >>   left and right bitwise shifts
    <= >= < >	
	    comparison
    == !=   equality and inequality
    &	    bitwise AND
    ^	    bitwise exclusive OR
    |	    bitwise OR
    &&	    logical AND
    ||	    ligical OR
    expr?expr:expr
	    conditional operator
    = *= /= %= += -= <<= >>= &= ^= |=
	    assignment
    expr1, expr2
	    comma

CONDITIONAL EXPRESSIONS
    [[	compound command and the test and [ builtin

SIMPLE COMMAND EXPANSION
    When a simple command is executed, the shell performs the following
    expansions, assignments, and redirections, from left to right.

COMMAND EXECUTION
    After a command has been split into words, if it results in a simple
    command and an optional list of arguments, it will be executed.

COMMAND EXECUTION ENVIRONMENT
    |
    |--- open files inherited by the shell at invocation
    |--- the current working dir. 
    |--- the file creation mode mask
    |--- current traps
    |--- shell parameters
    |--- shell functions
    |--- options
    |--- aliases
    |--- various process IDs.
    
ENVIRONMENT
    
EXIT STATUS

JOB CONTROL
    Job control refers to the ability to selectively stop (suspend) the
    execution of processes and continue (resume) their execution at a later
    point.

PROMPTING
    PS1, PS2

READLINE
    This is the library that handles reading input when using an interactive
    shell.
    |
    |--- Readline Notation
    |
    |--- Readline Initialization
    |
    |--- Readline Variables
	Readline has variables that can be used to further customize its
	behavior.
    |
    |--- Readline Conditional Constructs
    |
    |--- Searching
	Readline provides commands for searching through the command history
    |
    |--- Readline Command Names
    |
    |--- Commands for Moving
	|
	|-- C-a	    Move to the start of the current line (emacs mode)
	|-- C-e	    Move to the end of the current line
	|-- C-f	    Move forward a char
	|-- C-b	    Move back a char
	|-- M-f	    Move forward to the end of the next word
    |
    |--- Commands for Manupulating the History
    |
    |--- Commands for Changing Text
    |
    |--- Killing and Yanking
    |
    |--- Numeric Arguments
	|-- digit-argument
	|-- universal-argument
    |
    |--- Completing
	|-- complete (TAB)
	|-- possible-completions (M-?)
	|-- insert-completions (M-*)
	|-- menu-complete
	|-- menu-complete-backward
	|-- delete-char-or-list
	|-- complete-filename (M-/)
	|-- possible-filename-completions (C-x /)
	.
	.
	.
    |
    |--- Keyboard Macros
	|-- start-kbd-macro (C-x ()
	    Begin saving the characters typed into the current keyboard
	    macro
	|-- end-kbd-macro (C-x ))
	    Stop saving the characters typed into the current keyboard
	    macro and store the definition
	|-- call-last-kbd-macro (C-x e)
	    Re-execute the last keyboard macro defined, by making the
	    characters in the macro appear as if typed at the keyboard.
	|-- print-last-kbd-macro ()
	    Print the last keyboard macro defined in a format suitable for
	    the inputrc file
    |
    |--- Miscellaneous
    |
    |--- Programmable Completion
	    When word completion is attempted for an argument to a command
	    for which a completion specification ( a compspec ) has been
	    defined using the complete builtin, the programmable
	    completion facilities are invoked.

HISTORY

HISTORY EXPANSION
    |
    |--- Event Designators
    |--- Word Designators
    |--- Modifiers

SHELL BUILTIN COMMANDS
    |--- source
    |--- alias
    |--- bg
    |--- bind
    |--- break
    |--- builtin
    |--- caller
    |--- cd
    |--- command
    |--- compgen
    |--- complete
    |--- compopt
    |--- continue
    |--- declare
    |--- typeset
    |--- dirs
    |--- disown
    |--- echo
    |--- enable
    |--- eval
    |--- exec
    |--- exit
    |--- export
    |--- fc
    |--- fg
    |--- getopts
    |--- hash
    |--- help
    |--- history
    |--- jobs
    |--- kills
    |--- let
    |--- local
    |--- logout
    |--- mapfile
    |--- readarray
    |--- popd
    |--- printf
    |--- pushd
    |--- pwd
    |--- read
    |--- readonly
    |--- return
    |--- set
    |--- shift
    |--- shopt
    |--- suspend
    |--- test
    |--- times
    |--- trap
    |--- type
    |--- ulimit
    |--- umask
    |--- unalias
    |--- unset
    |--- wait

RESTRICTED SHELL




# Completions
/usr/share/cmake-3.5/completions/
