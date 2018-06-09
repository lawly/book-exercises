; filename: exit-nonull.nasm
; author: lawly
; description: invokes exit syscall. produces null-free shellcode
;
; build:
; nasm -f elf32 -o exit-nonull.o exit-nonull.nasm 
; ld -m elf_i386 -o exit-nonull exit-nonull.o 
;
; "\x31\xc0\xb0\x01\x31\xdb\xb3\x10\xcd\x80"
;

global _start 

section .text
_start:

    xor eax, eax
    mov al, 0x1
    xor ebx, ebx
    mov bl, 0x10
    int 0x80
