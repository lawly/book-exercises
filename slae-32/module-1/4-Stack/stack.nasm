; filename: stack.nasm
; author: lawly
; description: demonstation of stack structure
; 
; useful hook-stop:
; (gdb) display/x $eax
; (gdb) display/x $ebx
; (gdb) display/x $ecx
; (gdb) display/x $edx
; (gdb) display/x $esp
; (gdb) define hook-stop
; >x/8xb $esp
; >x/8xb &val
; >disassemble $eip,+10
; >end



global _start

section .text
_start:

    mov eax, 0x11223344
    push eax                ; push EAX onto stack, decrement ESP by 4
    push 0x1                ; push dword 0x00000001 onto stack, decrement ESP by 4, [ESP] points to 0x01

    push word [val]         ; push 0xbbaa onto stack, decrement ESP by 2
    
    ; can only pop 16 or 32 bits!
    pop ax                  ; pop 2 byte from stack into AX = 0xbbaa, increment ESP by 2
    pop word [val]          ; pop 2 bytes from stack into [val], increment ESP by 2

    pushad                  ; push all GP registers onto stack

    xor eax, eax            ; clear eax
    xor ebx, ebx
    xor ecx, ecx
    xor edx, edx

    popad                   ; pop saved GPs back into there registers

    ; as always call exit.. somehow..
    mov dword [esp], 1      ; ESP now points to 0x00000001
    xor eax, eax            ; clear eax
    pop ax                  ; puts 0x0001 into AX, EAX = 0x00000001, increment ESP by 2                 
    xor ebx, ebx            ; clear ebx
    pop bx                  ; pop 2 bytes off the stack into BX, EBX = 0x00000000
    add ebx, 0x5            ; EBX = 0x00000005
    int 0x80

section .data
    val:        db 0xaa, 0xbb, 0xcc, 0xdd