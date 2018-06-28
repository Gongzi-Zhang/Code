**EOF** is not a character, but something that is return by the system *read*
system call to indicate the end of file.

Ctrl+D, when typed at the start of a line on a terminal, signifies the 
end of the input. This is not a *signal* in the unix sense: when an 
application is reading from the terminal and the user presses Ctrl+D, 
the application is notified that the end of the file has been reached.
What happens is that when the program reads from the terminal, the 
terminal tells it: this is the end of the file. Same as when a program 
tries to read after the end of a disk file.

see [wiki](https://en.wikipedia.org/wiki/End-of-Transmission_character)
