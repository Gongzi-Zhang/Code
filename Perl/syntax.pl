#!/usr/bin/perl
# comments begin with #

IDENTIFIER:
      [_a-zA-Z][_a-zA-Z0-9]*
PHASE:
      BEGIN || 
      END ||
      INIT ||
      CHECK ||
      UNITCHECK
LABEL:
#      ^\s*IDENTIFIER\s*:

EXPR:
STATEMENT:
BLOCK:
      { STATEMENT+ }




# statement

# statement modifiers
	if, unless, while, until, for, foreach, when
STATEMENT if EXPR
STATEMENT unless EXPR
STATEMENT while EXPR
STATEMENT until EXPR
STATEMENT for LIST
STATEMENT foreach LIST
STATEMENT when EXPR

# TERMs
eval {}
sub {}
do {}

# compound statements
## flow control
## if statement
if (EXPR) BLOCK
if (EXPR) BLOCK else BLOCK
if (EXPR) BLOCK elsif (EXPR) BLOCK ...
if (EXPR) BLOCK elsif (EXPR) BLOCK ... else BLOCK

## unless statement
unless (EXPR) BLOCK
unless (EXPR) BLOCK else BLOCK
unless (EXPR) BLOCK elsif (EXPR) BLOCK ...
unless (EXPR) BLOCK elsif (EXPR) BLOCK ... else BLOCK

## given statement
given (EXPR) BLOCK

## Loop control
## while statement
[LABEL] while (EXPR) BLOCK
[LABEL] while (EXPR) BLOCK continue BLOCk
    :if the EXPR is based on any of a group of iterative expression types of:
	readline EXPR, <FILEHANDLE>, readdir DIRHANDLE, glob EXPR, <PATTERN>, HASH
    then the value yielded by the iterative operator will be implicitly assigned to $_;

## until statement
[LABEL] until (EXPR) BLOCK
[LABEL] until (EXPR) BLOCK continue BLOCk

## for statement
[LABEL] for (EXPR; EXPR; EXPR) BLOCk
[LABEL] for VAR (LIST) BLOCk
[LABEL] for VAR (LIST) BLOCk continue BLOCK

## foreach statement
[LABEL] foreach (EXPR; EXPR; EXPR) BLOCk
[LABEL] foreach VAR (LIST) BLOCk
[LABEL] foreach VAR (LIST) BLOCk continue BLOCK

## others
[LABEL] BLOCK
[LABEL] BLOCK continue BLOCK

### continue BLOCK
    :if there is a continue BLOCK, it is always executed just before the conditional is about to be evaluated again; even :when the loop has been continued via the next statement;


### PHASE: the block will run only during the corresponding phase of execution
PHASE BLOCK

# loop control statements 
	next, last, redo
#	If the LABEL is omitted, the loop control statement refers to the innermost enclosing loop.
