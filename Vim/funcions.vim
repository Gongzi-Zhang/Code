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
