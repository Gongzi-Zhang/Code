# What's an OS 


# questions

# Configuration (options)
systematic -- local (user specific) -- Application -- Usage (command-line options)


# Operating System
batch processing
input/output interrupt
memory management	Disk Access/File system
buffering 
multitasking
spooling
runtime libreries
link-loading
device driver:
    Computers and their OS cannot be expected to know how to control every device, both now and 
    in the future.
network
security

#  file and file system

## file type
Symbol	Meaning
-	Regular file
d	Directory
l	link
c	Special file
s	Socket
p	Named Pipe
b	Block device
## file attribute
default:
* mode
* ownership
* timestamps
additional: 
* context
* links
* xattr
* all
## timestanmps
access time: atime - the last time the file was read
modify time: mtime - modify file content
change time: ctime - change file meta data(e.g. permissions, ownership)

## file system
inode && superblock (backup)


## The kernel
The kernel is the heart of the system. It manages the communication 
between the udnerlying hardware and the peripherals. The kernel also
makes sure that processes and daemons are started and stopped at 
the exact right times.

## the boot process
When an x86 computer is booted, the processor looks at the end of the 
system memory for the BIOS (Basic Input/Output System) and runs it. The
BIOS program is written into permanent read-only memory and is always a
vailable for use. The BIOS provides the lowest level interface to 
peripheral devices and controls the first step of the boot process.
  
The BIOS tests the system, looks for and checks peripherals, and then 
looks for a drive to use to boot the system. Usually it checks the 
floppy drive (or CD-ROM drive on many newer systems) for bootable media
, if present, and then it looks to the hard drive. The order of the 
drives used for booting is usually controlled by a particular BIOS 
setting on the system. Once Linux is installed on the hard drive of a 
system, the BIOS looks for a Master Boot Record (MBR) starting at the 
first sector on the first hard drive, loads its contents into memory, 
then passes control to it.

This MBR contains instructions on how to load the GRUB (or LILO) 
boot-loader, using a pre-selected operating system. The MBR then loads 
the boot-loader, which takes over the process (if the boot-loader is 
installed in the MBR). In the default Red Hat Linux configuration, GRUB
uses the settings in the MBR to display boot options in a menu. Once 
GRUB has received the correct instructions for the operating system to 
start, either from its command line or configuration file, it finds the
necessary boot file and hands off control of the machine to that 
operating system.

# question:
why boot need MBR, if we specify a static memory position for BIOS to 
start loading, then anything can be there, even GPT will also work  ???

## groups
id	show what group you are now
newgrp groupname    change to a new group, so after that, everything
		    you create will be owned by the new group

chmod o+t dir.	    set dir. sticky bit. which allow a user to change
		    only their own files or when the file has 
		    appropriate permissions.
SUID	    giving user(owner) permissions on the file instead of with
	    those of the user issuing the command, thus giving access 
	    to system resources( usually for binary file).
SGID	    for a dir with this set, every file created within it
	    will have the same group owner as the dir. itself.

# permissions
for a dir., any operation to it need the x permission, to read its
content, one need read permission, and finally, to write or delete
files and subdir., one need write permission. if you don't have x 
permission then even you have r or w permission, you are also not allow
any operation to this dir. So, one interesting thing is that if you 
have such permission of -wx, so you can touch or rm files(if you know 
it name) within this dir.  but you can't see anything in it. 
If 'sticky bit' mode not set, anybody who has write permission of some 
dir. can rm files created by other people(who don't have any permission
), therefore, sticky bit is useful for public dir. to protect files of 
each other from being damaged by others.( why not just set the write 
permission of a dir. to write and rm only files owned by the user ??? )
( the x permission is useful for pass of permission of a dir.: for 
example, you may not have read or write permission on a dir. but with 
its x permission, we may be assigned read or write permission of its 
subdir.)

# Process attribute
PID:	process ID
PPID:	parent PID
Nice number: the degree of friendliness of this process toward other 
	     processes.(not to be confused with process priority, 
	     which is calculated based on this nice number and 
	     recent CPU usage of the process.)
Terminal or TTy:    
RUID and EUID: real user, who issuing the command; and effective user, 
	       who determining access to system resources.(SUID)
RGID and EGID: real and effective group ID


