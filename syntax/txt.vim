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
    finish
endif

if !exists("main_syntax")
    let main_syntax = "txt"
endif


syn clear	" clear out old definitions

syn case ignore  " case insensitive

syn keyword txtKeyword	todo 
syn keyword txtKeyword	note 

syn match txtComment /#.*/ contains=txtKeyword

syn region txtBold	    matchgroup=txtIgnore start="\\b{"	     end="\\}" concealends skipnl contains=@txtBoldColor
syn region txtItalic	    matchgroup=txtIgnore start="\\i{"	     end="\\}" concealends skipnl contains=@txtItalicColor
syn region txtUnderline     matchgroup=txtIgnore start="\\u{"	     end="\\}" concealends skipnl contains=@txtUnderlineColor
syn region txtReverse       matchgroup=txtIgnore start="\\r{"	     end="\\}" concealends skipnl 
syn region txtBoldItalic    matchgroup=txtIgnore start="\\bi{"	     end="\\}" concealends skipnl 
syn region txtBoldReverse   matchgroup=txtIgnore start="\\br{"	     end="\\}" concealends skipnl 
syn region txtBoldUnderline matchgroup=txtIgnore start="\\bu{"	     end="\\}" concealends skipnl 

syn region txtBoldHighlight matchgroup=txtIgnore start="\\h{"	     end="\\}" concealends skipnl contained
syn region txtBoldRed	    matchgroup=txtIgnore start="\\red{"	     end="\\}" concealends skipnl contained
syn region txtBoldGreen	    matchgroup=txtIgnore start="\\green{"    end="\\}" concealends skipnl contained
syn region txtBoldBlue	    matchgroup=txtIgnore start="\\blue{"     end="\\}" concealends skipnl contained
syn region txtBoldYellow    matchgroup=txtIgnore start="\\yellow{"   end="\\}" concealends skipnl contained
syn region txtBoldCyan	    matchgroup=txtIgnore start="\\cyan{"     end="\\}" concealends skipnl contained
syn region txtBoldBrown	    matchgroup=txtIgnore start="\\brown{"    end="\\}" concealends skipnl contained
syn region txtBoldGray	    matchgroup=txtIgnore start="\\gray{"     end="\\}" concealends skipnl contained

syn region txtItalicHighlight matchgroup=txtIgnore start="\\h{"	     end="\\}" concealends skipnl contained
syn region txtItalicRed	    matchgroup=txtIgnore start="\\red{"	     end="\\}" concealends skipnl contained
syn region txtItalicGreen   matchgroup=txtIgnore start="\\green{"    end="\\}" concealends skipnl contained
syn region txtItalicBlue    matchgroup=txtIgnore start="\\blue{"     end="\\}" concealends skipnl contained
syn region txtItalicYellow  matchgroup=txtIgnore start="\\yellow{"   end="\\}" concealends skipnl contained
syn region txtItalicCyan    matchgroup=txtIgnore start="\\cyan{"     end="\\}" concealends skipnl contained
syn region txtItalicBrown   matchgroup=txtIgnore start="\\brown{"    end="\\}" concealends skipnl contained
syn region txtItalicGray    matchgroup=txtIgnore start="\\gray{"     end="\\}" concealends skipnl contained

syn region txtUnderlineHighlight    matchgroup=txtIgnore start="\\h{"	     end="\\}" concealends skipnl contained
syn region txtUnderlineRed	    matchgroup=txtIgnore start="\\red{"	     end="\\}" concealends skipnl contained
syn region txtUnderlineGreen	    matchgroup=txtIgnore start="\\green{"    end="\\}" concealends skipnl contained
syn region txtUnderlineBlue	    matchgroup=txtIgnore start="\\blue{"     end="\\}" concealends skipnl contained
syn region txtUnderlineYellow	    matchgroup=txtIgnore start="\\yellow{"   end="\\}" concealends skipnl contained
syn region txtUnderlineCyan	    matchgroup=txtIgnore start="\\cyan{"     end="\\}" concealends skipnl contained
syn region txtUnderlineBrown	    matchgroup=txtIgnore start="\\brown{"    end="\\}" concealends skipnl contained
syn region txtUnderlineGray	    matchgroup=txtIgnore start="\\gray{"     end="\\}" concealends skipnl contained

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
syn cluster txtBoldColor    contains=txtBoldHight,txtBoldRed,txtBoldGreen,txtBoldBlue,txtBoldYellow,txtBoldCyan,txtBoldBrown,txtBoldGray
syn cluster txtItalicColor  contains=txtItalicHight,txtItalicRed,txtItalicGreen,txtItalicBlue,txtItalicYellow,txtItalicCyan,txtItalicBrown,txtItalicGray
syn cluster txtUnderlineColor	contains=txtUnderlineHight,txtUnderlineRed,txtUnderlineGreen,txtUnderlineBlue,txtUnderlineYellow,txtUnderlineCyan,txtUnderlineBrown,txtUnderlineGray

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
hi def txtBoldRed	cterm=bold ctermfg=darkred
hi def txtBoldGreen	cterm=bold ctermfg=darkgreen
hi def txtBoldBlue	cterm=bold ctermfg=darkblue
hi def txtBoldYellow	cterm=bold ctermfg=yellow
hi def txtBoldCyan	cterm=bold ctermfg=darkcyan
hi def txtBoldBrown	cterm=bold ctermfg=brown
hi def txtBoldGray	cterm=bold ctermfg=darkgray
hi def txtItalicRed	cterm=italic ctermfg=darkred
hi def txtItalicGreen	cterm=italic ctermfg=darkgreen
hi def txtItalicBlue	cterm=italic ctermfg=darkblue
hi def txtItalicYellow	cterm=italic ctermfg=yellow
hi def txtItalicCyan	cterm=italic ctermfg=darkcyan
hi def txtItalicBrown	cterm=italic ctermfg=brown
hi def txtItalicGray	cterm=italic ctermfg=darkgray
hi def txtUnderlineRed	    cterm=underline ctermfg=darkred
hi def txtUnderlineGreen    cterm=underline ctermfg=darkgreen
hi def txtUnderlineBlue	    cterm=underline ctermfg=darkblue
hi def txtUnderlineYellow   cterm=underline ctermfg=yellow
hi def txtUnderlineCyan	    cterm=underline ctermfg=darkcyan
hi def txtUnderlineBrown    cterm=underline ctermfg=brown
hi def txtUnderlineGray	    cterm=underline ctermfg=darkgray

hi def txtLink		cterm=underline  ctermfg=darkred

hi def link txtKeyword	    txtReverse
hi def link txtTodo	    txtReverse
hi def link txtComment	    txtBlue
hi def link txtHighlight    txtRed
hi def link txtIgnore	    Ignore

" very important for showing conceal word, otherwise, it is displayed uglily
hi! def link Conceal	    Normal


let b:current_syntax = "txt"
