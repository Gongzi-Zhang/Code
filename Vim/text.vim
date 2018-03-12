" Vim syntax file
" Language:		plain text file
" Maintainer:		Weibin Zhang
" Last Change:		March 10, 2018
" Version:		00-00-00


syntax match	myComments  "/\*.*\*/"
syntax match	mySymbols   "[{}();=]"
syntax keyword	myKeywords  to\ do TODO to_do
syntax region	myRegions   start=/\/\*/ end=/\*\//
syntax region	myCodeBlock start=/{/ end=/}/	contains=ALLBUT myKeywords

highlight   myComments	ctermfg=yellow
highlight   mySymbols	ctermfg=blue
highlight   myKeywords	ctermfg=green
highlight   myRegions	ctermfg=red	




