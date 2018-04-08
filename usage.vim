 " A very intelligent turtle
 "    Found programming UNIX a hurdle
 "    The system, you see,
 "    Ran as slow as did he,
 " And that's not saying much for the turtle.



" What's the meaning of life, universe and everything
:h 42
:h holy-grail
:h!

:runtime! syntax/2html.vim	" convert txt to html file

" help for help
:h tips			" Vim's own Tips Help
:h :r			" normal mode
:h /\r			" what's \r in a regexp
:h \\zs			" find help for \zs
:h i_CTRL-R		" help for <C-R> in insert mode
:h c_CTRL-R		" help for say <C-R> in command mode
:h v_CTRL-V		" visual mode
<C-]>			" jump to {keyword} under cursor in help file
<C-T>			" pop tag, go back to the preceeding screen
:h -			" vim command arguments
:h 'some'		" vim command Options
:h virtualedit		" an convenient option for editing tables
" DOUBTS virtualedit : when in virtualedit mode, choose some blank space
" through <ctrl-V> method, and then try to insert something by means of
" p,you will end with completely disater--memory corruption.


" smart editing
:set virtualedit=all	
    " make vim able to move cursor to positions where there isn't any text. Which is also called virtual space.


" Searching
^.*%?~$			
    " special chars for searching
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

" using regexp memory in a search 
/\(fred\).*\(joe\).*\2.*\1  
    " what the regexp memory (\2 \1) record is the finding result from previous searching pattern.

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


/^			
    " Begining of line
/$			
    " End of line
/\a			
    " alphabetic char, a-zA-Z
/\A			
    " Non-alphabetic char
/\n			
    " new line 
/\c			
    " ignorecase
/\C			
    " opposite ot \c
/\d			
    " digits
/\D			
    " Non-digits
/\f			
    " file-name characters(those allowed for usage in file naming )
/\r			
    " match <CR>
/\v			
    " very magic, means all characters after \v except '0-9' 'a-z' 'A-Z' '_' have special meaning.
/\V			
    " Non-magic
/\@!			
    " match with zero-width if no match for previous item.
/\{-}			
    " non-greedy matching, match as little as possible; for example , /[a-z]\{-} will match 'cx' in 'cxcx' rather than the whole string, but something stange is that if we add some letter before cx, it will be matched by the searching pattern? if it's really match as little as possible, it should match only 'x' in 'cxcx', isn't it????


/\=			
    " match 0 or 1 preceeding atoms

" best-substitution
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

    " clean both trailing spaces AND DOS returns
:%s/\v(.*\n){5}/&\r	
    " insert a blank line every 5 lines
:%s/[\x00-\x1f\x80-\xff]//g	
    " delete non-ascii chars
:%s/[<C-V>128-<C-V>255]//g



" Calling a VIM function
:s/__date__/\=strftime("%c")/	
    " insert datestring

" Working with Colums sub any str1 in col3
:%s:\(\(\w\+\s\)\{2}\)str1:\1str2:
" Sawpping first & last colum (4 cloums)
:%s:\(\w\+\)\(.*\s\+\)\(\w\+\)$:\3\2\1:

" Decrement numbers by 3
:%s/\d\+/\=(submatch(0)-3)/
" increment numbers by 6 on certain lines only
:g/loc\|functions/s/\d/\=submatch(0)+6/
:%s/txtdev\zx\d/\=submatch(0)+1/g   " better
:%s#\(gg\)\@<=\d\+#\=submatch(0)+6# " increment only numbers gg\d\d by 6
" rename a string with an incrementing number
:let i=10 | 'a,'bg/Abc/s/yy/\=i/ | let i=i+1
:s#all/\zs.*#\=substitute(submatch(0),'/','_','g')#
" substitute inside substitution
:%s/.*/\='cp '.submatch(0).' all/'.substitute(submatch(0),'/','_','g')/

" useful Global command
:g/pattern/#		    " show line numbers
:g!/^dd/d		    " delete lines not containing string
:v/^dd/d		    " same
:g/joe/,/fred/d		    " delete from joe to fred, NOT line based
:g/-------/.-10,.d	    " delete string & 10 previous line
:v/./,/./-j		    " compress empty lines
:g/^$/,/./-j		    " same
:g/^/m0			    " reverse file
:g/^/t.			    " duplicate every line
:g/fred/t$		    " copy (transfer) lines matching fred to EOF
:g/fred/t'a		    " copy (transfer) lines matching fred to marker a                    
:g/^Chapter/t. | s/./-/g    " Automatically underline selecting headings

