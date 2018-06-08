; filename: strings.nasm
; author: lawly
; description: example of string instructions
;

global _start

section .text

PrintDestination:
    mov eax, 0x4
    mov ebx, 0x1
    mov ecx, destination
    mov edx, sourceLen
    int 0x80
    ret

PrintString:
    mov eax, 0x4
    mov ebx, 0x1
    int 0x80
    ret

_start:    
    ; copy string from source to destination
    mov ecx, sourceLen              ; load message length into ECX
    lea esi, [source]               ; load effective address of source into ESI
    lea edi, [destination]          ; load effective address of source into EDI

    cld                             ; clear direction flag
    rep movsb                       ; repeat while ECX != 0, copies 1 byte from source to dest
                                    ; DF = 1, copy from high to low memory
                                    ; increments ESI/EDI ECX-times!

    ; string comparison with cmpsb
    ; compare source and destination
    mov ecx, sourceLen
    lea esi, [source]
    lea edi, [comparison]           
    repe cmpsb                      ; repeat while equal, terminates when: ECX = 0 / ZF = 0
                                    ; "Hello Word" = "Hello"?

    jz isEqual                     ; jump if strings were equal
    mov ecx, strUnequal
    mov edx, strUnequalLen
    call PrintString               
    jmp exit

isEqual:
    mov ecx, strEqual
    mov edx, strEqualLen
    call PrintString

exit:
    ; exit
    mov eax, 0x1
    mov ebx, 0x2
    int 0x80

section .data
    source:         db      "Hello World", 0xa
    sourceLen:      equ     $-source

    comparison:     db      "Hello"

    strEqual:       db      "Strings are equal", 0xa
    strEqualLen:    equ     $-strEqual

    strUnequal:     db      "Strings are not equal", 0xa
    strUnequalLen:  equ     $-strUnequal

; section for unititialized data
section .bss
    destination:    resb    100
