

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