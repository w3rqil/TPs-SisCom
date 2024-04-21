#!/bin/bash

# Ruta a la carpeta build

if [ -d "./build" ]; then
    echo "  -> Removing old build directory."
    rm -rf ./build/*
else
    echo "  -> Creating build directory."
    mkdir ./build
fi

echo "  -> Compiling C with NASM library."
echo "      -> Compiling the C code into an object file."
gcc -c -m32 ./src/programa_en_C.c -o ./build/programa_en_C.o
echo "      -> Assemble the asm file into and object file."
nasm -f elf32 ./src/programAsm.asm -o ./build/programAsm.o
echo "      -> Link both object files into a shared library."
gcc -m32 -shared -o ./build/programa_en_C ./build/programAsm.o ./build/programa_en_C.o
