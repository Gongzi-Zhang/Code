" vim indent file
" Language:	txt
" Maintainer:	Weibin Zhang
" Last Changes:	Mar 28, 2018

if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" -- if last line begin with bold, then indent on next line
" -- automatically keep same indent as above lines
set autoindent

