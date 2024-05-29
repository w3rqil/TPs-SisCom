

# 4 Módulos de kernel y llamadas a sistema

## Introducción
Los módulos son fragmentos de código que se pueden cargar y descargar en el kernel según
se requiera. Extienden la funcionalidad del kernel sin necesidad de reiniciar el sistema. Por
ejemplo, un tipo de módulo es el controlador de dispositivo, que permite que el núcleo
acceda al hardware conectado al sistema. Sin módulos, tendríamos que construir kernels
monolíticos y agregar nuevas funciones directamente en la imagen del kernel. Además de
tener kernels más grandes, esto tiene la desventaja de requerir que reconstruyamos y
reiniciemos el kernel cada vez que queramos una nueva funcionalidad.

## Desafio #1

### ¿Qué es checkinstall y para qué sirve?

Checkinstall es una herramienta utilizada en sistemas operativos basados en Linux para facilitar la instalación y desinstalación de programas que se compilan a partir del código fuente. Su propósito principal es ayudar a los usuarios a gestionar de manera más eficiente los paquetes de software personalizados, especialmente aquellos que no están disponibles en los repositorios oficiales del sistema.

#### Funciones principales:
- Creación de Paquetes
- Gestión de Instalación y Desinstalación
- Integración con el Sistema de Paquetes  


Cuando se compila e instala software desde su código fuente en un sistema Unix, normalmente no se realiza un seguimiento adecuado de los archivos y las dependencias del software instalado. Esto puede dificultar la administración del software y su posterior desinstalación o actualización. Aquí es donde entra en juego CheckInstall.

CheckInstall se utiliza como una alternativa a los comandos "make install" o "make install prefix=/some/directory", que son comunes durante el proceso de compilación e instalación de software. En lugar de instalar directamente el software en el sistema, CheckInstall crea un paquete en el formato de paquete nativo del sistema (como RPM o DEB en Linux) y luego instala ese paquete. Esto permite realizar un seguimiento de los archivos instalados y proporciona una forma conveniente de desinstalar o actualizar el software en el futuro.

Checkinstall es una herramienta muy útil para aquellos que necesitan compilar e instalar software a partir del código fuente en sistemas Linux. Facilita la creación de paquetes instalables y su posterior gestión, asegurando que se puedan desinstalar de manera limpia y sencilla si es necesario.

## Desafio #2

### ¿ Qué funciones tiene disponible un programa y un módulo ?

Un programa y un módulo son conceptos sumamente relacionados, pero tienen funciones y características diferentes.

Un programa es a una aplicación completa que realiza una serie de tareas o funciones. Las funciones disponibles en un programa dependen de varios factores, como el lenguaje de programación, las bibliotecas importadas, y los módulos utilizados. Es un conjunto de instrucciones y algoritmos que se ejecutan para realizar una tarea específica. Puede ser un archivo ejecutable que se inicia por sí mismo o se ejecuta mediante un intérprete. Un programa típicamente tiene una funcionalidad completa y puede interactuar con el usuario, realizar cálculos, acceder a bases de datos, procesar archivos, entre otras cosas. Un programa puede constar de múltiples módulos, cada uno con una funcionalidad específica.

Un módulo es una unidad lógica de código que se utiliza para organizar y modularizar el código en un programa. Es una colección de funciones, variables y clases relacionadas que se agrupan para cumplir una tarea específica. Los módulos permiten la reutilización del código y la estructuración modular de un programa. Pueden ser escritos por los desarrolladores o proporcionados por bibliotecas y frameworks.

Finalmente concluimos que mientras que un programa es una aplicación completa que realiza una serie de tareas, un módulo es una unidad lógica de código utilizada para organizar y modularizar el código en un programa. Los módulos permiten la reutilización del código y la estructuración modular del programa.

### Espacio de usuario o espacio del kernel.

Estos conceptos son claves en los sistemas operativos para el entendimiento del manejo de recursos y funcionamiento del mismo. 

El **espacio de usuario o "User space"** es el entorno en el que se ejecutan las aplicaciones y procesos de los usuarios como editores de texto, navegadores web, reproductores de medios, entre otros. Este espacio está separado del espacio del kernel para evitar que las aplicaciones de los usuarios puedan acceder directamente a los recursos críticos del sistema, lo que ayuda a mantener la estabilidad y seguridad del sistema operativo.

#### Características principales:
- **Aislamiento:** Los procesos en el espacio de usuario están aislados unos de otros y del espacio del kernel. Esto evita que un error en un programa afecte a otros programas o al propio kernel.
- **Acceso a Recursos:** Los programas en el espacio de usuario no pueden acceder directamente al hardware ni a las estructuras de datos del kernel. En su lugar, deben realizar llamadas al sistema (system calls) para solicitar servicios del kernel.
- **Seguridad:** Este aislamiento protege el sistema operativo de posibles daños causados por software malicioso o mal diseñado.

Para interactuar con el hardware y
realizar tareas que requieren privilegios especiales, las aplicaciones en User Space deben
hacer llamadas al sistema operativo a través de interfaces de programación de aplicaciones
(API) proporcionadas por el Kernel.

