        section .text

        ; Export the entry point to the ELF linker or loader.  The conventional
        ; entry point is "_start". Use "ld -e foo" to override the default.
        global _start

        section .data
        msg db  'Hello, world!', 0xa ;our dear string
        len equ $ - msg              ;length of our dear string

        section .bss                

        section .text

        ; int main, entry point:
        _start:

        ; Write the string to stdout:

        ; Exit via the kernel:

        mov edx,len ;message length
        mov ecx,msg ;message to write
        mov eax,4   ;system call number (sys_write)
        int 0x80    ;call kernel

        mov ebx,0   ;process' exit code
        mov eax,1   ;system call number (sys_exit)
        int 0x80    ;call kernel - this interrupt won't 
