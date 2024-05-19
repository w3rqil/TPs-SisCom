# TP2: Descripcion de Funciones
## Programa_en_C:
### int convert_and_increment(float gini_index);
Recibe un float, lo convierte a entero y le suma 1.
### int main(int argc, char *argv[]);
Recibe como argumento el indice gini de Python, llama a la funcion 'convert_and_increment(indice_gini)' y luego imprime el resultado.

## Programa en Python

### def obtener_indices_gini(pais):
Ésta función hace una  lista que contiene los años y valores del índice GINI del país que se le pase, realizando una operación que se encuentra en un programa externo en C sobre ellos.


### def obtener_resultados(indices_gini):
Crea una lista de los resultados obtenidos en el codigo C.

### def graficar_resultados(resultados, pais):
Grafica los resultados obtenidos en el codigo C con su año respectivo.


### main
Recibe el 'countryiso3code' del pais con el que se quiere trabajar, obtiene los indices del api_url, llama al codigo C y por ultimo grafica los resultados.



# Diagramas

## Flujos
A continuación se presenta un diagrama de flujos del proyecto hasta el momento:


<p align="center">
    <img src="diagrams/diagrama_flujo_TP2.png"/>
</p>

## Secuencia
A continuación se presenta una rpimer versión simplificada del diagrama de secuencias. La intención es ampliar esta versión para la *segunda iteración* del trabajo práctico.


<p align="center">
  <img src="diagrams/secuence_diagram_tp2.png"/>
</p>