El **espacio del kernel o "Kernel spcae"** es el entorno en el que se ejecuta el núcleo del sistema operativo. El kernel tiene acceso completo al hardware y a todos los recursos del sistema, lo que le permite controlar y gestionar todos los aspectos del funcionamiento del sistema operativo como la memoria, los dispositivos de hardware, los procesos y la seguridad. El kernel también proporciona interfaces de programación que permiten a las aplicaciones de User Space comunicarse y solicitar servicios al kernel.

### Espacio de datos.

El espacio de datos se refiere a la memoria en la que se almacenan los datos durante la ejecución de un programa. 

Se divide en:
#### espacio de datos del usuario 

- Es el espacio de memoria asignado a los procesos de usuario para almacenar datos y estructuras durante su ejecución.
- Almacena variables locales y globales, así como las estructuras de datos utilizadas por los programas en el espacio de usuario.
- Los procesos de usuario tienen acceso y control sobre su propio espacio de datos del usuario, pero no pueden acceder directamente al espacio de datos del kernel.

#### espacio de datos del kernel

- Espacio de memoria reservado para el kernel del sistema operativo y sus módulos.
- Almacena  estructuras de datos del kernel, las variables globales y estáticas, y los buffers utilizados por el kernel y sus módulos.
- El acceso al espacio de datos del kernel está restringido a los componentes del kernel y los módulos del kernel.

### Drivers. Investigar contenido de /dev.

Los **drivers o controladores** son programas de software que permiten que el sistema operativo se comunique con los dispositivos de hardware de la computadora. Actúan como intermediarios entre el sistema operativo y los dispositivos de forma eficiente, facilitando la transferencia de datos y el control de las operaciones.

#### Funciones:
- **Abstracción del Hardware**: Los drivers ocultan los detalles específicos del hardware al sistema operativo y a las aplicaciones, facilitando la comunicaicion entre software y hardware.

- **Gestión de Recursos**: Los drivers gestionan los recursos del hardware, como la memoria y los puertos de E/S. 

- **Traducción de Comandos**: Los drivers traducen los comandos genéricos del sistema operativo en instrucciones específicas del hardware. Por ejemplo, un driver de impresora convierte los comandos de impresión de un documento en comandos específicos que la impresora puede entender.

- **Optimización del Rendimiento**: Los drivers están optimizados para el hardware específico que controlan, lo que permite un rendimiento óptimo y una funcionalidad completa del dispositivo.

En sistemas operativos tipo Unix (como Linux), el directorio **/dev** contiene archivos especiales llamados "dispositivos de caracteres" y "dispositivos de bloques". Estos archivos son utilizados para representar y acceder a los dispositivos en el sistema. Ya sean físicos o virtuales, que el sistema utiliza para interactuar con hardware y software. 

El contenido de **/dev**:

- **Dispositivos de Bloque y de Carácter**: En el directorio /dev, encontrará dispositivos que representan tanto dispositivos de almacenamiento  como dispositivos de entrada. Por ejemplo, /dev/sda puede representar un disco duro, mientras que /dev/ttyUSB0 podría ser un puerto serie USB.

- **Dispositivos de Entrada y Salida**: Los dispositivos de entrada y salida, como teclados, ratones y pantallas, suelen estar representados por archivos en /dev. Por ejemplo, /dev/input/mouse0 podría representar el primer mouse conectado al sistema.

- **Dispositivos de Red**: Algunos dispositivos de red también están representados en /dev, como /dev/net/tun, utilizado para interfaces de red virtuales TUN/TAP.

- **Dispositivos de Control**: Los dispositivos de control permiten interactuar con el kernel para realizar operaciones específicas, como reiniciar el sistema.
Por ejemplo, /dev/null representa un dispositivo que descarta cualquier dato que se le envíe.

- **Dispositivos de Memoria Compartida**: /dev/shm es un punto de montaje para la memoria compartida, donde los programas pueden compartir datos temporalmente en la memoria del sistema.

- **Dispositivos Especiales del Sistema**: Además de los dispositivos mencionados, /dev también puede contener archivos especiales utilizados por el kernel para operaciones de administración del sistema.

# Práctico

## Setup
Para comenzar con el práctico se ejecutaron los siguientes comandos:

<pre>base) <font color="#8AE234"><b>leonel@leonel-GFAST</b></font>:<font color="#729FCF"><b>~</b></font>$ sudo apt install build-essential
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
build-essential is already the newest version (12.9ubuntu3).
The following package was automatically installed and is no longer required:
  libu2f-udev
Use &apos;sudo apt autoremove&apos; to remove it.
0 upgraded, 0 newly installed, 0 to remove and 32 not upgraded.
(base) <font color="#8AE234"><b>leonel@leonel-GFAST</b></font>:<font color="#729FCF"><b>~</b></font>$ sudo apt-get install linux-source
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following package was automatically installed and is no longer required:
  libu2f-udev
Use &apos;sudo apt autoremove&apos; to remove it.
The following additional packages will be installed:
  linux-source-5.15.0
Suggested packages:
  kernel-package libqt3-dev
The following NEW packages will be installed:
  linux-source linux-source-5.15.0
