" Vim filetype plugin file
" Language:	txt
" Maintainer:	Weibin Zhang
" Last Changed:	Mar 27, 2018

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

if has("conceal")
    setlocal concealcursor=c conceallevel=2
endif

inoremap {  {\}<esc>hi

" indent
if filereadable(expand("~/.vim/indent/txt.vim"))
    source ~/.vim/indent/txt.vim
else
    set autoindent
endif
