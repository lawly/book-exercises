#!/bin/bash

# compile-ld.sh
# author: lawly
# description: assemble and link nasm files. use without extension
# usage: ./compile.sh yournasmfile

echo "[+] Assembling with Nasm ..."
nasm -f elf32 -o $1.o $1.nasm

echo "[+] Linking ..."
ld -m elf_i386 -o $1 $1.o

echo "[+] Done!"