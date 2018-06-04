; filename: add-subtract.nasm
; author: lawly
; description: demonstation of add, adc, sub, subb, clc, stc, cmc
;
; (gdb) display/x $eax
; (gdb) display/x $ebx
; (gdb) display/x $ecx
; (gdb) define hook-stop
; >x/xb &var1
; >x/xh &var2
; >x/xw &var3
; >print $eflags
; >disassemble $eip,+10
; >end
;

global _start

section .text
_start:

    ; register based addition
    mov eax, 0                      ; mov 0 into EAX
    add al, 0x22                    ; add 0x22 to EAX
    add al, 0x11                    ; add 0x11 to EAX

    mov ax, 0x1122                  ; mov 0x1122 into EAX
    add ax, 0x3344                  ; add 0x3344 to EAX

    mov eax, 0xffffffff             ; EAX = -1
    add eax, 0x10                   ; add 16 to -1, EAX = 0xf, CF = 1

    ; memory based addition
    mov eax, 0
    add byte [var1], 0x22           ; add 0x22 to 0
    add byte [var1], 0x11           ; [var1] = 0x33

    add word [var2], 0x1122         ; add 0x1122 to 0
    add word [var2], 0x3344         ; [var2] = 0x4466

    mov dword [var3], 0xffffffff    ; [var3] = -1
    add dword [var3], 0x10          ; add 16 to -1, [var3] = 0xf, CF = 1

    ; set / clear / complement carry flag
    clc                             ; set CF = 0
    stc                             ; set CF = 1
    cmc                             ; complements CF, CF = 0

    ; add with carry
    mov eax, 0
    stc                             ; CF = 1
    adc al, 0x22                    ; desc = dest + src + CF, EAX = 0x23
    stc                             
    adc al, 0x11                    ; EAX = 0x23 + 0x11 + 0x1 = 0x35

    mov ax, 0x1122
    stc
    adc ax, 0x3344                  ; EAX = 0x4467

    mov eax, 0xffffffff             
    stc
    adc eax, 0x10                   ; EAX = -1 + 16 + 1 = 16 (0x10)

    ; subtract
    mov eax, 10
    sub eax, 5
    stc
    sbb eax, 4                      ; EAX = 5 - 4 - 1 = 0

    ; increment / decrement
    inc eax                         ; increment EAX by 1
    dec eax                         ; decrement EAX by 1

    ; exit
    mov eax, 0
    inc eax
    stc                             ; set CF = 1
    adc ebx, eax                    ; EBX = 0x2, check with echo $?
    int 0x80

section .data

    var1    db      0x00
    var2    db      0x0000
    var3    db      0x00000000



    