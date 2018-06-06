; filename: control.nasm
; author: lawly
; description: demonstation of logic operators
;

global _start

section .text
_start:
    jmp Begin

NeverExecute:
    mov eax, 0x10
    xor ebx, ebx

Begin:
    mov eax, 0x5

PrintHW: 
    push eax                    ; eax used as counter, preserve register

    mov eax, 0x4                ; print hello write using write syscal
    mov ebx, 1
    mov ecx, message
    mov edx, mlen
    int 0x80

    pop eax
    dec eax
    jnz PrintHW                 ; jmp while eax > 0, jne rel8 / jnz rel8 have same op-code 0x75

    mov eax, 0x1
    mov ebx, 0xa
    int 0x80

section .data
    message     db      "Hello World", 0xa
    mlen        equ     $-message