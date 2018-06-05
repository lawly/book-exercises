; filename: logic-operators.nasm
; author: lawly
; description: demonstation of logic operators
;

global _start

section .text
_start:

    ; AND
    mov al, 0x10                    ; 0001 0000
    and al, 0x1                     ; 0000 0001 -> AL = 0000 0000

    and byte [var1], 0xa            ; [var1] = 0xa
    and word [var2], 0x1122         ; [var2] = 0x1100

    ; OR
    mov al, 0x10            
    or al, 0x1                      ; AL = 0x11

    or byte [var1], 0xaa            ; [var1] = 0xaa

    mov eax, 0
    or eax, 0x0                     ; EAX = 0

    ; XOR
    xor dword [var3], 0x1337cafe    ; [var3] = 0
    xor dword [var3], 0x1337cafe    ; [var3] = 0x1337cafe

    ; NOT
    mov eax, 0xffffffff
    not eax                         ; EAX = 0
    not eax                         ; EAX = -1 = 0xffffffff

    ; exit
    mov eax, 0x5
    and al, 0x1
    mov ebx, 0x10
    int 0x80

section .data
    var1    db      0xaa
    var2    dw      0xbbcc
    var3    dd      0x1337cafe