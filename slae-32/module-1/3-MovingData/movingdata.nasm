; filename: movingdata.nasm
; author: lawly
; description: demonstration of mov instruction
;
; gdb -q ./movingdata
;
; useful hook-stop:
; (gdb) define hook-stop
; >print/x $eax
; >print/x $ebx
; >print/x $ecx
; >x/8xb &var1
; >disassemble $eip,+10
; >end
;

global _start

section .text
_start:
    ; mov immediate data into register
    mov eax, 0xdeadcafe                 ; mov 0xdeadcafe into EAX
    mov ax, 0xaabb                      ; mov 0xaabb into EAX. EAX = 0xdeadaabb
    mov ah, 0x13                        ; mov 0x13 into AH. EAX = 0xdead13bb
    mov al, 0x37                        ; mov 0x37 into AL. EAX = 0xdead1337

    ; mov register into register
    mov ebx, eax                        ; mov EAX into EBX. EBX = 0xdead1337
    mov cx, ax                          ; mov AX (0x1337) into CX
    mov dh, ah                          ; mov AH (0x13) into DH
    mov dl, al                          ; mov AL (0x37) into DL, DX = 0x1337

    mov eax, 0                          ; clear register
    mov ebx, 0                          ; clear register
    mov ecx, 0                          ; clear register

    ; mov from memory into register
    mov al, [var1]                      ; mov 1 byte from dereferenced memory address of var1 into AL. AL = 0xbe
    mov ah, [var1+1]                    ; .. AH = 0xef, AX = 0xefbe
    mov bx, [var1]                      ; mov 2 byte from dereferenced memory address of var1 into BX. BX = 0xefbe
    mov ecx, [var1]                     ; mov 4 bytes (dword) from ... into ECX. ECX = 0xfecaefbe

    ; mov from register into memory
    ; size directive necessary!
    mov ebx, 0x1337cafe
    mov byte [var1], bl                 ; mov 1 byte from BL into [var1]: var1 = 0xfe, 0xef, 0xca, 0xfe, 0x13, 0x37, 0x00, 0x00
    mov word [var1], bx                 ; mov 2 byte from BX into [var1]: var1 = 0xfe, 0xca, 0xca, 0xfe, 0x13, 0x37, 0x00, 0x00

    ; mov immediate value into memory
    mov dword [var1], 0xaabbccdd        ; mov 0xaabbccdd into [var1]: var1 = 0xdd, 0xcc, 0xbb, 0xaa, 0x13, 0x37, 0x00, 0x00

    ; load effective address
    lea eax, [var1]                     ; load address of var1 into EAX
    lea ebx, [eax]                      ; load value of EBX into EAX
    lea eax, [var1+4]
    mov ebx, eax                        ; similar to above instructions

    ; x-change
    mov eax, 0xaabbccdd
    mov ebx, 0x11223344
    xchg eax, ebx                       ; EAX = 0x11223344, EBX = aabbccdd

    ; call exit using xchg, just for the lulz ;)
    mov ebx, 0x1
    mov eax, 0x5
    xchg eax, ebx
    int 0x80

section .data
    var1:   db  0xbe, 0xef, 0xca, 0xfe, 0x13, 0x37, 0x00, 0x00