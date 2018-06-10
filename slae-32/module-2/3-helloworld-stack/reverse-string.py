#!/usr/local/bin/python3

# filename: reverse-string.py
# author: lawly
# description: reverses a string and outputs its hex representation

text = 'HelloWorld\n'
encoded = text[::-1].encode('utf-8').hex()
print(encoded)