# Parte 2: Assembly
## Entorno
Para el desarrollo de esta parte del trabajo práctico se necesitó de un entorno x86 de 32 bits para compilar el assembler. Para ello se utilizó [miniconda] (https://docs.anaconda.com/free/miniconda/), su instalación fue llevada a cabo con el siguiente procedimiento:
_(Comandos brindado por la página oficial de conda)_

``` 
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
```
Luego de la instalación, se deben utilizar los siguientes comandos para inicializar conda para bash y zhl shells:

``` 
~/miniconda3/bin/conda init bash
~/miniconda3/bin/conda init zsh
```
Luego se debe agregar el path en bashrc(en caso de que no esté agregado).
En esta ocasión se utilizó el editor de texto sublime para modificar el bashrc agregando la línea _PATH="/home/usr/miniconda3/bin:$PATH"_
```
subl ~/.bashrc

source ~/.bashrc
```
Luego de instalación de miniconda se generó un entorno de 32 bits:
```
(base) leonel@leonel-GFAST:~$ conda create -n py32 python=3.7 -c https://repo.anaconda.com/pkgs/main/linux-32/ --override-channels
(py32) leonel@leonel-GFAST:~$ conda activate py32

```
Una vez en el entorno se debieron volver a instalar todas las librerías utilizadas en el proyecto.
En caso de necesitar salir del entorno es tan simple como ejecutar el comando:

```
(py32) leonel@leonel-GFAST:~$ conda deactivate
(base) leonel@leonel-GFAST:
```
<<<<<<< HEAD
# Deputación con GDB

Para realizar una deputación utilizando gdb, se optó por crear una nueva carpeta con el archivo *"debug.c"*, esto se decidió para no incluir la GUI en el debugging ya que nos daba errores en el gdb. 
Luego se creó el script *"debugging.sh"* para facilitar la ejecución del ṕrograma y el GDB:
Ya en el gdb, se ejecutó la siguiente secuencia de comandos:

<pre>Type &quot;apropos word&quot; to search for commands related to &quot;word&quot;...
Reading symbols from <font color="#4E9A06">./debugging/debug</font>...
(gdb) break gini_manipulation_asm
Breakpoint 1 at <font color="#3465A4">0x1203</font>
(gdb) run
Starting program: <font color="#4E9A06">/home/leonel/Desktop/Sistemas de Computación/TPs-SisCom/debugging/debug</font> 
[Thread debugging using libthread_db enabled]
Using host libthread_db library &quot;<font color="#4E9A06">/lib/x86_64-linux-gnu/libthread_db.so.1</font>&quot;.

Breakpoint 1, <font color="#3465A4">0x56556203</font> in <font color="#C4A000">gini_manipulation_asm</font> ()
(gdb) info frame
Stack level 0, frame at 0xffffcd20:
 eip = 0x56556203 in gini_manipulation_asm; saved eip = 0x565561ce
 called by frame at 0xffffcd60
 Arglist at 0xffffcd18, args: 
 Locals at 0xffffcd18, Previous frame&apos;s sp is 0xffffcd20
 Saved registers:
  ebp at 0xffffcd18, eip at 0xffffcd1c
(gdb) x/i $pc
=&gt; <font color="#3465A4">0x56556203</font> &lt;<font color="#C4A000">gini_manipulation_asm</font>+3&gt;: <font color="#4E9A06">flds</font><font color="#D3D7CF">   </font><font color="#3465A4">0x8</font>(<font color="#CC0000">%ebp</font>)
(gdb) ni
<font color="#3465A4">0x56556206</font> in <font color="#C4A000">gini_manipulation_asm</font> ()
(gdb) x/i $pc
=&gt; <font color="#3465A4">0x56556206</font> &lt;<font color="#C4A000">gini_manipulation_asm</font>+6&gt;: <font color="#4E9A06">fistpl</font><font color="#D3D7CF"> </font><font color="#3465A4">-0</font><font color="#CC0000">x4</font>(<font color="#CC0000">%ebp</font>)
(gdb) 

</pre>

Donde podemos ver:
- eip y saved eip: eip (Instruction Pointer) es el registro que apunta a la próxima instrucción que se ejecutará. saved eip es el valor de eip almacenado en la pila cuando se llama a la función. Estos te indican la dirección de la instrucción actual (eip) y la dirección de retorno (saved eip).
- Saved registers: Esta sección muestra los registros guardados en la pila. En este caso, ebp (Base Pointer) y eip (Instruction Pointer) son los registros guardados.
- x/i $pc: Este comando muestra la instrucción en la dirección de eip. Permite ver la instrucción que se ejecutará a continuación.
- ni (Next Instruction): Este comando avanza la ejecución del programa a la siguiente instrucción. Después de ejecutar el comando ni, se puede ver la siguiente instrucción utilizando x/i $pc.

Luego de este análisis inicial del stack frame, se volvió a correr el GDB y se realizaron distintos llamados al comando *"info frame"* en distintos puntos de la ejecución, utilizando el comando *'srepi'* para ir avanzando entre instrucciones:

**Resultados iniciales:**

    Stack level 0, frame at 0xffffcd20:
    eip = 0x56556203 in gini_manipulation_asm; saved eip = 0x565561ce
    called by frame at 0xffffcd60
    Arglist at 0xffffcd18, args: 
    Locals at 0xffffcd18, Previous frame's sp is 0xffffcd20
    Saved registers:
      ebp at 0xffffcd18, eip at 0xffffcd1c

Este resultado muestra el contexto del frame de la pila actual en el breakpoint.
Indica la dirección de eip (Instruction Pointer) y la dirección de retorno (saved eip).
Muestra la información sobre los argumentos y las variables locales en el contexto del frame de la pila.
También muestra los registros guardados en la pila.

**Después de avanzar con stepi:**

    Stack level 0, frame at 0xffffcd20:
    eip = 0x56556206 in gini_manipulation_asm; saved eip = 0x565561ce
    called by frame at 0xffffcd60
    Arglist at 0xffffcd18, args: 
    Locals at 0xffffcd18, Previous frame's sp is 0xffffcd20
    Saved registers:
      ebp at 0xffffcd18, eip at 0xffffcd1c

Después de avanzar con stepi, el eip ha cambiado para apuntar a la siguiente instrucción en gini_manipulation_asm.

**En main después de regresar de la función:**

    Stack level 0, frame at 0xffffcd60:
    eip = 0x565561ce in main (debugging/debug.c:11); saved eip = 0xf7d8a519
    source language c.
    Arglist at 0xffffcd48, args: 
    Locals at 0xffffcd48, Previous frame's sp is 0xffffcd60
    Saved registers:
      ebx at 0xffffcd44, ebp at 0xffffcd48, eip at 0xffffcd5c

Este resultado muestra el contexto del frame de la pila actual en la función main después de regresar de la función gini_manipulation_asm.
Se muestra la dirección de eip y la dirección de retorno (saved eip) en main.
También proporciona información sobre los argumentos y las variables locales en el contexto de main.
=======

## Librerias
```
pip3 install requests

pip3 install numpy

pip3 install matplotlib


```
>>>>>>> 1e6fff4dd075fdead72f2ca55e96a64d62efa381