0 upgraded, 2 newly installed, 0 to remove and 32 not upgraded.
Need to get 153 MB of archives.
After this operation, 160 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-source-5.15.0 all 5.15.0-107.117 [153 MB]
Get:2 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-source all 5.15.0.107.107 [2.340 B]                                                              
Fetched 153 MB in 41s (3.708 kB/s)                                                                                                                                     
Selecting previously unselected package linux-source-5.15.0.
(Reading database ... 667168 files and directories currently installed.)
Preparing to unpack .../linux-source-5.15.0_5.15.0-107.117_all.deb ...
Unpacking linux-source-5.15.0 (5.15.0-107.117) ...
Selecting previously unselected package linux-source.
Preparing to unpack .../linux-source_5.15.0.107.107_all.deb ...
Unpacking linux-source (5.15.0.107.107) ...
Setting up linux-source-5.15.0 (5.15.0-107.117) ...
Setting up linux-source (5.15.0.107.107) ...
(base) <font color="#8AE234"><b>leonel@leonel-GFAST</b></font>:<font color="#729FCF"><b>~</b></font>$ 

</pre>

- **build-essential**: Este comando instalará algunas herramientas de compulación, compiladores y otros programas
necesarios para compilar software desde el código fuente.
- **linux-source**: El segundo comando se ejecutó para instalar el código fuente del kernel de linux para permiirnos compilar el kernel de 0, modificar al compilación o compilar módulos que no están incluidos por defecto.

### Headers

Siguiendo con el desarrollo propuesto por la cátedra, se instalaron los siguientes headers:

<pre>(base) <font color="#8AE234"><b>leonel@leonel-GFAST</b></font>:<font color="#729FCF"><b>~</b></font>$ sudo apt install linux-headers-$(uname -r)
[sudo] password for leonel:             
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
linux-headers-5.15.0-105-generic is already the newest version (5.15.0-105.115).
linux-headers-5.15.0-105-generic set to manually installed.
The following package was automatically installed and is no longer required:
  libu2f-udev
Use &apos;sudo apt autoremove&apos; to remove it.
0 upgraded, 0 newly installed, 0 to remove and 32 not upgraded.
(base) <font color="#8AE234"><b>leonel@leonel-GFAST</b></font>:<font color="#729FCF"><b>~</b></font>$ 
</pre>

<pre>
(base) <font color="#8AE234"><b>leonel@leonel-GFAST</b></font>:<font color="#729FCF"><b>~</b></font>$ sudo apt-get install kmod linux-headers-5.15.0-106-generic
[sudo] password for leonel:             
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
kmod is already the newest version (29-1ubuntu1).
The following package was automatically installed and is no longer required:
  libu2f-udev
Use &apos;sudo apt autoremove&apos; to remove it.
The following NEW packages will be installed:
  linux-headers-5.15.0-106 linux-headers-5.15.0-106-generic
0 upgraded, 2 newly installed, 0 to remove and 32 not upgraded.
Need to get 15,2 MB of archives.
After this operation, 103 MB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-106 all 5.15.0-106.116 [12,3 MB]
Get:2 http://archive.ubuntu.com/ubuntu jammy-updates/main amd64 linux-headers-5.15.0-106-generic amd64 5.15.0-106.116 [2.876 kB]
Fetched 15,2 MB in 6s (2.412 kB/s)                                                                                                                                     
Selecting previously unselected package linux-headers-5.15.0-106.
(Reading database ... 667318 files and directories currently installed.)
Preparing to unpack .../linux-headers-5.15.0-106_5.15.0-106.116_all.deb ...
Unpacking linux-headers-5.15.0-106 (5.15.0-106.116) ...
Selecting previously unselected package linux-headers-5.15.0-106-generic.
Preparing to unpack .../linux-headers-5.15.0-106-generic_5.15.0-106.116_amd64.deb ...
Unpacking linux-headers-5.15.0-106-generic (5.15.0-106.116) ...
Setting up linux-headers-5.15.0-106 (5.15.0-106.116) ...
Setting up linux-headers-5.15.0-106-generic (5.15.0-106.116) ...
/etc/kernel/header_postinst.d/dkms:
 * dkms: running auto installation service for kernel 5.15.0-106-generic
   ...done.
(base) <font color="#8AE234"><b>leonel@leonel-GFAST</b></font>:<font color="#729FCF"><b>~</b></font>$ 
</pre>



## Módulo

