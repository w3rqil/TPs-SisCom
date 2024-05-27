#!/bin/bash

# Obtener la lista de módulos cargados
lsmod | awk '{print $1}' > /tmp/loaded_modules.txt

# Obtener la lista de todos los módulos disponibles
find /lib/modules/$(uname -r)/kernel/ -type f -name '*.ko' | xargs -n 1 basename | sed 's/\.ko$//' > /tmp/available_modules.txt

# Encontrar módulos disponibles pero no cargados
comm -23 <(sort /tmp/available_modules.txt) <(sort /tmp/loaded_modules.txt) > not_loaded_modules.txt

echo "Módulos disponibles pero no cargados en not_loaded_modules.txt"
# Limpieza
rm /tmp/loaded_modules.txt /tmp/available_modules.txt
