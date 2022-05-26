BITS 32

section .data
	msg db "hello", 0 ; char msg[] = "hello"
	len equ $ - msg ; $ Get current position in the section

section .text
	global _start

_start:
	mov eax, 4 ; mettre 4 dans eax, on write
	mov ebx, 1 ; stdout // sortie standard
	mov ecx, msg ; str
	mov edx, len ; len de str
	int 0x80     ; kernel interrupt

_exit:
	mov eax, 1 ; exit syscall
	mov ebx, 0 ; arg1 0
	int 0x80   ; exit(0);
