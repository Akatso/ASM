; compile : nasm -f elf32 toto.s && ld toto.o -m elf_i386 -o toto

BITS 64

section .bss
	buffer resb 10 ; char buf[256]

section .text
	global _start

_start: ; read input
	mov eax, 3 ; 
	mov ebx, 0 ; STDIN lire entrer clavier 
	mov ecx, buffer ;
	mov edx, 10 ;
	int 0x80 ; read(0, buffer, 100);

	mov eax, 4 ; write buffer
	mov ebx, 1 ; stdout donc 1 sortie standard
	mov ecx, buffer ; 
	mov edx, 10 ; len buffer
	int 0x80 ; kernel

_exit:
	mov eax, 1 ; 
	mov ebx, 0 ; return 0
	int 0x80 ; 
