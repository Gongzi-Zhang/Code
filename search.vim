" Special chars in Vim "
    .   " match any char
    *   " RE modifier
    []	" match any one withing []
    ^	" begin of line
    %	
    /
    \	" escape char
    ?	" match previous char 0 or 1 time
    ~
    $	" end of line
\[special char]	    " to match special char
In regular expressions,you must backslash 
\+ \| \( \) \{ \}	" which are not special chars
    


" line address "
1,$	    " all lines
x,y	    " lines x through y
x;y	    " lines x through y, with current line reset to x
0	    " top of file
.	    " current line
n	    " absolute line number n
$	    " last line
%	    " all lines
x-n	    " n lines before x
x+n	    " n lines after x
-[n]	    " one or n lines previous
+[n]	    " one or n lines ahead
'x	    " line marked with x
''	    " previous mark
/pat/|?pat? 
	    " ahead or back to line where pat matches.



" offset "
[num]
+[num]	    " down [num] lines
-[num]	    " up [num] lines
e	    " end of the match
e[num]	    " end of the match, then move [num] chars, + for right, - for left
b
s	    " start of the match
b[num]
s[num]	    " same as e[num]



" regular expressions "
""""""""""""""""""""""""""""""""""""""""""""
	       Sinple Atoms
x	    " literal x
^	    " start of line
$	    " end of line
.	    " a single char
\<	    " start of a word
\>	    " end of word
	    " The beginning or end of a word is determined either by a
	    " punctuation mark or by a space.
~           " matches the last given substitute string (replacement)
""""""""""""""""""""""""""""""""""""""""""""
		Range Atoms
[abc]	    " match either 'a','b' or 'c'
[^abc]	    " match anything except 'a','b','c'
[a-z]	    " match char from 'a' through 'z'
[a-zA-Z]    " match char from 'a' through 'z' and 'A' through 'Z'
[]abc]	    " to match literal ']', place it first in the list
[ab^cd]	    " to match literal '^', place it anywhere but first
[abc-]	    " to match literal '-', place it last
""""""""""""""""""""""""""""""""""""""""""""
		   Class
[[:upper:]]	" Uppercase chars
[[:lower:]]	" lowercase chars
[[:digit:]]	" digit
[[:alnum:]]	" all letters and digits
[[:alpha:]]	" letters
[[:ascii:]]	" ASCII chars
[[:backspace:]]	" <BS>
[[:blank:]]	" space and tab
[[:cntrl:]]	" control chars
[[:escape:]]	" <Esc>
[[:graph:]]	" printable chars, excluding space
[[:print:]]	" printable chars, including space
[[:punct:]]	" punctuation chars
[[:return:]]	" end-of-line (<CR>, >Enter>, <NL>)
[[:space:]]	" whitespace chars
[[:tab:]]	" <Tab>
[[:xdigit:]]	" hexadecimal digits

\123		" Octal number
\x123		" Hexadecimal number
\a		" alphabetic chars (a-zA-Zi)
\A		" Non-alphabetic chars
\b		" <BS>
\c		" ignorecase
\C		" opposite ot \c
\d		" digit
\D		" non-digit
\e		" <Esc>
\f		" chars defined in 'isfname' option
\F		" non-'isfname'
\h		" head of word char (A-Za-z_)
\H		" non-head of word char
\i		" chars defined in 'isident'
\I		" non-'isident'
\k		" 'iskeyword'
\K		" non-'iskeyword'
\l		" lowercase (a-z)
\L		" non-lowercase
\n		" new line 
\o		" octal digit (0-7)
\O		" non-octal chars
\p		" 'isprint'
\P		" non-isprint
\r		" <CR>
\s		" whitespace(<Space> or <Tab>)
\S		" non-whitespace
\t		" <Tab>
\u		" uppercase
\U		" non-uppercase
\v		" very magic, means all characters after \v except '0-9' 'a-z' 'A-Z' '_' have special meaning.
\V		" Non-magic
\w		" word chars (0-9a-zA-Z_)
\W		" non-wrod chars
\x		" hexadecimal digits
\X		" non-hexadecimal chars
\@!		" match with zero-width if no match for previous item.

""" Note that the breckets in these class([:class:]) names are part of
""" the symbolic names, and must be included in addition to the breackets
""" delimiting the bracket expression. "
""" The reason why class need two braket [[]] is that [:class:] represent
""" a class, which is just a collection of chars. Enclosing them in  "
""" another [ ] means match any one of them. "
""" Another explain for double braket "[[]]" is that [:class:] itself 
""" will be regarded as range rather than class "
""""""""""""""""""""""""""""""""""""""""""""
		Sub Patterns
\(pattern\) " Mark the pattern for later use.
	    " save the pattern enclosed between \( \) into a special 
	    " holding space or 'hold buffer'
\1	    " matches the same string that was matched by the first 
	    " sub-expression in \( \)
\2	    " like '\1', but uses second sub-expression
\9	    " like '\1', but uses ninth sub-expression
&	    " replaced with the entire text matched by the search pattern
	    " when used in a replacement string.
""""""""""""""""""""""""""""""""""""""""""""
		 Modifiers
*	    " match the previous atom 0 or more times,as much as possible
\+	    " 1 or more times, as much as possible
\=	    " 0 or 1 time
\{}	    " 0 or more times, same as '*'
\{n}	    " exactly n times
\{n,m}	    " n to m times
\{n,}	    " at least n times
\{,m}	    " no more than m times
\{-n,m}	    " n to m times, as little as possible
\{-n,}	    " at least n times, as little as possible
\{-,m}	    " up to m times, as little as possible
\{-}	    " 0 or more times, as little as possible
str1|strl2  " str1 or str2
""""""""""""""""""""""""""""""""""""""""""""
		Grouping and Backreferences
