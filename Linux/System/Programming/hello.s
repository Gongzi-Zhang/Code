#----------------------------------------------------------------------
# Writes "Hello World"to the console using only system calls. Runs on
# 64-bits Linux only.
# To assemble and run:
#
#   gcc -c hello.s && ld hello.c && ./a.out
#
# or
#   
#   gcc -nostdlib hello.s && ./a.out
#--------------------------------------------------------------------

    .global _start

    .text
_start:
    # write(1, message, 13)
    mov	$1, %rax    # system call: 1 is write
    mov $1, %rdi    # file handle: 1 is stdout
    mov $message, %rsi	# address of string to output
    mov $13, %rdx   # invoke operating sytem to do the write
    syscall

    # exit(0)
    mov	$60, %rax   # system call: 60 is exit
    xor	%rdi, %rdi  # return code
    syscall

message:
    .ascii    "Hello World\n"

