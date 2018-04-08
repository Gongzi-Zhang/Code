# Vim usage

# to_do
> plugin: auto completion of code key words. like what we have with tab in
  shell.

# vim concepts:
	mode:-----
	    |
	    |---normal mode
	    |
	    |---insert mode
	    |
	    |---command line mode(Ex mode, a command script)
	    |
	    |---visual mode
	    |
	    |---record mode(qa)
	    |
	    |---virtual mode (tables)
	    |
	mark:-----
	    |
	    |---create mark
	    |   |
	    |   |---local
	    |   |
	    |   |---global
	    |   |
	    |   |---special mark()
	    |
	    |---go to mark(` )
	    |
	register:-----
	    |
	    |---
	variables:-----
	    |
	    |---global
	    |
	    |---local
	buffer:-----
	    |--- a buffer is a copy of the file that you edit. 
	    |
	    |---state
		|
	    	|---active: text loaded, appears in window
	    	|
	    	|---hidden: not in a window, text loaded.
	    	|
	    	|---inactive: not in a window, no text loaded ??????
	options:
	    |
	    |---set option
	session:-----
	    |
	    |---make a session
	    |
	    |---restore from a session
	    |
	    |---work with viminfo
	    |
	    |---view
	    |
	    |---modelines
	window:-----
	    |
	    |---the relationship with buffer
	tabs:
	    |
	    |---
	dictionary:-----
	    |
	    |---
	tags:-----
	    |
	    |---
	arguments:----- one argument may corresponding to more than
	    |	    one buffers.But one buffer can correspond to only
	    |	    one arg. Therefore, if we open a new file when
	    |	    editing one with command :e newfile, there are only
	    |	    one args,which is the name of original file name,
	    |	    but there are two buffers.So, only :bNext, rather 
	    |	    than :next can take you to the next buf. On the
	    |	    other hand, if we open them in this way: 
	    |	    vim file1 file2, there will be two args and two 
	    |	    bufs.
	    |
	    |---

relationship between some elements within vim:
+-----------+    +-----------+      +-----------+
|buffer1    |    |buffer2    |      |buffer3    |
|content    |    |content    |      |content    |
|blabla	    |    |blabla     |	    |blabla	|
|	    |    |	     |      |		|
|	    |    |	     |      |	    	|
|	    |    |	     |      |	    	|
|	    |    |	     |      |	    	|
+-----------+    +-----------+      +-----------+
+-----------+    +-----------+      +-----------+		
|meta data1 |    |meta data2 |      |meta data3 |
|local marks|    |local marks|      |local marks|
|local var  |    |local var  |      |local var	|
|local dict |    |local dict |      |local dict	|
|	    |    |	     |      |		|
|   view    |	 |   view    |      |   view	|
+-----------+    +-----------+      +-----------+
      |                |                  |
      |                |                  |
      +-----------------------------------+
		       |
	+------------------------------+
	|      global meta data        |
	|  global marks		       |
	|  global variables	       |
	|  registers		       |
	|  options		       |
	+------------------------------+
			|
			|
			|
		+---------------+
		|	vim	|  <<------- syntax file
		|		|
		+---------------+
		     /     \
	    	    /       \
	           /         \
	       +------+   +------+  
	       | con- |   | con- |
	       | tents|   | tents|
	       +------+   +------+
	           \  	      /
	            \        / 
	             \      /
	        +---------------+
	        |    console    |
	        |	        |
	        +---------------+



###                                     
Oh my god, I finally know what <CR> stands for, carriage return, which
dates back to the early days when teletype machines used this two chars
to start a new line, one is <CR>, to move the carriage back to the 
first position, another to move the paper up(line feed, <LF>)

>>>>>> about the file format, what is narratived in the user manual 
usr_23.txt lose effectiveness, when I try to convert a MS-dos file 
into a unix one, nothing happen? and the option ++ff=unix also fail 
to remove the ^M mark at the end of each line. What's the problem<<<<<<


a nice layout to use:

	+----------------------------------------+
	|	   VIM - main help file		 |
	|					 |
	|Move around:  Use the cursor keys, or "h|
	|help.txt================================|
	|explorer   |				 |
	|dir        |~				 |
	|dir        |~				 |
	|file       |~	 			 |
	|file	    |~	 			 |
	|file       |~	 			 |
	|file       |~	 			 |
	|~/=========|[No File]===================|
	|					 |
	+----------------------------------------+

OK, this is very convenient for editing files.

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





# Doubts:   some doubts about vim
*   When you use vim in bash script like the following:
    vim file << END
    :%s/thta/that/g
    :wq
    END

    vim will complain that Warning: Input is not from a terminal
    It seems that vim must have input from stty, but not other place.


*   command-line options:
    -b  : binary mode, A few options will be set that makes it possible 
	  to edit a binary or executable file.

*   How does Vim open a file, when it open a very large file (say, hundreds of MB), 
    it will be a totally disaster.
