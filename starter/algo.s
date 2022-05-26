BITS 	      32
SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1


section .data
	msg1 db "Choose a digit(zero to nine): "
	len1 equ $ -msg1
	
	msg2 db "Choose a second digit(zero to nine): "
	len2 equ $ -msg2

	msg3 db "The sum of choosen digits is :"
	len3 equ $ -msg3

section .bss
	nb1 resb 1
	nb2 resb 1
	sum resb 1

section .text
	global _start

_start:
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, len1
	int 0x80

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, nb1
	mov edx, 1
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, len2
	int 0x80
	
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, nb2
	mov edx, 1
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg3
	mov edx, len3
	int 0x80

	mov eax, nb1
	sub eax, '0'

	mov ebx, nb2
	sub ebx, '0'

	add eax, ebx
	add eax, '0'

	mov sum, eax

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, sum
	mov edx, 1
	int 0x80

_exit:
	mov eax, SYS_EXIT
	mov ebx, 0
	int 0x80