Ahora ya con todo lo necesario instalado, se procede con el desarrollo. Para esto se utilizó el [módulo propuesto por la cátedra](https://gitlab.com/sistemas-de-computacion-unc/kenel-modules/-/tree/main?ref_type=heads).
Ya con la copia del módulo en nuestros repositorios, se procede con la siguiente secuencia de comandos:
``` 
cd kenel-modules-main/part1/module/
make
sudo insmod mimodulo.ko
sudo dmesg
lsmod | grep mod
```
A continuación el desarrollo en consola:
### make && sudo insmod mimodulo.ko
<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ ls
Makefile  mimodulo.c
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ make
make -C /lib/modules/5.15.0-91-generic/build M=/home/florxha/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module modules
make[1]: Entering directory &apos;/usr/src/linux-headers-5.15.0-91-generic&apos;
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module/mimodulo.o
  MODPOST /home/florxha/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module/Module.symvers
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module/mimodulo.mod.o
  LD [M]  /home/florxha/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module/mimodulo.ko
  BTF [M] /home/florxha/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module/mimodulo.ko
Skipping BTF generation for /home/florxha/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module/mimodulo.ko due to unavailability of vmlinux
make[1]: Leaving directory &apos;/usr/src/linux-headers-5.15.0-91-generic&apos;
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ la
Makefile    mimodulo.ko       mimodulo.mod    .mimodulo.mod.cmd  .mimodulo.mod.o.cmd  .mimodulo.o.cmd  .modules.order.cmd  .Module.symvers.cmd
mimodulo.c  .mimodulo.ko.cmd  mimodulo.mod.c  mimodulo.mod.o     mimodulo.o           modules.order    Module.symvers
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ 
</pre>

### sudo dmesg
<pre><font color="#4E9A06">[318594.489817] </font>Modulo cargado en el kernel.
</pre>

### sudo rmmod mimodulo && sudo dmsg


<pre><font color="#4E9A06">[318594.489817] </font>Modulo cargado en el kernel.
<font color="#4E9A06">[318743.923951] </font>Modulo descargado del kernel.</pre>

### lsmod | grep mod
<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ lsmod | grep mod
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ 
</pre>

### cat /proc/modules  | grep mod
<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ cat /proc/modules  | grep mod
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ 
</pre>

### modinfo mimodulo.ko 

<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ modinfo mimodulo.ko 
filename:       /home/florxha/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module/mimodulo.ko
author:         Catedra de SdeC
description:    Primer modulo ejemplo
license:        GPL
srcversion:     C6390D617B2101FB1B600A9
depends:        
retpoline:      Y
name:           mimodulo
vermagic:       5.15.0-91-generic SMP mod_unload modversions 
</pre>

### modinfo /lib/modules/$(uname -r)/kernel/crypto/des_generic.ko

<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ modinfo /lib/modules/$(uname -r)/kernel/crypto/des_generic.ko
filename:       /lib/modules/5.15.0-91-generic/kernel/crypto/des_generic.ko
alias:          crypto-des3_ede-generic
alias:          des3_ede-generic
alias:          crypto-des3_ede
alias:          des3_ede
alias:          crypto-des-generic
alias:          des-generic
alias:          crypto-des
alias:          des
author:         Dag Arne Osvik &lt;da@osvik.no&gt;
description:    DES &amp; Triple DES EDE Cipher Algorithms
license:        GPL
srcversion:     834DFFB009E6815ABDB0B9D
depends:        libdes
retpoline:      Y
intree:         Y
name:           des_generic
vermagic:       5.15.0-91-generic SMP mod_unload modversions 
sig_id:         PKCS#7
signer:         Build time autogenerated kernel key
sig_key:        49:C7:D2:E9:B4:8B:E0:C5:B4:DE:4F:20:90:40:C9:C4:C2:D9:68:8A
sig_hashalgo:   sha512
signature:      42:7F:47:55:09:B0:A8:D2:82:05:7B:EC:48:FC:C7:54:62:4B:F8:00:
		96:F2:95:6E:EE:5A:77:91:24:61:40:23:AB:BE:60:10:4A:42:E1:5F:
		3B:64:CF:5D:64:04:31:31:59:D6:6C:C0:D0:E4:6D:2E:57:7A:D6:38:
		E7:6E:4B:52:21:CD:E0:0E:97:43:42:29:16:44:BB:FB:1E:D8:9F:9A:
		F8:B2:D4:64:FF:09:33:C1:26:1D:91:27:C8:03:F5:34:24:E6:24:59:
		FE:6E:64:20:E8:B3:22:14:ED:72:3C:61:0C:7B:BC:33:78:20:57:C3:
		0C:85:EA:34:30:B2:B7:BE:7B:2A:E2:17:2E:B8:F6:6D:1E:66:83:9A:
		DE:23:CA:04:D4:E7:59:05:05:D5:39:89:F4:C2:74:94:D9:64:D5:63:
		AA:A4:81:24:82:EB:33:88:48:7B:D0:C1:6D:CF:31:C6:E6:6F:AD:AB:
		B4:45:AF:45:DD:5B:59:29:D1:D0:E9:33:1C:FC:D4:B3:53:82:C9:3A:
		73:8C:CC:45:0D:99:A9:45:54:E2:33:5F:D6:EE:08:E2:B8:AB:DE:B4:
		53:42:85:D4:3B:A5:B6:F2:9E:64:EA:21:2A:46:2A:6E:C9:EF:A4:67:
		45:BF:2C:D5:C1:91:8A:E6:F6:D1:11:C4:67:B3:56:59:E1:8B:0D:F1:
		77:0E:A2:5E:79:99:28:2C:F4:D8:68:93:DB:7F:61:22:14:3C:38:74:
		0B:F2:7D:44:58:C4:62:30:26:7B:13:31:78:06:48:2C:61:02:A5:9F:
		22:61:28:77:D4:B8:37:2E:EE:27:B8:5F:B9:09:82:3F:14:71:B5:12:
		D3:C6:0C:45:A4:B6:FD:69:CC:58:85:4B:54:4B:1D:F1:73:31:54:45:
		0A:61:FD:EF:E1:AB:6D:CF:7D:07:AA:5E:0C:D8:5F:92:17:42:54:3C:
		A7:1D:15:5D:03:8D:96:74:24:32:AC:E8:11:CB:4B:44:98:50:B5:3E:
		DB:CE:F7:16:8C:AC:FB:10:97:F7:61:C6:4F:49:01:E1:83:BF:32:3E:
		24:BD:22:85:B2:28:0F:E1:22:DC:5C:F6:34:C5:63:A0:67:DB:A9:7B:
		38:5E:3A:8B:32:35:B6:5E:00:80:C5:5E:45:CE:9F:F9:46:F3:B8:B9:
		EF:05:79:96:F4:D0:AA:6C:2D:B9:3F:B8:CE:99:C9:87:46:3E:C3:4C:
		25:6E:16:22:0A:75:19:1E:63:93:EE:5F:A9:C6:CA:B2:D7:3D:23:16:
		9C:45:62:43:C2:8F:D8:AC:9E:D1:B0:23:E0:75:2A:5B:9B:75:3E:59:
		E0:5F:2E:2B:F3:0C:77:7C:DD:80:56:FC
</pre>


### lsmod | grep mod
<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/kenel-modules-main/part1/module</b></font>$ lsmod | grep mod
mi<font color="#EF2929"><b>mod</b></font>ulo               16384  0
</pre>


### Preguntas
1) ¿Qué diferencias se pueden observar entre los dos modinfo ? 

