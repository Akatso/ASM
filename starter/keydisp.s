BITS 32

section .data
	userMsg db "Enter your nickname please: " ; define byte
	lenUserMsg equ $ - userMsg		 ; len of userMsg
	displayMsg db "Your nickname is: "	 ; define byte
	lenDisplayMsg equ $ - displayMsg	 ; len of displayMsg

section .bss
	nickname resb 20 ; reserve 20 for nickname

section .text
	global _start

_start:
	; ask nickname
	mov eax, 4          ; syscall write for userMsg db
	mov ebx, 1          ; STDOUT fd
	mov ecx, userMsg    ; userMsg disp question
	mov edx, lenUserMsg ; lenUserMsg
	int 0x80            ; kernel stop

	; read input and fill nickname bss
	mov eax, 3 	  ; syscall read
	mov ebx, 0	  ; STDIN
	mov ecx, nickname
	mov edx, 20
	int 0x80

	; your nickneme is
	mov eax, 4
	mov ebx, 1
	mov ecx, displayMsg
	mov edx, lenDisplayMsg
	int 0x80
	
	; input of user
	mov eax, 4
	mov ebx, 1
	mov ecx, nickname
	mov edx, 20
	int 0x80

_exit:
	mov eax, 1
	mov ebx, 0
	int 0x80
