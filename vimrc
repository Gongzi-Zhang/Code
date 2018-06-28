"       	            __   __(_)_ __ ___
"       	            \ \ / /| | '_ ` _ \
"       	             \ V / | | | | | | |
"       	              \_/  |_|_| |_| |_|
"       	      
set nocompatible 

" set nu  " line number
" set list	" a useful option for showing non-ascii chars
" set ruler	" show editor information all the times

set smartindent

set virtualedit=all

set tabstop=8  " hard tab
set shiftwidth=4   " indent
set softtabstop=4   " soft tab

" set tw=76   " why 78 ???

set showcmd	" show incomplete commands

set hlsearch
set ignorecase smartcase infercase
set incsearch   "  do incremental searching
" set spell spellang=en_us

set matchpairs+=<:>

set go=

" search for tags in the current direcotry and up the tree towards root
" until one is found. 
set tags=./tags;

" set dictionary+=/usr/share/dict/words
	    
colorscheme default

let &termencoding=&encoding
set fileencodings=utf-8,utf-16,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

filetype plugin indent on   "  filetype detection
if &t_Co > 1	
    syntax on  " syntax highlighting, make sure terminal supports colors
endif

"  Mapping
"  NOTE !!! when doing mapping and abbreviation, pay special attention to blank chars(<tab>
"  <space> <CR> in the end of mapping command, otherwise you will get odd
"  result from your mapping command)
inoremap   (	()<Esc>i
inoremap   {	{}<Esc>i
inoremap   [	[]<Esc>i
inoremap   gf	<esc>la
inoremap   gff	<esc>2la
inoremap   gfff	<esc>3la
inoremap   gb	<esc>i
inoremap   gbb	<esc>hi
inoremap   g<return>	<esc>A
" inoremap   '	''<Esc>i

nnoremap  <F3>	:noh<return><esc>

" open var. definition in a new tab. 
map <A-]>   :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" map zc  i{<esc>xea}<esc>
" map zp  i(<esc>xea)<esc>
map j	gj
map k	gk


"  Abbreviation
if filereadable(expand("~/.vim/abbreviation.vim"))
    source ~/.vim/abbreviation.vim
endif

" session
" autocmd VimEnter * call LoadSession()
" autocmd VimLeave * call SaveSession()
" 
function! SaveSession(session)
"    let dir = expand('%:h')
    execute "mksession! ~/.vim/sessions/".a:session.".vim"
endfunction

function! LoadSession(session)
"    let dir = expand('%:h')
    execute 'source ~/.vim/sessions/'.a.session.'.vim'
endfunction

" au! group event filetype command  " remove autocommand 
"   Autocmd
au Filetype * if &ft != "vim" | inoremap "	""<esc>i| endif

augroup TXT
au BufNewFile,BufRead * if empty(&ft) && filereadable(expand("~/.vim/ftplugin/txt.vim")) && filereadable(expand("~/.vim/syntax/txt.vim")) | set ft=txt | endif
au FileType text if filereadable(expand("~/.vim/ftplugin/txt.vim")) && filereadable(expand("~/.vim/syntax/txt.vim")) | set ft=txt | endif
augroup END

augroup HTML
    au!
    au	FileType php,html,xhtml,css  inoremap  <  <><Esc>i
    au  FileType php,html,xhtml,css  inoremap  >  <Esc>yyp^a/<Esc>elr>lDko
"    au  FileType php,html,xhtml,css  inoremap  >  <Esc>yyp^a/<Esc>eldt>ko
"    Why this command doesn't open new line automatically when there is only
"    one word in tag ???
    au  FileType php,html,xhtml,css  inoremap  <! <!----><esc>2hi
    au  FileType php,css       	     inoremap  /*  /**/<esc>1hi
    au  FileType html,xhtml,javascript	     inoremap  //<  //<![CDATA[<CR><CR><CR><CR>//]]><esc>2ka
    au  FileType php,javascript,css  inoremap  ;   <esc>A;
    au  FileType php		     inoremap  <?  <?php?><Esc>hi<CR><Esc>ko
    au  FileType php		     inoremap  or<Space>die  or<Space>die(mysql_error)
    au	FileType javascript,json,css inoremap  {<return>  {<return>}<Esc>O
    au  FileType json		     inoremap  ,    <esc>A,
    au  FileType json		     inoremap  :    <esc>A:
    au  FileType json		     inoremap  ,,   ,
    au  FileType json		     inoremap  ::   :
augroup END

augroup XML
    au!
    au Filetype xml	inoremap    <	<><Esc>i
    au Filetype xml	inoremap    >   <Esc>yyp^a/<Esc>k$
    au Filetype xml	inoremap    <!  <!----><Esc>2hi
augroup END

augroup C
    au!
"    au FileType c,cc,h  inoremap  <  <><Esc>  " inconvinient for cout
    au FileType c,cc,C,cpp,h  inoremap  ;<return>  <Esc>A;<return>
    au FileType c,cc,C,cpp,h  inoremap  {<return>  {<return>}<Esc>O
    au FileType c,cc,C,cpp,h  inoremap  /* /*<Return>/<esc>kA
    au FileType c,cc,C,cpp,h  ab	#i  #include
    au FileType c,cc,C,cpp,h  ab	#d  #define
augroup END

augroup DOT
    au!
"    au FileType c,cc,h  inoremap  <  <><Esc>  " inconvinient for cout
    au FileType dot  inoremap  ;<return>  <Esc>A;<return>
augroup END

augroup TEXT
    au!
    au FileType text,txt set nosmartindent
augroup END

augroup TEX
    au!
    au BufRead,BufNewFile *.tex set ft=tex
    au FileType tex	let g:tex_conceal="abdgm" | set concealcursor=c conceallevel=2 
    au FileType tex	set nosmartindent
    au FileType tex	inoremap    ;	<Esc>A;
    au FileType tex	inoremap    $	$$<Esc>i
    au FileType tex	inoremap    }   <esc>yyp^lcwend<esc>kA
    au FileType tex	inoremap    \[  \[<return>\]<esc>ko
augroup END

augroup MATHEMATICA
    au!
    au FileType mma	inoremap    (*	(*  *)<esc>2hi
augroup END
"augroup CMAKE
"    au!
"    au BufNewFile,BufRead CMakelist,CMakeLists,CMakeList.txt,CMakeLists.txt set filetype=cmake
"augroup END

" http://bytefluent.com/vivify/
" this is an amazing website where you are allowed to configure diffe-
" rent color-scheme until you find your favorite. features such as 
" foreground, background and bold, italic and underline are all suppor-
" ted which is reaaly a convenient place for picking out your favorite 
" colorscheme.
"
"
" if you want to see what the most often used color combinations look
" like, use this command:
"                               :runtime syntax/colortest.vim


"	    A NEW VIM CONFIGURE    -- ZHANG WEIBIN   2016/03/22