La principal diferencia es que des_generic.ko incluye información adicional sobre alias, intree y una firma digital, lo cual es típico para módulos de kernel que vienen incluidos con la distribución oficial del kernel Linux y requieren verificación de integridad. Por otro lado, mimodulo.ko es un módulo personalizado de ejemplo sin estas características adicionales.


2) ¿Qué divers/modulos estan cargados en sus propias pc? comparar las salidas con las computadoras de cada integrante del grupo. Expliquen las diferencias. Carguen un txt con la salida de cada integrante en el repo y pongan un diff en el informe.

Para ver los drivers/modulos cargados en nuestreas pc personales ejecutamos el siguiente comando:
```
lsmod > lsmod_output_<nombre_integrante>.txt
```
Y para ver las diferencias:
<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom</b></font>$ diff lsmod_output_flor.txt lsmod_output_leonel.txt 
1a2,24
&gt; hid_generic            16384  0
&gt; usbhid                 65536  0
&gt; hid                   151552  2 usbhid,hid_generic
&gt; rfcomm                 81920  19
&gt; xt_conntrack           16384  1
&gt; nft_chain_nat          16384  3
&gt; xt_MASQUERADE          20480  1
&gt; nf_nat                 49152  2 nft_chain_nat,xt_MASQUERADE
&gt; nf_conntrack_netlink    49152  0
&gt; nf_conntrack          172032  4 xt_conntrack,nf_nat,nf_conntrack_netlink,xt_MASQUERADE
&gt; nf_defrag_ipv6         24576  1 nf_conntrack
&gt; nf_defrag_ipv4         16384  1 nf_conntrack
&gt; xfrm_user              40960  1
&gt; xfrm_algo              16384  1 xfrm_user
&gt; nft_counter            16384  15
&gt; xt_addrtype            16384  2
&gt; nft_compat             20480  4
&gt; nf_tables             266240  43 nft_compat,nft_counter,nft_chain_nat
&gt; nfnetlink              20480  4 nft_compat,nf_conntrack_netlink,nf_tables
&gt; br_netfilter           32768  0
&gt; bridge                307200  1 br_netfilter
&gt; stp                    16384  1 bridge
&gt; llc                    16384  2 bridge,stp
3d25
&lt; rfcomm                 81920  16
4a27
&gt; overlay               151552  0
10c33,34
&lt; zfs                  4112384  0
---
&gt; nls_iso8859_1          16384  1
&gt; zfs                  4112384  6
19,21c43
&lt; intel_rapl_msr         20480  0
&lt; snd_ctl_led            24576  0
&lt; dell_laptop            32768  0
---
&gt; snd_hda_codec_hdmi     77824  1
24,31c46,50
&lt; dell_smm_hwmon         24576  0
&lt; nls_iso8859_1          16384  1
&lt; snd_hda_codec_hdmi     77824  1
&lt; intel_rapl_common      40960  1 intel_rapl_msr
&lt; dell_wmi               24576  1 dell_laptop
&lt; ledtrig_audio          16384  4 snd_ctl_led,snd_hda_codec_generic,dell_wmi,dell_laptop
&lt; edac_mce_amd           36864  0
&lt; snd_hda_intel          53248  5
---
&gt; ath9k                 217088  0
&gt; ledtrig_audio          16384  1 snd_hda_codec_generic
&gt; ath9k_common           45056  1 ath9k
&gt; snd_hda_intel          53248  4
&gt; ath9k_hw              598016  2 ath9k_common,ath9k
33a53,54
&gt; intel_rapl_msr         20480  0
&gt; intel_rapl_common      40960  1 intel_rapl_msr
35d55
&lt; kvm_amd               155648  0
37c57,59
&lt; kvm                  1032192  1 kvm_amd
---
&gt; ath                    36864  3 ath9k_common,ath9k,ath9k_hw
&gt; uvcvideo              106496  0
&gt; mac80211             1253376  1 ath9k
38a61,62
&gt; x86_pkg_temp_thermal    20480  0
&gt; intel_powerclamp       24576  0
40,41d63
&lt; rapl                   20480  0
&lt; ath10k_pci             49152  0
44,58c66,67
&lt; ath10k_core           602112  1 ath10k_pci
&lt; snd_rawmidi            49152  1 snd_seq_midi
&lt; btusb                  61440  0
&lt; dell_smbios            28672  2 dell_wmi,dell_laptop
&lt; ath                    36864  1 ath10k_core
&lt; sparse_keymap          16384  1 dell_wmi
&lt; btrtl                  24576  1 btusb
&lt; dcdbas                 20480  1 dell_smbios
&lt; uvcvideo              106496  0
&lt; btbcm                  24576  1 btusb
&lt; mac80211             1249280  1 ath10k_core
&lt; hid_sensor_rotation    20480  0
&lt; btintel                40960  1 btusb
&lt; serio_raw              20480  0
&lt; wmi_bmof               16384  0
---
&gt; ath3k                  24576  0
&gt; cfg80211              974848  4 ath9k_common,ath9k,ath,mac80211
60,65d68
&lt; dell_wmi_descriptor    20480  2 dell_wmi,dell_smbios
&lt; snd_seq                77824  2 snd_seq_midi,snd_seq_midi_event
&lt; k10temp                16384  0
&lt; hid_sensor_magn_3d     20480  1
&lt; hid_sensor_incl_3d     20480  0
&lt; hid_sensor_accel_3d    20480  1
67,69d69
&lt; bluetooth             704512  51 btrtl,btintel,btbcm,bnep,btusb,rfcomm
&lt; hid_sensor_gyro_3d     20480  0
&lt; hid_sensor_trigger     20480  10 hid_sensor_gyro_3d,hid_sensor_incl_3d,hid_sensor_accel_3d,hid_sensor_magn_3d,hid_sensor_rotation
70a71,78
&gt; snd_rawmidi            49152  1 snd_seq_midi
&gt; btusb                  61440  0
&gt; videobuf2_common       77824  4 videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
&gt; snd_seq                77824  2 snd_seq_midi,snd_seq_midi_event
&gt; coretemp               24576  0
&gt; btrtl                  24576  1 btusb
&gt; libarc4                16384  1 mac80211
&gt; videodev              258048  3 videobuf2_v4l2,uvcvideo,videobuf2_common
72d79
&lt; industrialio_triggered_buffer    16384  1 hid_sensor_trigger
73a81,85
&gt; mc                     65536  4 videodev,videobuf2_v4l2,uvcvideo,videobuf2_common
&gt; btbcm                  24576  1 btusb
&gt; kvm_intel             372736  0
&gt; snd                   106496  18 snd_hda_codec_generic,snd_seq,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_hda_codec_realtek,snd_timer,snd_pcm,snd_rawmidi
&gt; btintel                40960  1 btusb
75,77c87,89
&lt; kfifo_buf              16384  1 industrialio_triggered_buffer
&lt; videobuf2_common       77824  4 videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
&lt; hid_sensor_iio_common    20480  6 hid_sensor_gyro_3d,hid_sensor_trigger,hid_sensor_incl_3d,hid_sensor_accel_3d,hid_sensor_magn_3d,hid_sensor_rotation
---
&gt; kvm                  1032192  1 kvm_intel
&gt; bluetooth             704512  54 btrtl,btintel,btbcm,bnep,ath3k,btusb,rfcomm
&gt; soundcore              16384  1 snd
79,80d90
&lt; joydev                 32768  0
&lt; industrialio           94208  10 industrialio_triggered_buffer,hid_sensor_gyro_3d,hid_sensor_trigger,hid_sensor_incl_3d,kfifo_buf,hid_sensor_accel_3d,hid_sensor_magn_3d,hid_sensor_rotation
82,87d91
&lt; hid_multitouch         32768  0
&lt; input_leds             16384  0
&lt; cfg80211              974848  3 ath,mac80211,ath10k_core
&lt; videodev              258048  3 videobuf2_v4l2,uvcvideo,videobuf2_common
&lt; snd                   106496  21 snd_ctl_led,snd_hda_codec_generic,snd_seq,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_hda_codec_realtek,snd_timer,snd_pcm,snd_rawmidi
&lt; mc                     65536  4 videodev,videobuf2_v4l2,uvcvideo,videobuf2_common
89,91c93,100
&lt; ccp                   106496  1 kvm_amd
&lt; soundcore              16384  2 snd_ctl_led,snd
&lt; libarc4                16384  1 mac80211
---
&gt; mei_hdcp               24576  0
&gt; at24                   24576  0
&gt; rapl                   20480  0
&gt; mei_me                 40960  1
&gt; joydev                 32768  0
&gt; mei                   135168  3 mei_hdcp,mei_me
&gt; input_leds             16384  0
&gt; intel_cstate           20480  0
93,94c102,103
&lt; dell_rbtn              20480  0
&lt; sch_fq_codel           20480  1
---
&gt; serio_raw              20480  0
&gt; sch_fq_codel           20480  2
102c111
&lt; x_tables               53248  1 ip_tables
---
&gt; x_tables               53248  5 xt_conntrack,nft_compat,xt_addrtype,ip_tables,xt_MASQUERADE
104,106c113
&lt; hid_logitech_hidpp     49152  0
&lt; hid_logitech_dj        28672  0
&lt; btrfs                1560576  0
---
&gt; btrfs                1564672  0
110,111d116
&lt; rtsx_usb_sdmmc         36864  0
&lt; rtsx_usb               28672  2 rtsx_usb_sdmmc,rtsx_usb_ms
113c118
&lt; libcrc32c              16384  1 btrfs
---
&gt; libcrc32c              16384  4 nf_conntrack,nf_nat,btrfs,nf_tables
117,126c122,125
&lt; hid_sensor_custom      28672  0
&lt; hid_sensor_hub         24576  8 hid_sensor_gyro_3d,hid_sensor_trigger,hid_sensor_iio_common,hid_sensor_incl_3d,hid_sensor_accel_3d,hid_sensor_magn_3d,hid_sensor_rotation,hid_sensor_custom
&lt; amdgpu               9887744  45
&lt; iommu_v2               24576  1 amdgpu
&lt; gpu_sched              45056  1 amdgpu
&lt; i2c_algo_bit           16384  1 amdgpu
&lt; drm_ttm_helper         16384  1 amdgpu
&lt; ttm                    86016  2 amdgpu,drm_ttm_helper
&lt; usbhid                 65536  2 hid_logitech_dj,hid_logitech_hidpp
&lt; drm_kms_helper        311296  1 amdgpu
---
&gt; i915                 3117056  58
&gt; i2c_algo_bit           16384  1 i915
&gt; ttm                    86016  1 i915
&gt; drm_kms_helper        311296  1 i915
129a129
&gt; rtsx_usb_sdmmc         36864  0
131,134c131
&lt; cec                    61440  1 drm_kms_helper
&lt; rc_core                65536  1 cec
&lt; ahci                   45056  2
&lt; hid_generic            16384  0
---
&gt; cec                    61440  2 drm_kms_helper,i915
136a134
&gt; rc_core                65536  1 cec
137a136,139
&gt; sha256_ssse3           32768  0
&gt; rtsx_usb               28672  2 rtsx_usb_sdmmc,rtsx_usb_ms
&gt; drm                   622592  17 drm_kms_helper,i915,ttm
&gt; sha1_ssse3             32768  0
139a142
&gt; r8169                 102400  0
141,145c144,145
&lt; psmouse               176128  0
&lt; ucsi_acpi              16384  0
&lt; drm                   622592  17 gpu_sched,drm_kms_helper,amdgpu,drm_ttm_helper,ttm
&lt; i2c_piix4              32768  0
&lt; libahci                45056  1 ahci
---
&gt; ahci                   49152  4
&gt; i2c_i801               36864  0
146a147,151
&gt; psmouse               176128  0
&gt; lpc_ich                28672  0
&gt; libahci                49152  1 ahci
&gt; realtek                32768  1
&gt; i2c_smbus              20480  1 i2c_i801
148,154c153
&lt; i2c_hid_acpi           16384  0
&lt; typec_ucsi             45056  1 ucsi_acpi
&lt; i2c_hid                36864  1 i2c_hid_acpi
&lt; typec                  69632  1 typec_ucsi
&lt; wmi                    32768  4 dell_wmi,wmi_bmof,dell_smbios,dell_wmi_descriptor
&lt; video                  65536  2 dell_wmi,dell_laptop
&lt; hid                   151552  7 i2c_hid,usbhid,hid_multitouch,hid_sensor_hub,hid_generic,hid_logitech_dj,hid_logitech_hidpp
---
&gt; video                  65536  1 i915
</pre>


