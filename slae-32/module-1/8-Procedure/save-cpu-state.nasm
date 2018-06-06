; filename: save-cpu-state.nasm
; author: lawly
; description: write a program which saves registers and
;              flags before calling a procedure
;              It should also save / restore the frame pointer
;

global _start

section .text

PrintMyName:
    push ebp                    ; function prologue
    mov ebp, esp

    mov eax, 0x4                
    mov ebx, 1
    mov ecx, name
    mov edx, mlen
    int 0x80

    leave                       ; function epilogue
                                ; mov esp, ebp
                                ; pop ebp
    ret                         

_start:
    mov ecx, 0x3

NameLoop:
    pushad                      ; should also push ESP
    pushfd                      ; preserve registers
    call PrintMyName            
    popfd
    popad
    loop NameLoop

    ; exit
    mov eax, 0x1
    mov ebx, 0xb
    int 0x80

section .data
    name     db      "Hello l4wly", 0xa
    mlen     equ     $-name