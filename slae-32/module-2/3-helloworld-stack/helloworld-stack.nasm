; filename: helloworld-pic.nasm
; author: lawly
; description:	prints hello world, by pushing the string in reversed order onto the stack
;				and using its reference
;

global _start			

section .text			

_start:		
	xor eax, eax
	mov al, 0x4

    xor ebx, ebx	
	mov bl, 0x1

	xor edx, edx
	push edx				; string's null termination

	push 0x0a646c72			; push "Hello World" in reverse order onto stack!
	push 0x6f57206f
	push 0x6c6c6548

	mov ecx, esp			; pointer to string
	mov dl, 0xd
	int 0x80

	xor eax, eax
	mov al, 0x1
	int 0x80