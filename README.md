# How to use this dir.
README.md:	structure and basic concepts about VIM
usage:		general command and usage about VIM
example.vim:	explict problem and solution
search.vim:	every thing about search and regep in VIM

# VIM Structure and Basic Concepts

# Doubts:   some doubts about vim
=================================
*   When you use vim in bash script like the following:
    vim file << END
    :%s/thta/that/g
    :wq
    END

    vim will complain that Warning: Input is not from a terminal
    It seems that vim must have input from stty, but not other place.

*   How does Vim open a file, when it open a very large file (say, hundreds of MB), 
    it will be a totally disaster.
*   vsplit many command provide version of horizental spliting, what about vertical spliting

# to_do
> plugin: auto completion of code key words. like what we have with tab in
  shell.
> I want the background to be 'dark', and the words shown somewhat fuzzy

----------------
vim concepts
----------------
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
	    	|---inactive: not in a window, no text loaded 
                |
		|   in vim, when you made some change to a file, you are editing it.
		|   a file that you are editing (you have made some changes to it) but not
		|   show on screen is called hidden one. a file that you want to edit but 
		|   don't make any change to it yet is in inactive state
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
==============================================

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
		|      vim	|  <<------- syntax file
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

This isn't nice at all, a more practical consideration is add a command,
e.g. open, which when called, will open a file browser on the left of
current window, allowing user to choose the file to be edited. And the
help window is needless.

-------------
Terminology 
-------------

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
    
## Storation
> buffer
    The content of a file in memory is called buffers. In anytime, there 
    is only one swap file in disk for one window. And there is empty buffer. 
    When you change to another buffer using :bNext or :bPrevious command, 
    it will write current buffer back to disk and load the required one. 
    To summary up, there is only one beffer in memory for all the files
    that you are editing, though it will record all the buffers for you. 
> files
    something lies in hard disk
> Macros

## Options
> filetype
    Note that filetype is not set (though it has been detected, it only set an
    autocommand to set ft), so any command that set ft before BufferRead
    is useless. Only command after BufferRead can overrule the detected one.

## Variable 
### Scope
    - v:    Vim predefined global scope
    - g:    Global scope
    - b:    Buffer scope
    - t:    Tab scope -- only available in the Vim tab where it was defined
    - w:    Window scope -- current vim window(viewport)
    - l:    Function scope
    - s:    Sourced file scope -- local to a Vim script loaded using :source
    - a:    Argument scope  -- used in arguments for functions.

## some other definition
Cursor		: The charcter under the cursor
Directory	: Directory names (and other special names in listing)
ErrorMsg	: Error messages displayed on the bottom line
IncSearch	: The result of an incremental search
ModeMsg		: The mode shown in the lower-left corner
MoreMsg		: The prompt displayed if Vim is displaying a long
		  message at the bottom of the screen and must dispaly more etc

----------
Reference
----------

key words
=========
    - key-notation, key-codes, keycodes
	names for keys used in the documentation
    - search-pattern, pattern, regular-expression, regexp, Pattern
	search pattern


the suggested **colour** name for vim
=================================
Black		Blue		Brown		Cyan
DarkBlue    	DarkCyan	DarkGray    	DarkGreen
DarkMagenta	DarkRed		Gray		Green
LightBrue	LightCyan	LightGray	LightGreen
Orange		Purple		Red		SeaGreen
SlateBlue	Violet		White		Yellow 


 **Syntax** Elements
====================
Boolean		Character	Comment		Conditional
Error		Debug		Define		Function
Identifier	Include		Keyword		Label
Macro		Number		Operator	PreCondit
PreProc		Repeat		Special		SpecialChar
SpecialComment	Statement	StorageClass	String
Structure	Tag		Todo		Type
Typedef

