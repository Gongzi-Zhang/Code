# How chrome work
[How Browers Work](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork/)

+-------------------------------+       +-----------+
|				|       |           |
|        User Interface		|       |           |
|				|       |           |
+-------------------------------+       |           |
	  |		     |          |           |
          |		     |          |           |
	 \ /           	     |          |           |
+-------------------+  	     |          |           |
|                   |  	     |          |   Data    |
|  Browser engine   |------------------>|Persistence|
|                   |  	     |          |           |
+-------------------+  	     |          |           |
          |                  |          |           |
	  |            	     |          |           |
	 \ /           	    \ /         |           |
+-------------------+   +----------+    |           |
|                   |   |          |    |           |
| Rendering engine  |-->|UI Backend|    |           |
|                   |   |          |    |           |
+-------------------+   +----------+    |           |
     |            |                     |           |
     |	          |                     |           |
    \ /          \ /                    |           |
+----------+ +-----------+              |           |
|          | |JavaScript |              |           |
|networking| |Interpreter|              |           |
|          | |           |              |           |
+----------+ +-----------+              +-----------+
	 

**Chrome run multiple instance of the rendering engine: one for each
tab. Each tab runs in a seperate process.**

## rendering engine
Different browsera use different rendering engines:
Browser	    Engine
* IE	    Trident
* Firefox   Gecko
* Safari    Webkit
* Chrome    Blink ( a fork of WebKit)

+--------------+    +--------------+    +--------------+    +--------------+
| Parsing HTML |    | Render tree  |    | Layout of    |    | Painting the |
| to construct |===>| construction |===>| the render   |===>| render tree  |
| the DOM tree |    |		   |    | tree         |    |		   |
+--------------+    +--------------+    +--------------+    +--------------+


## Parsing
lexical analysis ---> syntax Analysis ---> Parse Tree
* lexical analysis: break input into token
* syntax analysis: check if the input match the syntax rules.

- vocabulary: all chars that can be used (usually expressed by RE)
- token: combination of chars as a unit in syntax analysis
- syntax: how tokens are organized
- grammar: the combination of vocabulary and the syntax rule

### Example
A simple mathematical language:

Vocabulary: integers, plus and minus sign   
    expressed in RE: INTEGER: 0|[1-9][0-9]\*; PLUS: +; MINUS: -

Syntax:
1. The language syntax building blocks are expressions, terms, and
   operations.
2. It can include any number of expressions
3. An expression is defined as a "term" followed by an "operation" 
   followed by another term. 
4. An operation is a plus token or a minus token
5. A term is an integer token or an expression
BNF format:
- expression := term operation term
- operation := PLUS | MINUS
- term := INTEGER | expression

input: 2 + 3 - 1
Parsing: firstly, substring "2" matches rule #5, it is a term. Then, the
second match is 2 + 3, according to rule #3; the next match will only be hit
at the end of the input 2 + 3 - 1 is an expression.

input2: 2 + +
Parsing: It doesn't match any rule, so it is an invalid input.

### Parser
* top down parser: examine the high level structure of the syntex
* bottom up parser: starting from the low level rules until high level rules are met.

The bottom up parser will scan the input until a rule is matched. It will
then replace the matcing input with the rule. The partly matched expression
is placed on the parser's stack.
While the top down parser will start from the higher level rule: it will
identify 2 + 3 as an expression. It will then identify 2 + 3 - 1 as an
expression ( the process of identifying the expression evolves, matching the
other rules, but the start point is the highest level rule ???)