&	    " the whoel matched pattern
\0	    " the whoel matched pattern
\N	    " the matched pattern in the N pair \(\)
~	    " the previous substitute string
\L	    " the following characters are made lowercase
\U	    " the following characters are made uppercase
\E,\e	    " end of \U and \L
\r	    " split line in two at this point
\l	    " next character made lowercase
\u	    " next character made uppercase
""""""""""""""""""""""""""""""""""""""""""""
		Operator Precedence
Precedence	Regexp		Description
    1		\(\)		    grouping
    2	    \=,\+,*,\{n}..	    quantifiers
    3	      abc\t\.\w		    sequence of characters
    4		 \|		    alternation
""""""""""""""""""""""""""""""""""""""""""""
""" if one regular expression modifier match pattern as little as possible,
""" then the larger option is completely useless, because for a string that
""" can match a pattern m(m>n) times, then the modifier make the expression
""" will match only n times, which makes the upper limits for such matching
""" needless, we can use excat n times matching to do work.
""" therefore:
\{-n,m}  =  \{-n,}  =	\{n}
\{-,m}   =  \{-}    =	\{0}
""""""""""""""""""""""""""""""""""""""""""""



" Examples "
/joe/e			
    " cursor set to End of match
3/joe/e+1		
    " find 3rd joe and set cursor to End of match plus 1
/joe/s-2		
    " set cursor to Star of match minus 2 
/joe/+3			
    " find joe move cursor 3 lines down
/^joe.*fred.*bill/	
    " find joe AND fred AND bill(joe at start of line)
/^[A-J]/		
    " search for lines beginning with one or more A-J 
/begin\_.*end		
    " search over possible multiple newline
/fred\_s*joe/		
    " any whitespace including newline
/fred\|joe/		
    " search for fred OR joe
/.*fred\&.*joe/		
    " search for fred AND joe in any ORDER
/\<fred\>/		
    " search for exactly fred as a word
/\<\d\d\>/		
    " search for exactly two digit numbers
/\<\d\{4}\>/		
    " same thing
/\(^str.*\n\)\{2}	
    " search for 2 successive lines starting with str

/\([^,]*,\)\{8}		
    " repeating the regexp, rather than the Regexp finds

" \zs and \ze
/<\zs[^>]*\ze>		
    " \zs set the star of the match(highlight part) and \ze set the end of the match(explanation: the whole pattern except \zs and \ze will be matched, but only the part between \zs and \ze will be shown in result. Note, only the last \zs and \ze work!

" \@=
/foo\(bar\)\@=		
    " match foo in "foobar". Note: with "\@=", the atom preceding it will actually not be match,(it is just exit to check weather a match is possible), so /foo\(bar\)\@=foo will not match "foo" in "foobarfoo", because the pattern try to find foo where the bar stands
/<\@<=[^>]*>\@=		
    " search for content included in tags
/<\@=[^>]*>\@=		
    " search for contents included in tags, including left tag, compared with last searching pattern, we can speculate that the left tag "<" in "\@<=" shift the left tag before it,which is match from the position next the previous content.
/<\@<=\_[^>]*>\@=	
    " search for multiple line contents
/\c\v([^aeiou]&\a){4}	
    " search for 4 consecutive consonants
/\%>20l\%<30lgoat/	
    " search for goat between line 20 and 30
:%s/home.\{-}\zshome/alone	
    " substitute only the 2nd occurrence in a line of "home" 

" find str but not on lines containing tongue
/^\(.*tongue.*\)\@!.*nose.*$
/\v^((tongue)@!.)*nose((tongue)@!.)*$
/.*nose.*\&^\%(\%(tongue\)\@!.\)*$



" substitution "
:%s//joe/igc		
    " substitute what you last searched for
:%s/\r//g		
    " delete DOS return ^M
:%s/\r/\r/g		
    " Turn DOS returns ^M into real returns  ???
:%s=  *$==		
    " delete end of line blanks
:%s= \+$==		
    " same thing
:%s/\v(.*\n){5}/&\r	
    " insert a blank line every 5 lines
:%s/[\x00-\x1f\x80-\xff]//g	
    " delete non-ascii chars
:%s/[<C-V>128-<C-V>255]//g
    " delete DOS returns
:%s/[Ctrl-V][Enter]//g
    " Calling a VIM function "
:s/__date__/\=strftime("%c")/	
    " insert datestring

:%s:\(\(\w\+\s\)\{2}\)str1:\1str2:
    " Working with Columns sub any str1 in col3
:%s:\(\w\+\)\(.*\s\+\)\(\w\+\)$:\3\2\1:
    " Sawpping first & last column (4 cloums)

:%s/\d\+/\=(submatch(0)-3)/
    " Decrement numbers by 3
:g/loc\|functions/s/\d/\=submatch(0)+6/
    " increment numbers by 6 on certain lines only
:%s/txtdev\zx\d/\=submatch(0)+1/g   " better
:%s#\(gg\)\@<=\d\+#\=submatch(0)+6# " increment only numbers gg\d\d by 6
:let i=10 | 'a,'bg/Abc/s/yy/\=i/ | let i=i+1
:s#all/\zs.*#\=substitute(submatch(0),'/','_','g')#
    " rename a string with an incrementing number
:%s/.*/\='cp '.submatch(0).' all/'.substitute(submatch(0),'/','_','g')/
    " substitute inside substitution
   
" Operate until string found
d/fred/			    " delete until fred
y/fred/			    " yank until fred
c/fred/e		    " change until fred end
v12|			    " visualise/change/delete to column 12

" pattern "
" Note that different match may have different pattern rule, like the
" search pattern is different from the aucommand pattern.
