" version check
if v:version >= 702 || v:version == 701	&& has("patch123")
    " do nothing
else
    echo "low version number, please update your VIM"
endif

" script loaded check
if exists("loaded_myscript")
    finish "stonp loading the script"
endif
let loaded_myscript=1

let s:global_cpo = &cpo	" store current compatible-mode 
set cpo&vim " set nocompatible-mode

" variable myscript_path
if !exists("myscript_path")
    let s:vimhomepath = split(&runtimepath, ',')
    let s:myscript_path = s:vimhomepath[0]."/plugin/myscript.vim"
else
    let s:myscript_path = myscript_path
    unlet myscript_path
endif
" trace upward until root dir to find out tags file
function SetTags()
    let curdir = getcwd()

    while !filereadable("tags") && getcwd() != "/"
	cd ..
    endwhile

    if filereadable("tags")
	execute "set tags=" . getcwd() . "/tags"
    endif

    execute "cd " . curdir
endfunction

call SetTags()


function! CompleteEmails(findstart, base)
    if a:findstart
	" locate the start of the word
	let line = getline('.')
	let start = col('.') - 1
	while start > 0 && line[start - 1] =~ '\a'
	    let start -= 1
	endwhile
	return start

    else
	" find contact names matching with "a:base"
	let res = []
	" read contactlist file and sort the result
	for m in sort(readfile('~/.vim/contacts.txt))
	    if m =~ '^'.a:base
		let contactinfo = split(m, '|')
		" show names in list, but insert email address
		call add(res, {'word': contactinfo[1],
		    \'abbr':contactinfo[0].' <'.contactinfo[1].'>',
		    \'icase':1} )
	    endif
	endfor
	return res
    endif
endfunction

let &cpo = s:global_cpo	" restore original compatible setting
