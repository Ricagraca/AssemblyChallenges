        section .text

        ; Export the entry point to the ELF linker or loader.  The conventional
        ; entry point is "_start". Use "ld -e foo" to override the default.
        global _start

        section .bss              
	array resb 64  

        section .text

        ; int main, entry point:
        _start:

	call read_string
	call print_string
	
        mov ebx,0   ;process' exit code
        mov eax,1   ;system call number (sys_exit)
        int 0x80    ;call kernel - this interrupt won't 
	ret
	
	read_string:
        mov edx,64      ;message length
	mov ecx,array
        mov eax,3       ;system call number (sys_read)
        int 0x80        ;call kernel
	mov [len],edx
	ret
	
	print_string:
        mov edx,len     ;message length
        mov ecx,array   ;message 
        mov eax,4       ;system call number (sys_write)
        int 0x80        ;call kernel
	ret 

        section .data 	;length of our dear string
	len DB 48
