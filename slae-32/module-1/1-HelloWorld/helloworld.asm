; HelloWorld.asm
; Author: lawly
; desciption: print "Hello World!" to stdout and exit
;
; nasm -f elf32 -o helloworld.o helloworld.asm
; ld -m elf_i386 -o helloworld helloworld.o

global _start			; global identifier, default entry for linker

section .text			; text segment

_start:					; entry point

	; ssize_t write(int fd, const void *buf, size_t count);
	mov eax, 0x4		; #define __NR_write 4
	mov ebx, 0x1		; fd = 1, stdout
	mov ecx, message	; pointer to buffer
	mov edx, mlen		; = mov edx, 0xC ;length of buffer
	int 0x80

	; void _exit(int status);
	mov eax, 0x1
	mov ebx, 0x5
	int 0x80

section .data							; data segment

	message: 	db 	"Hello World", 0xa	; label for referencing
	mlen 		equ $-message			; compute message length