" incrementing numbers ( type <c-a> as 5 characters )
:.,$g/^\d/exe "norm! \<c-a>"    
    " increment numbers
:'a,'bg/\d\+/norm! ^A		
    " increment numbers

" storing glob results, you need to empty reg a first with qaq.
:g/fred/y A		    : Append all lines containing fred to reg a
:g/fred/y A | let @*=@a	    : put into paste buffer
:g//y A | let @*=@a	    : put last glob into paste buffer
### :let @a=' '|g/Barratt/y A |let @*=@a

" filtering
!motion command
!10Gsort		    : sort lines between current line and 10th
line
!!ls			    : replace current line with the result of
command ls 
!!date			    : replace current line with the result of
command date

" filter lines to a file (file must already exist)
Print ':'a,'bg/^Error/ . w >> errors.txt'
" duplicate every line in a file and wrap a print '' around each
duplicate
:g/./yank|put|-1s/'/"/g|s/.*/Print '&'/
:g/|/norm 2f|r*		    : replace 2nd | with *

" Operate until string found
d/fred/			    : delete until fred
y/fred/			    : yank until fred
c/fred/e		    : change until fred end
cc			    : change a line
v12|			    : visualise/change/delete to column 12

" Summary of editting repeats
.	    last edit
:&	    last substitute
:%&	    last substitute every line
:%&gic	    last substitute every line and confirm needed
g%	    normal mode repeat last substitute
g&	    last substitute on all lines
@@	    last recording
@:	    last command-line command
:!!	    last :! command
:~	    last substitute 

U		: undo a line
UU		: undo undo, also mean redo
<C-R>		: redo
<C-X>		: ^X mode while editing
<C-X><C-L>	: Line completion
/<C-R><C-W>	: push <cword> onto search/command line
/<C-R><C-A>	: push <CWORD> onto search/command line

:h regexp<C-D>	: type control-D after regexp to get a list of all
help topics containing regexp( use TAB to step through list)

" VIM tabs
vim -p file1 file2	: open files in different tabs
:tabe file		: open file in a new tab
:close			: close a tab but leave the buffer ????

" changing Case
guu			: lowercase line
gUU			: opposite to last one
Vu			: same with guu
VU			: same with gUU
g~~			: reverse case line
vEU			: Uppercase Word
ggguG			: lowercase entire file
" Uppercase first letter of sentences
:%s/[.!?]\_s\+\a/\U&\E/g


gf			" open file name under cursor
ga			" display hex,ascii value of char under cursor
ggVGg?			" encode whole file with rot13
ggg?G			" same

<C-A>,<C-X>		" increment, decrement number under cursor


