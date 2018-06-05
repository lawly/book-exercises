; filename: mul-div.nasm
; author: lawly
; description: demonstation of mul, imul, div, idiv
;

global _start

section .text
_start:

    ; unsigned r/m8 multiplication
    mov eax, 0x0
    mov al, 0x10
    mov bl, 0x2                     ; multiply AL * BL = 0x10 * 0x2 = 0x20
    mul bl

    mov al, 0xff                    ; multiply 0xff * 0x2 -> does not fit into AL, CF and OF get set to 1
    mul bl

    ; unsigned r/m16 multiplication
    mov eax, 0x0
    mov ebx, 0x0

    mov ax, 0x1122
    mov bx, 0x0002
    mul bx

    ; ; unsigned r/m16 multiplication
    mov eax, 0x11223344
    mov ebx, 0x00000002
    mul ebx
    
    mov eax, 0x11223344
    mov ebx, 0x55667788
    mul ebx

    ; multiplication using memory locations
    mul byte [var1]                 ; AX = AL * 0x5
    mul word [var2]                 ; DX:AX = AX * 0x1122
    mul dword [var3]                ; EDX:EAX = EAX * 0x11223344

    ; division using r/m16
    mov dx, 0x0                     
    mov ax, 0x7788                
    mov cx, 0x2
    div cx                          ; DX:AX / 0x2 = 0x00007788 / 0x0002, AX = 0x3bc4, DX = 0x0

    mov ax, 0x7788 + 0x1
    mov cx, 0x2
    div cx                          ; remainder 1, DX = 0x1

    ; signed multiplication using r/m8
    mov eax, 0xff
    mov ebx, 0x2
    imul bl                         ; AX = AL * BL = -1 * 0x2 = 0xfffe

    ; signed division using r/m16
    mov edx, 0xfe0c
    mov eax, 0xfed4
    mov bx, 0x1122
    idiv bx                         ; DX:AX / BX = 0xfe0cfed4 / 0x1122
                                    ; -32702764 / 4386 => AX = 0xe2e0 (-7456), remainder: 0xfd14 (-748)
    ; exit
    mov eax, 0x81
    mov ebx, 2 
    mul bl                          ; AX = 0x100 (256), CF = 1, OF = 1
    sbb eax, 0x100                  ; EAX = 0x102 - 0x100 - 1 = 1
    int 0x80

section .data

    var1    db      0x05
    var2    dw      0x1122
    var3    dd      0x11223344

