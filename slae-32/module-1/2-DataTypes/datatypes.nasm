; datatypes.nasm
; Author: lawly
; Description: demonstrates different data types
;
; 
; gdb -q ./datatypes
;

global _start

section .text
_start:
    mov eax, 0x1
    mov ebx, 0x5
    int 0x80

; initialized data
section .data
    example1: db 0xFF
	example2: db 0xEE, 0xDD, 0xCC,
	example3: dw 0xBB
	example4: dd 0xDEADBEEF
	example5: dd 0x123456
	example6: times 6 db 0xAA

; uninitialized data
section .bss
	buff1: resb 100
	buff2: resw 20
