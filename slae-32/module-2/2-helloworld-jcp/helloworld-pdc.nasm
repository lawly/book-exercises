; filename: helloworld-pdc.nasm
; author: lawly
; description: prints hello world using position dependent code, not shellcode compatible
;

global _start			

section .text			

_start:				

    ; write
	xor eax, eax
	mov al, 0x4

    xor ebx, ebx	
	mov bl, 0x1

	mov ecx, message		; => 0x56557026 <code+6>: mov    ecx,0x804909c
							; (gdb) x/s 0x804909c
							; 0x804909c:      <error: Cannot access memory at address 0x804909c>

	xor edx, edx
    mov dl, 0xc
    
	int 0x80

    ; exit
	xor eax, eax
	mov al, 0x1
	int 0x80

section .data
	; this will most likely fail in later shellcode because the address of message will be hardcoded
	; but we only dump the .text section. chances are high this address is not accessible in our injected process.
	; it must be referenced dynamically via runtime

	message: 	db 	"Hello World", 0xa	