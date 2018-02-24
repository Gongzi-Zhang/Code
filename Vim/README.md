# Vim usage

# to_do
> plugin: auto completion of code key words. like what we have with tab in
  shell.

# Terminology 
## display
> screen
    The whole area that Vim uses to work in. This can be a terminal emulator
    window. A screen contains one or more windows.
> window
    A view on a buffer
## Motion
> jump
    move cursor to a new absolute position : respect to file or windows
    Also note command (f,t) that move cursor within one line can't be called
    a jump
> motion
    move cursor to a new relative position : N lines/columns respect to
    current cursor position
> scroll
    move text 
## Identifier
> marker
    marker only available in a buffer
> tag
    some kind of identifier across several file, which is stored in a file:
    tags, and needed to be produced by software like ctags.
## Storation
> buffer
    content in memory, one file may correspond to several buffers, and there
    is empty buffer. 
> files
    something lies in hard disk

# Vim Completion
* C standard include head files in /usr/include/
* CPP STL
* linux API
* boost ( what's this ???)


### Map hot-keys, to extract current word under mouse curser to vim command.
nmap <Leader>man :Man 3 <cword><CR>


Special chars in Vim
---------------------
    .   match any char
    *   RE modifier
    []	match any one withing []
    ^	begin of line
    %	
    /
    \	escape cahr
    ?	match previous char 0 or 1 time
    ~
    $	end of line




### colorscheme
I want the background to be 'dark', and the words shown somewhat fuzzy


# Questions
When you use vim in bash script like the following:
vim file << END
:%s/thta/that/g
:wq
END

vim will complain that Warning: Input is not from a terminal
It seems that vim must have input from stty, but not other place.

input line history
