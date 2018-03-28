" Vim universal .txt syntax file
" Language:	txt
" Last change:	26 Mar 2018
"
" Todo:		
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

syn region txtBold	    matchgroup=txtIgnore start="\\b{"	     end="\\}" concealends skipnl contains=@txtColor
syn region txtItalic	    matchgroup=txtIgnore start="\\i{"	     end="\\}" concealends skipnl contains=@txtColor
syn region txtUnderline     matchgroup=txtIgnore start="\\u{"	     end="\\}" concealends skipnl contains=@txtColor
syn region txtReverse       matchgroup=txtIgnore start="\\r{"	     end="\\}" concealends skipnl contains=@txtColor
syn region txtBoldItalic    matchgroup=txtIgnore start="\\bi{"	     end="\\}" concealends skipnl contains=@txtColor
syn region txtBoldReverse   matchgroup=txtIgnore start="\\br{"	     end="\\}" concealends skipnl contains=@txtColor
syn region txtBoldUnderline matchgroup=txtIgnore start="\\bu{"	     end="\\}" concealends skipnl contains=@txtColor
syn region txtHighlight	    matchgroup=txtIgnore start="\\h{"	     end="\\}" concealends skipnl contained transparent
syn region txtRed	    matchgroup=txtIgnore start="\\red{"	     end="\\}" concealends skipnl contained transparent
syn region txtGreen	    matchgroup=txtIgnore start="\\green{"    end="\\}" concealends skipnl contained transparent
syn region txtBlue	    matchgroup=txtIgnore start="\\blue{"     end="\\}" concealends skipnl contained transparent
syn region txtYellow	    matchgroup=txtIgnore start="\\yellow{"   end="\\}" concealends skipnl contained transparent
syn region txtCyan	    matchgroup=txtIgnore start="\\cyan{"     end="\\}" concealends skipnl contained transparent
syn region txtBrown	    matchgroup=txtIgnore start="\\brown{"    end="\\}" concealends skipnl contained transparent
syn region txtGray	    matchgroup=txtIgnore start="\\gray{"     end="\\}" concealends skipnl contained transparent

" top level highlighting (not contained)
syn region txtHighlight	    matchgroup=txtIgnore start="\\h{"	     end="\\}" concealends skipnl
syn region txtRed	    matchgroup=txtIgnore start="\\red{"	     end="\\}" concealends skipnl
syn region txtGreen	    matchgroup=txtIgnore start="\\green{"    end="\\}" concealends skipnl
syn region txtBlue	    matchgroup=txtIgnore start="\\blue{"     end="\\}" concealends skipnl
syn region txtYellow	    matchgroup=txtIgnore start="\\yellow{"   end="\\}" concealends skipnl
syn region txtCyan	    matchgroup=txtIgnore start="\\cyan{"     end="\\}" concealends skipnl
syn region txtBrown	    matchgroup=txtIgnore start="\\brown{"    end="\\}" concealends skipnl
syn region txtGray	    matchgroup=txtIgnore start="\\gray{"     end="\\}" concealends skipnl

syn match txtHash /\\#/ conceal cchar=# 

syn cluster txtStyle	    contains=txtBold,txtItalic,txtUnderline,txtReverse,txtBoldItalic,txtBoldReverse,txtBoldUnderline
syn cluster txtColor	    contains=txtHight,txtRed,txtGreen,txtBlue,txtYellow,txtCyan,txtBrown,txtGray

" syntax region txtQuote	start=/"/ skip=/\\"/ end=/"/
syn region txtLink	    matchgroup=txtIgnore start="\\link{"     end="\\}" concealends skipnl

" syn match txtCurlyBrace /\\}/ conceal cchar=} transparent contained 
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

hi def txtLink		cterm=underline  ctermfg=darkred

hi def link txtTodo	    txtReverse
hi def link txtComment	    txtBlue
hi def link txtHighlight    txtRed
hi def link txtIgnore	    Ignore
hi def link Conceal	    Statement

let b:current_syntax = "txt"
