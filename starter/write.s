BITS 32 ; whats bits ?

; ssize_t	write(int fd, const void *buf, size_t count)
; *edx		eax       ebx            ecx          *edx

section .data
	msg db "my string", 0 ; 0 is for null byte && db is for define byte for string
	len equ $ - msg ; len of msg && equ mean equal '=' &&  $ mean current addr of msg

section .text
	global _start

_start: ;
	mov eax, 4 ; syscall write
	mov ebx, 1 ; STDOUT
	mov ecx, msg ; string to display 
	mov edx, len ; len of msg
	int 0x80 ; interrupt kernel
	
_exit:
	mov eax, 1 ; syscall exit
	mov ebx, 0 ; like return(0)
	int 0x80 ; interrupt kernel call