# /dev
/dev/loop0
    A loopback device is a gimmick that allows an ordinary file to be
    access as if it were a block device. This permits mounting
    an entire filesystem within a single large file.

# * * * * * * * * * * * * * * * * * * * * * * * * * * * ** * * * * *  #
# A block device reads and/or writes data in chunks, or blocks, in    #
# contrast to a character device, which accesses data in character    #
# units. Example of block devices are hard drives, CDROM drives, and  #
# flash drives. Example of character devices are keyboards, modems,   #
# sound cards.
# * * * * * * * * * * * * * * * * * * * * * * * * * * * ** * * * * *  #
/dev/tcp/...
    When executing command on a /dev/tcp/$host/$port pseudo-device file
    Bash opens a TCP connection to the associated socket.

# * * * * * * * * * * * * * * * * * * * * * * * * * * * ** * * * * *  #
# A socket is a communications node associated with a specific I/O    #
# port (This is analogous to a hardware socket, or receptacle, for a  #
# connecting cable.) It permits data transfer between hardware        #
# devices on the same machine, between machines on the same network,  #
# between machines across different networks, and, of course, between #
# machines at different locations on the Internet.                    #
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * #

/proc
    this special dir. keep mirrors of memory contents, we can find
    many useful runtime info here.

    cpuinfo
    memifno
    modules # hardware modules
    mounts  # mounted devices

#    terminals and modes

Normally, a terminal works in the canonical mode. When a user hits a 
key, the resulting character does not immediately go to the program 
actually running in this terminal. A buffer local to the terminal 
stores keystrokes. When the user hits the ENTER key, this sends all the
stored keystrokes to the program running. There is even a basic line 
editor inside the terminal.

-----------------------------------------------------------------------
    bash$ stty -a
    speed 9600 baud; rows 36; columns 96; line = 0;
    intr = ^C; quit = ^\; erase = ^H; kill = ^U; eof = ^D; eol = <undef>; eol2 = <undef>;
    start = ^Q; stop = ^S; susp = ^Z; rprnt = ^R; werase = ^W; lnext = ^V; flush = ^O;
    ...
    isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt
-----------------------------------------------------------------------

Using canonical mode, it is possible to redefine the special keys for 
the local terminal line editor.

-----------------------------------------------------------------------
    bash$ cat > filexxx
    wha<ctl-W>I<ctl-H>foo bar<ctl-U>hello world<ENTER>
    <ctl-D>
    bash$ cat filexxx
    hello world	    
    bash$ wc -c < filexxx
    12	    
-----------------------------------------------------------------------

The process controlling the terminal receives only 12 characters 
(11 alphabetic ones, plus a newline), although the user hit 26 keys.

In non-canonical ("raw") mode, every key hit (including special editing
keys such as ctl-H) sends a character immediately to the controlling 
process.

The Bash prompt disables both icanon and echo, since it replaces the 
basic terminal line editor with its own more elaborate one. For example
, when you hit ctl-A at the Bash prompt, there's no ^A echoed by the 
terminal, but Bash gets a \1 character, interprets it, and moves the 
cursor to the begining of the line.

# uid
Current user's user identification number, as recorded in /etc/passwd

This is the current user's real id, even if she has temporarily assumed
another identity through su. $UID is a readonly variable, not subject 
to change from the command line or within a script, and is the 
counterpart to the id builtin.

#EUID
effective user ID number
Identification number of whatever identity the current user has 
assumed, perhaps by means of su.


# Time
In linux, there are two time system:
1: Hardware time : which run within CPU, separate from any other
system control programs. It's also called Real Time Clock(RTC), BIOS
clock or CMOS time system.
2: system time : which is maintained by Linux kernel, and drived by
Time Interruption Program. This time is meaningful only during the
operation of OS. It counts from UTC (Universal Time Coordinated),
which is the seconds from 1970/1/1/ 0:0:0

What really work within linux is the system time, the only function of
Hardware time is keep time record when linux is down. When system is 
booted, linux will synchronize hardware time with system time 
automatically, while when linux shutdown, it will synchronize the 
system tiem into hardware time. Synchronization is achieve through
/sbin/hwclock
				   

# Drivers
how system recognized a peripheral divece using build-in drives.
