" A very intelligent turtle
"    Found programming UNIX a hurdle
"    The system, you see,
"    Ran as slow as did he,
" And that's not saying much for the turtle.

" Examples of Using VIM
"   |-- Summary and Tips
"	|-- help 
"	|-- global commands
"	|-- repeat
"	|-- changes
"	|-- sort
"	|-- tabs
"   |-- do one thing
"	|-- incrementing numbers
"	|-- change case
"	|-- formatting text
"	|-- count
"   |-- multiple files



" What's the meaning of life, universe and everything "
:h 42
:h holy-grail
:h!

" help for help "
:h virtualedit		    " an convenient option for editing tables
:h helphelp		    " help on help files
:h index		    " to get a complete index of what is available
:h help-summary		    " summary of help usage
:h tips			    " Vim's own Tips Help



" useful Global command "
:g/pattern/#		    " show line numbers
:g!/^string/d		    " delete lines not containing string
:v/^string/d		    " same
:g/joe/,/fred/d		    " delete from joe to fred, NOT line based
:g/-------/.-10,.d	    " delete string & 10 previous line
:v/./,/./-j		    " compress empty lines
:g/^$/,/./-j		    " same
:g/^/m0			    " reverse file
:g/^/t.			    " duplicate every line
:g/fred/t$		    " copy (transfer) lines matching fred to EOF
:g/fred/t'a		    " copy (transfer) lines matching fred to marker a                    
:g/^Chapter/t. | s/./-/g    " Automatically underline selecting headings

"" storing global results, you need to empty reg a first with qaq. "
:g/fred/y A		    " Append all lines containing fred to reg a
:g/fred/y A | let @*=@a	    " put into paste buffer
:g//y A | let @*=@a	    " put last glob into paste buffer
:let @a=' '|g/Barratt/y A |let @*=@a



" Summary of editting repeats
.		" last edit
:[range]&	" last substitute
:%&	    	" last substitute every line
:%&gic	    	" last substitute every line and confirm needed
g%	    	" normal mode repeat last substitute
g&	    	" last substitute on all lines
@@	    	" last recording
@:	    	" last command-line command
:!!	    	" last :! command
:~	    	" last substitute 

U		" undo a line
UU		" undo undo, also mean redo
<C-R>		" redo
<C-X>		" ^X mode while editing
<C-X><C-L>	" Line completion
/<C-R><C-W>	
		" push <cword> onto search/command line
/<C-R><C-A>	
		" push <CWORD> onto search/command line



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



" Sorting
:g/^$/;/^$/-1!sort	" sort each block (note the crucial ;)
:sort /.*\%2v/		" sort all lines on second column 



" tab space "
:retab			    " transform tab into space
/* vim:tabstop=8:expandtabs:shiftwidth=8 */



" incrementing numbers (type <c-a> as 5 characters)
CTRL-A			" increments the number under the cursor (decimal, 
			" octal, or hexadecimal)
CTRL-X			" decrements
:.,$g/^\d/exe "norm! \<c-a>"    
    " increment numbers
:'a,'bg/\d\+/norm! ^A		
    " increment numbers
"" advanced increment
let g:I=0
function! INC(increment)
let g:I = g:I + a:increment
return g:I
endfunction



" change Case "
guu			" lowercase line
gUU			" opposite to last one
Vu			" same with guu
VU			" same with gUU
g~~			" reverse case line
vEU			" Uppercase Word
ggguG			" lowercase entire file
" Uppercase first letter of sentences
:%s/[.!?]\_s\+\a/\U&\E/g


gf			" open file name under cursor
ga			" display hex,ascii value of char under cursor
ggVGg?			" encode whole file with rot13
ggg?G			" same



" History, Markers & moving about (what Vim Remember)
'.			" jump to last modification line
`.			" jump to exact spot (line and column) in last modification
g;	!!!		" cycle through recent changes
g,	!!!		" reverse direction



" pulling objects onto command/search line
:<C-R><C-W>		" pull word under the cursor into a command line
:<C-R><C-A>		" pull WORD under the cursor into a command line
:<C-R>-			" pull small register (also insert mode)
:<C-R>[0-9a-z]		" pull named registers (also insert mode)
:<C-R>%			" pull file name (also #) (also insert mode)
:<C-R>=somevar		" pull contents of a variable 



" File names
:w %:r.cfm		" change file extention to .cfm
:!echo %:p		" full path & file name
:!echo %:p:h		" full path only
:!echo %:t		" filename only
<C-R>%			" insert filename (insert mode)
/<C-R>%			" Search for file name in text
""""""""""""""""""""""""""""""""""""""""""""
" duplicate every line in a file and wrap a print '' around each duplicate

" Inserting DOS Carriage Returns
:%s/$/\<C-V><C-M>&/g	: that's what you type
:%s/$/\<C-Q><C-M>&/g	: for Win32
:%s/$/\^M&/g		: what you'll see where ^M is ONE character

" inserting line number into file
:%s/^/\=strpart(line(".")."  ",0, 4)
:%s/^/\=line('.'). ' '

" generate a list of number 23-64
o23<Esc>qqYp<C-A>q40@q

" reproduce previous line word by word
imap <F2>   @@@<Esc>hhkyWjl?@@@<CR>P/@@@<CR>3s
nmap <F2>   @@@<Esc>hhkyWjl?@@@<CR>P/@@@<CR>3s

" Return to last edit position (you want it)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$")
    \ exe "normal! g`\"" |
    \ endif

" function to delete duplicate lines
function! Del()
    if getline(".") == getline(line(".") - 1)
	norm dd
    endif
endfunction

" Map hot-keys, to extract current word under mouse curser to vim command.
nmap <Leader>man :Man 3 <cword><CR>

" convert txt to html file
:runtime! syntax/2html.vim	

" filter non-printable characters from the paste buffer
:let @* = substitute(@*,'[^[:print:]]','','g')<cr>"*p

" formatting text "
gq}			" Format a paragragh
gqap			" same
ggVGgq			" Reformat entire file
Vgq			" Re-format current line


" pull full path name into paste buffer for attachment to email etc
:let @*=expand("%:p")<cr>

" count "
g<C-G>				" count words
:echo line("'b")-line("'a")	" count lines between markers a and b
:'a,'bs/^//n			" count lines between markers a and b
:'a,'bs/somestring//gn		" count occurences of a string
:s/,/,/gn			" count commas in a line



" multiple files "
"" opening multifiles
:vi file    " open file and close current one
:view file  " same as above but in read-only mode
gf	    " go to file whose name is under the cursor
"" position
:args	    " show which file you are in
:rewind	    " go to and edit the first file no matter where you are
:last	    " the last file
CTRL_^	    " go to the alternate file( the last modified file)
	
"" Operate command over multiple files
:argdo %s/foo/bar/e	" operate on all files in :args
:bufdo %s/foo/bar/e	" operate on all files in :buffers
:windo %s/foo/bar/e	" operate on all files in :wins
:argdo exe '%!sort'|w!	" include an external command
:bufdo exe "normal @q!" | w " perform a recording on open files
:silent bufdo !zip proj.zip %:p	    " zip all current files

" command-line tricks
vim -u NONE -U NONE -N  " load vim without .vimrc and plugins

