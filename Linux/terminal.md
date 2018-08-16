# Terminals Color -- Select Graphic Rendition (SGR)
The SGR substring values are integers in decimal representation and can
be concatenated with semicolons.

## Common values
* 1	**bold**
* 4	underline
* 5	blink
* 7	inverse
* 39	default fg color
* 30-37	fg colors
    1. 30
    2. 31   red
    3. 32   green
    4. 33
    5. 34   blue
    6. 35   magenta
    7. 36   cyan


* 90-97	16-color mode fg colors
* 38;5;0 - 38;5;255	
	88-color and 256-color modes fg colors
* 49	default bg color
* 40-47	bg colors
* 100-107   
	16-color mode bg colors
* 48;5;0-48;5;255   
	88-color and 256-color modes bg colors


## example
$GCC_COLORS


* The shell never sees the output of the commands it runs (unless redirected). Output history (scrollback) is purely a terminal concept.
* Inter-application copy-paste is provided by the terminal, the shell may have its own internal copy-paste mechanism as well
* Job control is mostly performed by the shell. However, it's the terminal that handles key combinations like Ctrl+C to kill the fg job and Ctrl+Z to suspend it. (Really ???)
* Line-at-a-time mode: a line is hold by the terminal and not transmitted until hinted the end of line editing with "Enter". At that point, the entire line is transmitted as a whole. Otherwise, user will not see the line as it is being edited, which implies local echo. However, line-at-a-time mode is independent of local echo. When entering a password, for example, line-at-a-time entry with local editing is possible, but local echo is turned off (otherwise the password would be displayed)
> Line editing can also be provided by shell.

# files
tty:
    the file that represents a terminal is traditionally called a tty file
    In Linux/Unix, tty files are connected to virtual consoles (e.g. tty1)
    virtual terminals (e.g. pts/0) or physically connected hardware (e.g.
    ttyS0)
