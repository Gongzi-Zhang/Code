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
    :mkview VIEW
> session
    collections of views and related info
    :mksession SESSION
## Motion
> jump
    jump move between files.
    move cursor to a new absolute position : respect to file or windows
    The sentence-wise and paragraph-wise motions are jumps.
> motion
    motion move around within a file.
    move cursor to a new relative position : N lines/columns respect to
    current cursor position
> scroll
    move text 
> changes
    list of the modifications we make to each buffer during the course of an
    editing session.
## Identifier
> marker
    marker only available in a buffer
    >> Visible marker
	:sign	define	name	arguments
    >> Hidden marker
> tag
    some kind of identifier across several file, which is stored in a file:
    tags, and needed to be produced by software like ctags.
> register
    >> Unnamed register (default one)
    >> Named register ("a - "z)
    >> Black Hole Register ("_)
    >> System clipboard ("+), Selection register ("*)
    >> Expression register ("=)
    >> "%   Name of the current file
    >> "#   name of alternate file
    >> "/   Last search patterni
    >> ".   Last inserted text
    >> ":   Last Ex command
    
## Storation
> buffer
    content in memory, one file may correspond to several buffers, and there
    is empty buffer. 
> files
    something lies in hard disk
> Macros

## Searching
### Pattern
* use parentheses to capture Submatches
* zero-width items: < > \zs \ze

# Options
:set option
:set nooption
:set option!	" toggle the setting
:set option?	" find out the value of the option
:set option&	" reset to its default value

## colorscheme
I want the background to be 'dark', and the words shown somewhat fuzzy

match group /pattern/
    " colorscheme affects the entire color setup, match colors a small
    " combination of background (or foreground) colors.

# Vim Completion
* C standard include head files in /usr/include/
* CPP STL
* linux API
* boost 


# Variable 
## Scope
    - v:    Vim predefined global scope
    - g:    Global scope
    - b:    Buffer scope
    - t:    Tab scope -- only available in the Vim tab where it was defined
    - w:    Window scope -- current vim window(viewport)
    - l:    Function scope
    - s:    Sourced file scope -- local to a Vim script loaded using :source
    - a:    Argument scope  -- used in arguments for functions.
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
    \	escape char
    ?	match previous char 0 or 1 time
    ~
    $	end of line





# Questions
When you use vim in bash script like the following:
vim file << END
:%s/thta/that/g
:wq
END

vim will complain that Warning: Input is not from a terminal
It seems that vim must have input from stty, but not other place.

input line history