3) ¿cuales no están cargados pero están disponibles? que pasa cuando el driver de un dispositivo no está disponible. 

Para ver los modulos disponisbles generamos el script 'mod_disponibles.sh' donde primero se obtiene la lista de los modulos cargados y se guarda en un archivo txt. Luego se obtiene una lista de los modulos disponisbles y se guardan en otro archivos txt. Por ultimo se genera el archivo 'not_loaded_modules.txt' donde se encuentran los modulos disponibles pero no cargados. 

Si el driver de un equipo no esta disponible entonces pueden ocurrir varias cosas: 
- Dispositivos No Funcionan Correctamente:
Si el driver necesario para un dispositivo no está disponible, el dispositivo puede no funcionar correctamente o no ser reconocido por el sistema. Por ejemplo, una tarjeta de red sin su driver correspondiente no permitirá conexiones de red.

- Mensajes de Error:
El sistema puede generar mensajes de error en los logs del sistema (accesibles mediante dmesg o en archivos de log en /var/log/) indicando que un dispositivo no tiene el driver adecuado.

- Funcionalidad Limitada:
En algunos casos, un dispositivo puede funcionar con funcionalidad limitada utilizando un driver genérico que no ofrece todas las capacidades del hardware específico.

- Problemas de Compatibilidad:
La falta de un driver específico puede llevar a problemas de compatibilidad, donde el dispositivo no puede interactuar adecuadamente con el sistema operativo.

