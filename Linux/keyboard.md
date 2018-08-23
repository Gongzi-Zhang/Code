* why keycode, but not directly converted into keysyms??? (don't want to
expose scancode ? better interface ?)

# INPUT
+----------+               +-------------+               +-----+
| keyboard | ------------> | motherboard | ------------> | CPU |
+----------+               +-------------+               +-----+
             USB, PS/2, ...                PCI, ...
	     key down/up 

**GUI**
	  +--------+	       +----------+		+-----+
--------> | kernel | --------> | X server | ----------> | app |
	  +--------+	       +----------+		+-----+
interrupt            scancode               keysym
                     = keycode              + mdoifiers
                                                |       +-------------------+                  +-----+
		       text mode in X11: 	|-----> | terminal emulator | ---------------> | app |
                                                        +-------------------+                  +-----+
                                                                              character or
									      escape sequence
# OUTPUT
              +-------------------+ 
   | -------> | terminal emulator |
   |          +-------------------+ 
   | char or            |
   | escape sequence    |
+-----+          +----------+         +-----+             +---------+
| app | -------> | X server | ------> | GPU | ----------> | monitor |
+-----+          +----------+         +-----+             +---------+
        text or               varies          VGA, DVI, 
	image                                 HDMI, ...

# text console
If the application is running directly in a text console, i.e. a terminal 
provided by the kernel rather than by a terminal emulator application, the
same principles apply. The interface between the terminal and the 
application is still a byte stream which transmits characters, with 
special keys and commands encoded as escape sequences.

# remote text app
+-----+             +------+		  +-----+             +----------+
| app | <---------> | sshd | <----------> | ssh | <---------> | terminal |
+-----+             +------+		  +-----+             +----------+
        byte stream          byte stream          byte stream
	(char/seq)           over TCP/...         (char/seq)

# remote X11 app
+-----+              +------+		+-----+              +----------+
| app | <----------> | sshd | <-------> | ssh | <----------> | X server |
+-----+              +------+		+-----+              +----------+
        X11 protocol          X11 over          X11 protocol
			      TCP/...         



* the X server reads input event through a device file: /dev/input/eventN
* Apps connected to the X server will receive a notification when a key is
  pressed when a window of that app has tha focus.
* the interface between the terminal emulator and the text mode app is a
  pseudo-terminal (pty), a **character device** which transmits bytes.
* When the terminal emulator receives a key press event, it transforms 
  this into one or more bytes which the app gets to read from the pty 
  device.
* In a terminal, if you type Ctrl+V followed by a key combination, this
  inserts the first byte of the escape sequence from the key combination
  literally. Since escape sequence normally consist only of printable 
  characters after the first one, this inserts the whole escape sequence
  literally ???


keycode:    numeric, a 8-bit unsigned interger
keysym:	    key symbol, such as: A, aacute, F1, KP_Add, Control_L...
  modifier: Shift, Ctrl, Meta, CapsLk

each keycode can be map into several keysyms (7 or 8), they can be 
distinuish with level 1-4 (the most used ones). 
* level 1   literal char
* level 2   with **Shift modifier** pressed
* level 3   with **CapsLock modifier** pressed
* level 2   with both **Shift and CapsLock modifier** pressed


> showkey   # in a virtual console:
> > -a	    ascii code
> > -k	    key code
> > -s	    scan code
> man 5 keymaps
> xmodmap   
> > mapping KEYCODEs into KEYSYMs
