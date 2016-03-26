import os
import sys

filename = sys.argv[1].split('.')[0]
source_file = filename + '.c'
elf_file = filename + '.elf'
object_file = filename + '.o'
hex_file = filename.upper() + '.hex'

os.system("avr-gcc -g -Os -mmcu=atmega8 -c " + source_file)
os.system("avr-gcc -g -mmcu=atmega8 -o " + elf_file + " " + object_file)
os.system("avr-objcopy -j .text -j .data -O ihex " + elf_file + " " + hex_file)
