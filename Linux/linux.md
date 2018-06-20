## Linux
The key of a linux system is files and process. files specifies what to operate,
and process know how to operate.

## Hierarchy
/usr : user resource
    |
    |--bin: usual binary 
    |
    |--games: game binary
    |
    |--sbin: administrative programs
    |
    |--share: Architecture-independent data
	|
	|-- doc: documentation


/var :	variant data
    |
    |---lib:	data produced by the service.
    |
    |---run:	PID of service

## Configuration
- Global Configuration:	/etc/xxxrc, /etc/xxx.conf
- Personal conf: ~/.xxxrc, ~/.xxx/xxxrc

### e.g.
/etc :
    |---init.d:    service initialization script
    |
    |---sysconfig: initialization configuration 
    |

## Process
/proc :
    |-- PID/ 
    |-- net/ :	    network info.
	|-- dev :   network devices compiled into the kernel.
	|-- route : routing table
	|-- snmp :  stat. of higher levels of the network protocol.
    |-- cmdline	:   boot command
    |-- cpuinfo :   
    |-- devices :
    |-- filesystems :	loaded filesystem
    |-- interrupts :	IRQ
    |-- ioports :   I/O address
    |-- kcore :	    the entire RAM contents as seeb by the kernel
    |-- loadavg :   load average
    |-- meminfo :   memory info
    |-- modules
    |-- mounts :
    |-- stat :	    statistics of usage of system resources.
    |-- swaps
    |-- partitions
    |-- uptime
    |-- version
    |-- bus/*

Every single program that is running, the entire contents of memory, the
internal workings of the kernel -- all the processes currently running on
the system are contained in the /proc file system. **This file system 
exist only while there is a program actually looking at them**, the 
kernel supplies the info from its internal states.

## range
usually, for a software, the system wide files ( configuration, fonts,
doc.... ) will be stored under /usr/share. While local (personal) files will
be stored in ~username/.software or ~/username/.local/software

## Kernel
linux kernel : /boot/vmlinuz[-version]
RAM Disk to unzip kernel image : /boot/initramfs[-version]
kernel module : /lib/modules/version/kernel, or /lib/modules/$(uname -r)/kernel
kernel source code: /usr/src/linux, or /usr/src/kernels/
