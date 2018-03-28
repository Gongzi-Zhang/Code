" Vim universal .txt syntax file
" Language:	txt
" Last change:	26 Mar 2018
"
" Todo:		
"		How to display } in the highlighted region ???
" This is an universal syntax script for text document, providing most basic
" style: bold, italic, underline, and reverse and colors.
"
" txtError, txtList, txtlink, txtquote, 

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    echo b:current_syntax
    finish
endif

if !exists("main_syntax")
    let main_syntax = "txt"
endif


syn clear	" clear out old definitions

syn case ignore  " case insensitive

syn keyword txtTodo	todo 

syn match txtComment /#.*/ contains=txtTodo

syn region txtBold	    matchgroup=txtIgnore start="\\b{"	    skip="\\}" end="}" concealends skipnl
syn region txtItalic	    matchgroup=txtIgnore start="\\i{"	    skip="\\}" end="}" concealends skipnl
syn region txtUnderline     matchgroup=txtIgnore start="\\u{"	    skip="\\}" end="}" concealends skipnl
syn region txtReverse       matchgroup=txtIgnore start="\\r{"	    skip="\\}" end="}" concealends skipnl
syn region txtBoldItalic    matchgroup=txtIgnore start="\\bi{"	    skip="\\}" end="}" concealends skipnl
syn region txtBoldReverse   matchgroup=txtIgnore start="\\br{"	    skip="\\}" end="}" concealends skipnl
syn region txtBoldUnderline matchgroup=txtIgnore start="\\bu{"	    skip="\\}" end="}" concealends skipnl
syn region txtHighlight	    matchgroup=txtIgnore start="\\h{"	    skip="\\}" end="}" concealends skipnl
syn region txtRed	    matchgroup=txtIgnore start="\\red{"	    skip="\\}" end="}" concealends skipnl
syn region txtGreen	    matchgroup=txtIgnore start="\\green{"   skip="\\}" end="}" concealends skipnl
syn region txtBlue	    matchgroup=txtIgnore start="\\blue{"    skip="\\}" end="}" concealends skipnl
syn region txtYellow	    matchgroup=txtIgnore start="\\yellow{"  skip="\\}" end="}" concealends skipnl
syn region txtCyan	    matchgroup=txtIgnore start="\\cyan{"    skip="\\}" end="}" concealends skipnl
syn region txtBrown	    matchgroup=txtIgnore start="\\brown{"   skip="\\}" end="}" concealends skipnl
syn region txtGray	    matchgroup=txtIgnore start="\\gray{"    skip="\\}" end="}" concealends skipnl
" syntax region txtQuote	start=/"/ skip=/\\"/ end=/"/

syn match txtCurlyBrace /\\}/ conceal cchar=} transparent contained 
" How to shown } withing the highlight region ???

hi def txtBold		cterm=bold
hi def txtItalic	cterm=italic
hi def txtUnderline	cterm=underline
hi def txtReverse	cterm=reverse
hi def txtBoldItalic    cterm=bold,italic
hi def txtBoldReverse   cterm=bold,reverse
hi def txtBoldUnderline cterm=bold,underline

hi def txtRed		ctermfg=darkred
hi def txtGreen		ctermfg=darkgreen
hi def txtBlue		ctermfg=darkblue
hi def txtYellow	ctermfg=yellow
hi def txtCyan		ctermfg=darkcyan
hi def txtBrown		ctermfg=brown
hi def txtGray		ctermfg=darkgray

hi def link txtTodo	    txtReverse
hi def link txtComment	    txtBlue
hi def link txtHighlight    txtRed
hi def link txtIgnore	    Ignore

let b:current_syntax = "txt"
