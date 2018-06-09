#!/bin/bash

# sudo apt-get install gcc-multilib
# sudo pacman -S lib32-gcc-libs 

# compile-gcc.sh
# author: lawly
# description: needed when using external libc functions. use without extension
# usage: ./compile.sh yournasmfile

echo '[+] Assembling with Nasm ... '
nasm -f elf32 -o $1.o $1.nasm

echo '[+] Linking ... '
gcc -m32 -o $1 $1.o

echo '[+] Done!'