#!/bin/bash

echo " -> Removing old files..."

rm -f main.o
rm -f main.img

echo " -> Creating main.o"
as -g -o main.o main.S

echo " -> Creating main.img"
ld --oformat binary -o main.img -T link.ld main.o

echo " -> Running QEMU"
qemu-system-i386 -fda main.img -boot a -s -S -monitor stdio