// filename: exit-shellcode.c
// author: lawly
// gcc -m32 -fno-stack-protector -z execstack exit-shellcode.c -o exit-shellcode

#include <stdio.h>
#include <string.h>

unsigned char code[] = \
    "\x31\xc0\xb0\x01\x31\xdb\xb3\x10\xcd\x80";

int main() {
    printf("shellcode length: %d\n", strlen(code));
    int (*ret)() = (int(*)())code;
    ret();
}