4) Correr hwinfo en una pc real con hw real y agregar la url de la información de hw en el reporte. 
<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom</b></font>$ sudo apt install hwinfo
[sudo] password for florxha:           
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libhd21 libx86emu3
The following NEW packages will be installed:
  hwinfo libhd21 libx86emu3
0 upgraded, 3 newly installed, 0 to remove and 32 not upgraded.
Need to get 808 kB of archives.
After this operation, 3.581 kB of additional disk space will be used.
Do you want to continue? [Y/n] 
Get:1 http://archive.ubuntu.com/ubuntu jammy/universe amd64 libx86emu3 amd64 3.1-2 [47,8 kB]
Get:2 http://archive.ubuntu.com/ubuntu jammy/universe amd64 libhd21 amd64 21.72-1 [742 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy/universe amd64 hwinfo amd64 21.72-1 [18,0 kB]
Fetched 808 kB in 2s (411 kB/s)<font color="#C4A000">  </font>
Selecting previously unselected package libx86emu3:amd64.
(Reading database ... 621803 files and directories currently installed.)
Preparing to unpack .../libx86emu3_3.1-2_amd64.deb ...
Unpacking libx86emu3:amd64 (3.1-2) ...
Selecting previously unselected package libhd21:amd64.
Preparing to unpack .../libhd21_21.72-1_amd64.deb ...
Unpacking libhd21:amd64 (21.72-1) ...
Selecting previously unselected package hwinfo.
Preparing to unpack .../hwinfo_21.72-1_amd64.deb ...
Unpacking hwinfo (21.72-1) ...
Setting up libx86emu3:amd64 (3.1-2) ...
Setting up libhd21:amd64 (21.72-1) ...
Setting up hwinfo (21.72-1) ...
Processing triggers for man-db (2.10.2-1) ...
Processing triggers for libc-bin (2.35-0ubuntu3.7) ...
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom</b></font>$ cd analisis_modulos/
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/analisis_modulos</b></font>$ sudo hwinfo --all &gt; hwinfo_output_flor.txt
</pre>

