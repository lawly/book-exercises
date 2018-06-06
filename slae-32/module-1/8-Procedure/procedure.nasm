; filename: procedure.nasm
; author: lawly
; description: use procedure in nasm
;

global _start

section .text

HelloWorldProc:
    mov eax, 0x4                ; print hello write using write syscal
    mov ebx, 1
    mov ecx, message
    mov edx, mlen
    int 0x80
    ret                         ; end of procedure, pops [ESP] into EIP

_start:
    mov ecx, 0x10

PrintHelloWorld:
    push ecx    
    call HelloWorldProc         ; push EIP onto stack
    pop ecx
    loop PrintHelloWorld

    ; exit
    mov eax, 0x1
    mov ebx, 0xa
    int 0x80

section .data
    message     db      "Hello World", 0xa
    mlen        equ     $-message