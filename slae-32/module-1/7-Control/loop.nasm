; filename: loop.nasm
; author: lawly
; description: prints two cute cats
;

global _start

section .text
_start:
    jmp entry

    mov eax, 0x1
    mov ebx, 0xa
    int 0x80

entry:
    mov ecx, 0x2

printMessage:
    push ecx                ; save ECX
    
    mov eax, 0x4
    mov ebx, 1
    mov ecx, cat
    mov edx, len
    int 0x80

    pop ecx                 ; restore ECX
    loop printMessage       ; decrement count; jump short if count ≠ 0.
                            ; signed offset relative to EIP

    ; exit
    mov eax, ecx
    inc eax
    mov ebx, 0xa
    int 0x80

section .data
    cat:    db  " /\_/\", 0xa
            db  "( o.o )", 0xa
            db  " > ^ <", 0xa
    len:    equ $-cat