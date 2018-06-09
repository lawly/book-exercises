; filename: strings.nasm
; author: lawly
; description: invoke libc functions
;
; nasm -f elf32 -o libc.o libc.nasm
; gcc -m32 -o libc libc.o
;

extern printf
extern exit

global main

section .text
main:

    push message
    call printf
    add esp, 0x4        ; adjust the stack

    push 0xa
    call exit

section .data
    message:    db      "Hello World", 0xa, 0x00
    mlen        equ     $-message
