
echo "  -> Compile the C file"
gcc -m32 -g -c -o ./build/debug.o debugging/debug.c

echo "  -> Compile the assembly file"
nasm -f elf32 -o ./build/debug_asm.o src/programAsm.asm

echo "  -> Link the object files together"
gcc -m32 -g -o ./debugging/debug ./build/debug.o ./build/debug_asm.o

echo "  -> Get the asm code"
gcc -m32 -S -o ./debugging/debug.asm ./debugging/debug.c

# Abre GDB en otro terminal
echo "  -> Opening GDB in another terminal..."
gnome-terminal -- bash -c "gdb ./debugging/debug"
