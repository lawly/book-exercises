# compile.sh
# Author: lawly
# Description: simple shell script to assemble and link assembly code. use without extension
# ./compile.sh helloworld
#

echo "[+] Assembling with Nasm ..."
nasm -f elf32 -o $1.o $1.nasm

echo "[+] Linking ..."
ld -m elf_i386 -o $1 $1.o

echo "[+] Done!"