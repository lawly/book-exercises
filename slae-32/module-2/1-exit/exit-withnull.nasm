; filename: exit-withnull.nasm
; author: lawly
; description: invokes exit syscall. shellcode contains null bytes
;
; "\xb8\x01\x00\x00\x00\xbb\x0a\x00\x00\x00\xcd\x80"
;

global _start

section .text
_start:

    mov eax, 0x1        ; will contain null bytes
    mov ebx, 0xa
    int 0x80