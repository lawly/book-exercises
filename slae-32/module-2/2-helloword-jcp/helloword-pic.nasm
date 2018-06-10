; filename: helloword-pic.nasm
; author: lawly
; description: print hello world using position independent code, shellcode compatible
;
; nasm -f elf32 -o helloword-pic.o helloword-pic.nasm
; ld -m elf_i386 -o helloword-dynamic helloword-dynamic.o
; objdump -d ./helloword-pic |grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'
;

global _start			

section .text			

_start:		

	jmp short call_shellcode

shellcode:
    ; write
	xor eax, eax
	mov al, 0x4

    xor ebx, ebx	
	mov bl, 0x1

	pop ecx

	xor edx, edx
	mov dl, 0xd
    
	int 0x80

    ; exit
	xor eax, eax
	mov al, 0x1
	int 0x80

call_shellcode:
	call shellcode						; this will push the string's address onto the stack 
										; and ensures access at runtime!
	HelloWorld db "Hello World!", 0xa