" History, Markers & moving about( what Vim Remember)
'.			" jump to last modification line
`.			" jump to exact spot (line and column) in last modification
g;	!!!		" cycle through recent changes
g,	!!!		" reverse direction

" changes
<C-O>			" jump back in jump list
<C-I>			" jump forward in jump list
:ju(mps)		" list of your movement
:history		" list of all your commands
:his c			" command line history
:his s			" Search history
q/			" search history window
q:			" commandline history window
:<C-F>			" history window

" Register
### "ayy@a		: execute "Vim command" in a text fiel
### yy@"		: same thing using unnamed Register
"ddw			: store what you delete in register d
"ccaw			" store what you change in register c

" Get output from other commands 
!!date			: insert date in current line
" Sorting
:g/^$/;/^$/-1!sort	: sort each block (note the crucial ;)
:sort /.*\%2v/		: sort all lines on second column 

" buffer
"b main			: go to buffer with main in name
:sav! %:r.cfm		: save current file to alternative extension
:mv % %:r.bak		: rename current file
" create a new buffer, paste a register "q" into it, then sort it
:new +put q|%!sort

" Recording
qq			: record to q
q			: end recording
qqq			: empty register q
@q			: to execute 
[n]@@			: to repeat n times
qQ@qq			: make an existing recording q recursive
"qp			: display content of register p
<c-R>q			: same [insert mode]

" Visual 
"*y or "+y		: yank visual area into paste buffer
V%			: visualise what you match
`[v`]			: highlight last insert
:%s/\%Vold/new/g	: Do a substitution on last visual area
gv			: re-select the previous visual area

dat	dit		: delete a HTML tag(all , within)
daB	diB		: Empty a function {}
das			: delete a sentence
D			: d$, delete to the end of this line

" Redirection & Paste register *
:redir @*		: redirect commands to paste register
:redir END		: end redirection
:redir >> out.txt	: redirect to a file 
"*yy			: yank current line to paste buffer
:'a,'by*		: yank range into paste buffer (ex mode)
:.y*			: yank current line into past buffer
" filter non-printable characters from the paste buffer
:let @* = substitute(@*,'[^[:print:]]','','g')<cr>"*p
:set paste		: prevent vim from formmatting pasted in text

" Re-fromatting text
gq}			: Format a paragragh
gqap			: same
ggVGgq			: Reformat entire file
Vgq			: Re-format current line

" Operate command over multiple files
:argdo %s/foo/bar/e	: operate on all files in :args
:bufdo %s/foo/bar/e	: operate on all files in :buffers
:windo %s/foo/bar/e	:
:argdo exe '%!sort'|w!	: include an external command
:bufdo exe "normal @q!" | w : perform a recording on open files
:silent bufdo !zip proj.zip %:p	    : zip all current files

" command-line tricks
vim -u NONE -U NONE -N  : load vim without .vimrc and plugins

" Vim traps
In regular expressions,you must backslash 
 +	: match 1 or more
 |	: or
 (	: group
 {	: count
" \v magic for regular expressions

" pulling objects onto command/search line
:<C-R><C-W>		: pull word under the cursor into a command line
:<C-R><C-A>		: pull WORD under the cursor into a command line
:<C-R>-			: pull small register (also insert mode)
:<C-R>[0-9a-z]		: pull named registers (also insert mode)
:<C-R>%			: pull file name (also #) (also insert mode)
:<C-R>=somevar		: pull contents of a variable 

" Registers
"5p			: retrieve 5th "ring"
"1p....			: retrieve numeric registers
:reg	.-/%:*"		: the seven special registers
:reg 0			: what you last yanked, not affected by a delete
"_dd			: delete to blackhole register "_, not affect
any other register

:let @a=@_		: clear register a(-: blackhoel register)
:let @a=""		: same thing
:let @a=@"		: save unnamed register
:let @*=@a		: copy register a to paste buffer
:let @*=@:		: copy last command to paste buffer
:let @*=@/		: copy last search to paste buffer
:let @*=@%		: copy current file name to paste buffer

" where was an option set
:scriptnames		: list all plugins, vimrcs loaded
:verbose set history?	: reveals value of histroy and where set
:function		: list functions
:function SearchCompl	: list particular function

" Inserting DOS Carriage Returns
:%s/$/\<C-V><C-M>&/g	: that's what you type
:%s/$/\<C-Q><C-M>&/g	: for Win32
:%s/$/\^M&/g		: what you'll see where ^M is ONE character

" inserting line number into file
:%s/^/\=strpart(line(".")."  ",0, 4)
:%s/^/\=line('.'). ' '



" generate a list of number 23-64
o23<Esc>qqYp<C-A>q40@q

<C-U>			: delete all entered
<C-W>			: delete last word
<C-X><C- >		: scroll while staying put in insert mode

:X			: encryption

:h modeline		: modeline
/* vim:tabstop=8:expandtabs:shiftwidth=8 */
such setting as modeline must appear in the first or last 5 lines of a
file

:digraphs		: display digraph table

" Force syntax coloring for a file that has no extension
:set syntax=perl
" Remove syntax coloring 
:set syntax off

:set noma (non modifiable)	: prevent modifications
:set ro (Read Only)		: protect a file from unintentional writes
:set list			: showing non-ascii chars

" view
:mkview	VIEW
:set viewdir=~/.vim/views
:loadview VIEW.vim

" Session   
:mksession			" make a session file (default session.vim)
:mksession Mysession.vim	" Make a Session file named My...
vim -S				" reload all files in Session.vim(by default)
vim -S Mysession.vim		" reload all files in session

" Folding
zf1G				: fold everything before this line
zf}				: fold paragraph using motion
v}zf				: fold paragraph using visuality
zf'a				: fold to mark a
zo				: open fold
zc				: re-close fold
zfG				: fold everything after this line

" Alignment
:[range]center  width
:[range]left  indent
:[range]right width

" File names
:w %				: write to current file name
:w %:r.cfm			: change file extention to .cfm
:!echo %:p			: full path & file name
:!echo %:p:h			: full path only
:!echo %:t			: filename only
<C-R>%				: insert filename (insert mode)
/<C-R>%				: Search for file name in text

" pull full path name into paste buffer for attachment to email etc
:let @*=expand("%:p")<cr>

g<C-G>				: count words
:ehco line("'b")-line("'a")	: count lines between markers a and b
:'a,'bs/^//n			: count lines between markers a and b
:'a,'bs/somestring//gn		: count occurences of a string
:s/,/,/gn			: count commas in a line

" reproduce previous line word by word
imap <F2>   @@@<Esc>hhkyWjl?@@@<CR>P/@@@<CR>3s
nmap <F2>   @@@<Esc>hhkyWjl?@@@<CR>P/@@@<CR>3s


" Return to last edit position (you want it)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$")
    \ exe "normal! g`\"" |
    \ endif

" functions

" advanced increment
let g:I=0
function! INC(increment)
let g:I = g:I + a:increment
return g:I
endfunction

" function to delete duplicate lines
function! Del()
    if getline(".") == getline(line(".") - 1)
	norm dd
    endif
endfunction



" Programming tips
[<C-I> , ]<C-I>		    : Search for a word under the cursor
in the current file and any brought in by #include directives
gd, gD			    : Search for the definition of a variable
]<C-D>, [<C-D>		    : Jump to a macro definition
[d, ]d, [D, ]D		    : Display macro definitions
%			    : matching pairs, which wil also match
			    #ifdef with the corresponding #endif.
:tag function		    : jump to the definition of a function
(only if the tags(Vim terminology for function definition) has been
stored in a table of content file generated by the program ctags.
the command for this purpose is ctags *.c)

" insert mode command
<C-D>			    : remove autoindent 
0<C-D>			    : remove autoindent to column 1
^<C-D>			    : go to column 1 for only 1 time 
" correctly indentation from registers when in insert mode
<C-R><C-P>a		    : insert content from register a
"register]p		    : in normal mode
inset	

<C-]>			    : jump to tags of word under cursor
<C-T>			    : go back to previous tag, count allowed
<C-W>]			    : split the current window and jump to the
tag under the cursor in the upper window
:tag /regexp		    : tag allow you to find some procedure
which you know only sort of it,every after / in the command is treated
as part of regexp, for example:
:tag /wirte		    : find all procedures that contain "write"
:tag /^read		    : find procedures that begin with "read"
:tag /FoFile\|do_file\|Do_File	or :tag /[Dd]o_\=[Ff]ile
:ptag {function}	    : view function definition in preview
windows
:grep -w ground_file *.c    : find all occurences of the variable
ground_file.


