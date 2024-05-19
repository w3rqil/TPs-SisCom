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

## Librerias
```
pip3 install requests

pip3 install numpy

pip3 install matplotlib


```