3) Módulos vs. Programas
La diferencia principal entre un módulo y un programa es que un programa está formado por un conjunto de instrucciones que serán ejecutadas en el espacio del usuario e interactúan con el kernel a través de system calls, y por otro lado, un módulo es código que se puede cargar en el kernel extendiendo la funcionalidad del mismo, o descargarlos dependiendo de lo que se necesite.

4) ¿Cómo puede ver una lista de las llamadas al sistema que realiza un simple helloworld en c?

 ** HACER **
 
5) ¿Que es un segmentation fault? como lo maneja el kernel y como lo hace un programa?

El “segmentation fault” es un error de memoria causado por el intento de un programa de acceder a una dirección a la que no se le permite acceder. Algunas de las posibles razones por las que se hace un acceso incorrecto pueden ser leer o escribir en una dirección no asignada por el programa, desreferenciar un puntero nulo, y escribir en lo que está en memoria de solo lectura.
**Cómo aborda el kernel un segmentation fault**

- Detección:
	El hardware de la CPU detecta la operación ilegal de la memoria y genera una interrupción.
	Esta interrupción se llama segmentación.fa excepción ult.
- Una señal se genera:
	El kernel del sistema operativo recibe la excepción y envía una señal distinta al proceso que cometió el error. En sistemas Unix y similares, esta señal se conoce como SIGSEGV.
- Manejo de señales:
	Si el proceso ha registrado un manejador para señales SIGSEGV, se ejecuta ese manejador.
	Si el proceso no contiene un manejador de señales SIGSEGV o si el manejador no puede resolver el problema, el proceso se finaliza instantáneamente.
	El kernel también puede registrar el error en un archivo de registro del sistema para fines de depuración.

**Cómo maneja un programa un segmentation fault**

- Registro de un handler de Señales:
	Un programa puede registrar un manejador de señales para SIGSEGV usando la función signal() o sigaction() en C. Este manejador es una función definida por el programador que especifica cómo debe reaccionar el programa ante la señal.
- Prevención
	La prevención de los segmentation faults se da en los programadores, quienes deben realizar buenas prácticas de programación a la hora de escribir código.
- Depuración de segmentation fault:
	Una opción común es utilizar GDB para rastrear los segmentation faults, ya que depurando se puede seguir el estado del programa previo a un segmentation fault y, también, porque dgb muestra el punto exacto del fallo.

6) ¿Se animan a intentar firmar un módulo de kernel ? y documentar el proceso ?  https://askubuntu.com/questions/770205/how-to-sign-kernel-modules-with-sign-file
** HACER **
7) Agregar evidencia de la compilación, carga y descarga de su propio módulo imprimiendo el nombre del equipo en los registros del kernel. 
** HACER **
8) ¿Que pasa si mi compañero con secure boot habilitado intenta cargar un módulo firmado por mi?
** HACER **