:mkvimrc file		    
    " save all your mappings and other setting to a file and that be reload for this file through ":source rcfile".

" saving command line histroy, searching history, and some other
marks,buffers etc into viminfo for following use.
:set viminfo='1000,f1,r/mnt/floppy,:100,/100,%,!


" the suggested colour name for vim
Black		Blue		Brown		Cyan
DarkBlue    	DarkCyan	DarkGray    	DarkGreen
DarkMagenta	DarkRed		Gray		Green
LightBrue	LightCyan	LightGray	LightGreen
Orange		Purple		Red		SeaGreen
SlateBlue	Violet		White		Yellow 


" Syntax Elements
Boolean		Character	Comment		Conditional
Error		Debug		Define		Function
Identifier	Include		Keyword		Label
Macro		Number		Operator	PreCondit
PreProc		Repeat		Special		SpecialChar
SpecialComment	Statement	StorageClass	String
Structure	Tag		Todo		Type
Typedef

" some other definition
Cursor		: The charcter undre the cursor
Directory	: Directory names (and other special names in listing)
ErrorMsg	: Error messages displayed on the bottom line
IncSearch	: The result of an incremental search
ModeMsg		: The mode shown in the lower-left corner
MoreMsg		: The prompt displayed if Vim is displaying a long
	message at the bottom of the screen and must dispaly more
etc









 REDO AND UNDO
some doubts i am unable to through through is that how "vim" store the
changes made to the buffer,an exact copy of previous buffer, or just
changes made are recorded? if it is the second case, how does it UNDO
changes which is the opposite of changes.

What is <cword>

