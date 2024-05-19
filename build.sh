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
# Agrega la opción -g para incluir información de depuración
gcc -g -c -m32 ./src/programa_en_C.c -o ./build/programa_en_C.o
echo "      -> Assemble the asm file into and object file."
nasm -f elf32 ./src/programAsm.asm -o ./build/programAsm.o
echo "      -> Link both object files into a shared library."
gcc -m32 -shared -o ./build/programa_en_C ./build/programAsm.o ./build/programa_en_C.o

# Abre GDB en otro terminal
#echo "  -> Opening GDB in another terminal..."
#gnome-terminal -- bash -c "gdb ./build/programa_en_C"

# Puedes ejecutar el programa desde aquí si lo deseas
#echo "  -> Running the program..."
#./build/programa_en_C
