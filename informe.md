## Vamos a trabajar con drv1.c..!!  compilar y mostrar la info.

<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv1</b></font>$ make
make -C /lib/modules/5.15.0-91-generic/build M=/home/florxha/Desktop/SdC/TPs-SisCom/drv1 modules
make[1]: Entering directory &apos;/usr/src/linux-headers-5.15.0-91-generic&apos;
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv1/drv1.o
  MODPOST /home/florxha/Desktop/SdC/TPs-SisCom/drv1/Module.symvers
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv1/drv1.mod.o
  LD [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv1/drv1.ko
  BTF [M] /home/florxha/Desktop/SdC/TPs-SisCom/drv1/drv1.ko
Skipping BTF generation for /home/florxha/Desktop/SdC/TPs-SisCom/drv1/drv1.ko due to unavailability of vmlinux
make[1]: Leaving directory &apos;/usr/src/linux-headers-5.15.0-91-generic&apos;
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv1</b></font>$ ls
drv1.c  drv1.ko  drv1.mod  drv1.mod.c  drv1.mod.o  drv1.o  Makefile  modules.order  Module.symvers
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv1</b></font>$ sudo insmod drv1.ko
[sudo] password for florxha:           
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv1</b></font>$ dmesg | tail
[557516.543110] Modulo descargado del kernel.
[557530.494722] Hola, este es el equipo: florxha-Inspiron-7375
[599151.380187] audit: type=1400 audit(1717124402.000:41): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cupsd&quot; pid=157215 comm=&quot;cupsd&quot; capability=12  capname=&quot;net_admin&quot;
[599151.416027] audit: type=1400 audit(1717124402.036:42): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cups-browsed&quot; pid=157272 comm=&quot;cups-browsed&quot; capability=23  capname=&quot;sys_nice&quot;
[685550.747071] audit: type=1400 audit(1717210801.390:43): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cupsd&quot; pid=169605 comm=&quot;cupsd&quot; capability=12  capname=&quot;net_admin&quot;
[685550.773676] audit: type=1400 audit(1717210801.414:44): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cups-browsed&quot; pid=169607 comm=&quot;cups-browsed&quot; capability=23  capname=&quot;sys_nice&quot;
[725670.202986] input: Echo Dot-165 (AVRCP) as /devices/virtual/input/input65
[727315.419904] SdeC: drv1 Registrado exitosamente..!!
[727422.669638] SdeC: drv1 dice Adios mundo cruel..!!
[727528.685646] SdeC: drv1 Registrado exitosamente..!!
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv1</b></font>$ modinfo drv1.ko
filename:       /home/florxha/Desktop/SdC/TPs-SisCom/drv1/drv1.ko
description:    Nuestro primer driver de SdeC
author:         Anil Kumar Pugalia &lt;email@sarika-pugs.com&gt;
license:        GPL
srcversion:     2CCA21E672E4755AF8B453B
depends:        
retpoline:      Y
name:           drv1
vermagic:       5.15.0-91-generic SMP mod_unload modversions 
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv1</b></font>$ sudo rmmod drv1.ko
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv1</b></font>$ dmesg | tail
[557530.494722] Hola, este es el equipo: florxha-Inspiron-7375
[599151.380187] audit: type=1400 audit(1717124402.000:41): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cupsd&quot; pid=157215 comm=&quot;cupsd&quot; capability=12  capname=&quot;net_admin&quot;
[599151.416027] audit: type=1400 audit(1717124402.036:42): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cups-browsed&quot; pid=157272 comm=&quot;cups-browsed&quot; capability=23  capname=&quot;sys_nice&quot;
[685550.747071] audit: type=1400 audit(1717210801.390:43): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cupsd&quot; pid=169605 comm=&quot;cupsd&quot; capability=12  capname=&quot;net_admin&quot;
[685550.773676] audit: type=1400 audit(1717210801.414:44): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cups-browsed&quot; pid=169607 comm=&quot;cups-browsed&quot; capability=23  capname=&quot;sys_nice&quot;
[725670.202986] input: Echo Dot-165 (AVRCP) as /devices/virtual/input/input65
[727315.419904] SdeC: drv1 Registrado exitosamente..!!
[727422.669638] SdeC: drv1 dice Adios mundo cruel..!!
[727528.685646] SdeC: drv1 Registrado exitosamente..!!
[727582.306957] SdeC: drv1 dice Adios mundo cruel..!!
</pre>

## Continuar con drv2.c..!!
```
(base) florxha@florxha-Inspiron-7375:~/Desktop/SdC/TPs-SisCom/drv2$ make
make -C /lib/modules/5.15.0-91-generic/build M=/home/florxha/Desktop/SdC/TPs-SisCom/drv2 modules
make[1]: Entering directory '/usr/src/linux-headers-5.15.0-91-generic'
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv2/drv2.o
  MODPOST /home/florxha/Desktop/SdC/TPs-SisCom/drv2/Module.symvers
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv2/drv2.mod.o
  LD [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv2/drv2.ko
  BTF [M] /home/florxha/Desktop/SdC/TPs-SisCom/drv2/drv2.ko
Skipping BTF generation for /home/florxha/Desktop/SdC/TPs-SisCom/drv2/drv2.ko due to unavailability of vmlinux
make[1]: Leaving directory '/usr/src/linux-headers-5.15.0-91-generic'
```

<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv2</b></font>$ dmesg | tail
[599151.416027] audit: type=1400 audit(1717124402.036:42): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cups-browsed&quot; pid=157272 comm=&quot;cups-browsed&quot; capability=23  capname=&quot;sys_nice&quot;
[685550.747071] audit: type=1400 audit(1717210801.390:43): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cupsd&quot; pid=169605 comm=&quot;cupsd&quot; capability=12  capname=&quot;net_admin&quot;
[685550.773676] audit: type=1400 audit(1717210801.414:44): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cups-browsed&quot; pid=169607 comm=&quot;cups-browsed&quot; capability=23  capname=&quot;sys_nice&quot;
[725670.202986] input: Echo Dot-165 (AVRCP) as /devices/virtual/input/input65
[727315.419904] SdeC: drv1 Registrado exitosamente..!!
[727422.669638] SdeC: drv1 dice Adios mundo cruel..!!
[727528.685646] SdeC: drv1 Registrado exitosamente..!!
[727582.306957] SdeC: drv1 dice Adios mundo cruel..!!
[727833.209519] SdeC_drv2 Registrado exitosamente..!!
[727833.209523] &lt;Major, Minor&gt;: &lt;510, 0&gt;
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv2</b></font>$ cat /proc/devices | grep SdeC
510 <font color="#EF2929"><b>SdeC</b></font>_Driver2
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv2</b></font>$ ls /dev/
<span style="background-color:#2E3436"><font color="#FCE94F"><b>autofs</b></font></span>           <span style="background-color:#2E3436"><font color="#FCE94F"><b>cuse</b></font></span>         <span style="background-color:#2E3436"><font color="#FCE94F"><b>fuse</b></font></span>                      <span style="background-color:#2E3436"><font color="#FCE94F"><b>hpet</b></font></span>       <span style="background-color:#2E3436"><font color="#FCE94F"><b>i2c-7</b></font></span>        <span style="background-color:#2E3436"><font color="#FCE94F"><b>kmsg</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>loop7</b></font></span>         <span style="background-color:#2E3436"><font color="#FCE94F"><b>nvram</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>sda</b></font></span>       <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty</b></font></span>    <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty17</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty26</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty35</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty44</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty53</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty62</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS12</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS21</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS30</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>uinput</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcs5</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsa7</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>vga_arbiter</b></font></span>
<font color="#729FCF"><b>block</b></font>            <font color="#729FCF"><b>disk</b></font>         <span style="background-color:#2E3436"><font color="#FCE94F"><b>gpiochip0</b></font></span>                 <font color="#729FCF"><b>hugepages</b></font>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>i2c-8</b></font></span>        <span style="background-color:#2E3436"><font color="#FCE94F"><b>kvm</b></font></span>    <span style="background-color:#2E3436"><font color="#FCE94F"><b>loop-control</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>port</b></font></span>    <span style="background-color:#2E3436"><font color="#FCE94F"><b>sda1</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty0</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty18</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty27</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty36</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty45</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty54</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty63</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS13</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS22</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS31</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>urandom</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcs6</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsu</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>vhci</b></font></span>
<font color="#729FCF"><b>bsg</b></font>              <font color="#729FCF"><b>dma_heap</b></font>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>hidraw0</b></font></span>                   <span style="background-color:#2E3436"><font color="#FCE94F"><b>hwrng</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>iio:device0</b></font></span>  <font color="#34E2E2"><b>log</b></font>    <font color="#729FCF"><b>mapper</b></font>        <span style="background-color:#2E3436"><font color="#FCE94F"><b>ppp</b></font></span>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>sda2</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty1</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty19</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty28</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty37</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty46</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty55</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty7</b></font></span>       <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS14</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS23</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS4</b></font></span>    <font color="#729FCF"><b>usb</b></font>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcs7</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsu1</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>vhost-net</b></font></span>
<span style="background-color:#2E3436"><font color="#FCE94F"><b>btrfs-control</b></font></span>    <font color="#729FCF"><b>dri</b></font>          <span style="background-color:#2E3436"><font color="#FCE94F"><b>hidraw1</b></font></span>                   <span style="background-color:#2E3436"><font color="#FCE94F"><b>i2c-0</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>iio:device1</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>loop0</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>mcelog</b></font></span>        <span style="background-color:#2E3436"><font color="#FCE94F"><b>psaux</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>sg0</b></font></span>       <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty10</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty2</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty29</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty38</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty47</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty56</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty8</b></font></span>       <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS15</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS24</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS5</b></font></span>    <span style="background-color:#2E3436"><font color="#FCE94F"><b>userio</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsa</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsu2</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>vhost-vsock</b></font></span>
<font color="#729FCF"><b>bus</b></font>              <span style="background-color:#2E3436"><font color="#FCE94F"><b>drm_dp_aux0</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>hidraw2</b></font></span>                   <span style="background-color:#2E3436"><font color="#FCE94F"><b>i2c-1</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>iio:device2</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>loop1</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>media0</b></font></span>        <span style="background-color:#2E3436"><font color="#FCE94F"><b>ptmx</b></font></span>    <span style="background-color:#4E9A06"><font color="#2E3436">shm</font></span>       <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty11</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty20</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty3</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty39</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty48</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty57</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty9</b></font></span>       <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS16</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS25</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS6</b></font></span>    <font color="#729FCF"><b>v4l</b></font>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsa1</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsu3</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>video0</b></font></span>
<font color="#729FCF"><b>char</b></font>             <span style="background-color:#2E3436"><font color="#FCE94F"><b>drm_dp_aux1</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>hidraw3</b></font></span>                   <span style="background-color:#2E3436"><font color="#FCE94F"><b>i2c-2</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>iio:device3</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>loop2</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>media1</b></font></span>        <font color="#729FCF"><b>pts</b></font>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>snapshot</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty12</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty21</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty30</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty4</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty49</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty58</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyprintk</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS17</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS26</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS7</b></font></span>    <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcs</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsa2</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsu4</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>video1</b></font></span>
<span style="background-color:#2E3436"><font color="#FCE94F"><b>console</b></font></span>          <span style="background-color:#2E3436"><font color="#FCE94F"><b>ecryptfs</b></font></span>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>hidraw4</b></font></span>                   <span style="background-color:#2E3436"><font color="#FCE94F"><b>i2c-3</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>iio:device4</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>loop3</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>mem</b></font></span>           <span style="background-color:#2E3436"><font color="#FCE94F"><b>random</b></font></span>  <font color="#729FCF"><b>snd</b></font>       <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty13</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty22</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty31</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty40</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty5</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty59</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS0</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS18</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS27</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS8</b></font></span>    <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcs1</b></font></span>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsa3</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsu5</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>video2</b></font></span>
<font color="#34E2E2"><b>core</b></font>             <span style="background-color:#2E3436"><font color="#FCE94F"><b>fb0</b></font></span>          <span style="background-color:#2E3436"><font color="#FCE94F"><b>hidraw5</b></font></span>                   <span style="background-color:#2E3436"><font color="#FCE94F"><b>i2c-4</b></font></span>      <font color="#34E2E2"><b>initctl</b></font>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>loop4</b></font></span>  <span style="background-color:#4E9A06"><font color="#2E3436">mqueue</font></span>        <span style="background-color:#2E3436"><font color="#FCE94F"><b>rfkill</b></font></span>  <font color="#34E2E2"><b>stderr</b></font>    <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty14</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty23</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty32</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty41</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty50</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty6</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS1</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS19</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS28</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS9</b></font></span>    <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcs2</b></font></span>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsa4</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsu6</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>video3</b></font></span>
<font color="#729FCF"><b>cpu</b></font>              <font color="#34E2E2"><b>fd</b></font>           <span style="background-color:#2E3436"><font color="#FCE94F"><b>hidraw6</b></font></span>                   <span style="background-color:#2E3436"><font color="#FCE94F"><b>i2c-5</b></font></span>      <font color="#729FCF"><b>input</b></font>        <span style="background-color:#2E3436"><font color="#FCE94F"><b>loop5</b></font></span>  <font color="#729FCF"><b>net</b></font>           <font color="#34E2E2"><b>rtc</b></font>     <font color="#34E2E2"><b>stdin</b></font>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty15</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty24</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty33</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty42</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty51</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty60</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS10</b></font></span>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS2</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS29</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>udmabuf</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcs3</b></font></span>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsa5</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsu7</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>zero</b></font></span>
<span style="background-color:#2E3436"><font color="#FCE94F"><b>cpu_dma_latency</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>full</b></font></span>         <span style="background-color:#2E3436"><font color="#FCE94F"><b>HID-SENSOR-2000e1.2.auto</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>i2c-6</b></font></span>      <span style="background-color:#2E3436"><font color="#FCE94F"><b>kfd</b></font></span>          <span style="background-color:#2E3436"><font color="#FCE94F"><b>loop6</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>null</b></font></span>          <span style="background-color:#2E3436"><font color="#FCE94F"><b>rtc0</b></font></span>    <font color="#34E2E2"><b>stdout</b></font>    <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty16</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty25</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty34</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty43</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty52</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>tty61</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS11</b></font></span>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS20</b></font></span>  <span style="background-color:#2E3436"><font color="#FCE94F"><b>ttyS3</b></font></span>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>uhid</b></font></span>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcs4</b></font></span>     <span style="background-color:#2E3436"><font color="#FCE94F"><b>vcsa6</b></font></span>  <font color="#729FCF"><b>vfio</b></font>   <span style="background-color:#2E3436"><font color="#FCE94F"><b>zfs</b></font></span>
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv2</b></font>$ ls
drv2.c  drv2.ko  drv2.mod  drv2.mod.c  drv2.mod.o  drv2.o  Makefile  modules.order  Module.symvers
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv2</b></font>$ sudo mknode /dev/SdeC_drv2_0 c 510 0
sudo: mknode: command not found
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv2</b></font>$ sudo mknod /dev/SdeC_drv2_0 c 510 0
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv2</b></font>$ sudo mknod /dev/SdeC_drv2_1 c 510 1
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv2</b></font>$ sudo mknod /dev/SdeC_drv2_2 c 510 2
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv2</b></font>$ ls /dev/ | grep SdeC
<font color="#EF2929"><b>SdeC</b></font>_drv2_0
<font color="#EF2929"><b>SdeC</b></font>_drv2_1
<font color="#EF2929"><b>SdeC</b></font>_drv2_2
</pre>

<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv2</b></font>$ cat /dev/SdeC_drv2_0
cat: /dev/SdeC_drv2_0: No such device or address
</pre>



# Decodificando las operaciones del CDF
## Trabajamos con drv3

<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ make
make -C /lib/modules/5.15.0-91-generic/build M=/home/florxha/Desktop/SdC/TPs-SisCom/drv3 modules
make[1]: Entering directory &apos;/usr/src/linux-headers-5.15.0-91-generic&apos;
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv3/drv3.o
  MODPOST /home/florxha/Desktop/SdC/TPs-SisCom/drv3/Module.symvers
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv3/drv3.mod.o
  LD [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv3/drv3.ko
  BTF [M] /home/florxha/Desktop/SdC/TPs-SisCom/drv3/drv3.ko
Skipping BTF generation for /home/florxha/Desktop/SdC/TPs-SisCom/drv3/drv3.ko due to unavailability of vmlinux
make[1]: Leaving directory &apos;/usr/src/linux-headers-5.15.0-91-generic&apos;
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ sudo insmod drv3.ko
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ dmesg | tail
[685550.747071] audit: type=1400 audit(1717210801.390:43): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cupsd&quot; pid=169605 comm=&quot;cupsd&quot; capability=12  capname=&quot;net_admin&quot;
[685550.773676] audit: type=1400 audit(1717210801.414:44): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cups-browsed&quot; pid=169607 comm=&quot;cups-browsed&quot; capability=23  capname=&quot;sys_nice&quot;
[725670.202986] input: Echo Dot-165 (AVRCP) as /devices/virtual/input/input65
[727315.419904] SdeC: drv1 Registrado exitosamente..!!
[727422.669638] SdeC: drv1 dice Adios mundo cruel..!!
[727528.685646] SdeC: drv1 Registrado exitosamente..!!
[727582.306957] SdeC: drv1 dice Adios mundo cruel..!!
[727833.209519] SdeC_drv2 Registrado exitosamente..!!
[727833.209523] &lt;Major, Minor&gt;: &lt;510, 0&gt;
[728941.287341] SdeC_drv3 Registrado exitosamente..!!
</pre>


<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ echo &quot;Hola driver...&quot; &gt; /dev/SdeC_drv3
bash: /dev/SdeC_drv3: Permission denied
</pre>


<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ ls -al /dev/SdeC_drv3
crw------- 1 root root 509, 0 Jun  1 12:03 <span style="background-color:#2E3436"><font color="#FCE94F"><b>/dev/SdeC_drv3</b></font></span>
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ sudo cat /dev/SdeC_drv3
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ sudo dmesg | tail
[727422.669638] SdeC: drv1 dice Adios mundo cruel..!!
[727528.685646] SdeC: drv1 Registrado exitosamente..!!
[727582.306957] SdeC: drv1 dice Adios mundo cruel..!!
[727833.209519] SdeC_drv2 Registrado exitosamente..!!
[727833.209523] &lt;Major, Minor&gt;: &lt;510, 0&gt;
[728941.287341] SdeC_drv3 Registrado exitosamente..!!
[728963.322181] SdeC_drv2 dice Adios mundo cruel..!!
[729279.617286] Driver3_SdeC: open()
[729279.617300] Driver3_SdeC: read()
[729279.617309] Driver3_SdeC: close()
</pre>


<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ sudo -s
root@florxha-Inspiron-7375:/home/florxha/Desktop/SdC/TPs-SisCom/drv3# echo &quot;Hola driver...&quot; &gt; /dev/SdeC_drv3
root@florxha-Inspiron-7375:/home/florxha/Desktop/SdC/TPs-SisCom/drv3# exit
exit
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ sudo dmesg | tail
[727833.209519] SdeC_drv2 Registrado exitosamente..!!
[727833.209523] &lt;Major, Minor&gt;: &lt;510, 0&gt;
[728941.287341] SdeC_drv3 Registrado exitosamente..!!
[728963.322181] SdeC_drv2 dice Adios mundo cruel..!!
[729279.617286] Driver3_SdeC: open()
[729279.617300] Driver3_SdeC: read()
[729279.617309] Driver3_SdeC: close()
[729345.693214] Driver3_SdeC: open()
[729345.693244] Driver3_SdeC: write()
[729345.693247] Driver3_SdeC: close()
</pre>


Para poder ver si se escribio correctamente modificamos el metodo my_write:


<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ make
make -C /lib/modules/5.15.0-91-generic/build M=/home/florxha/Desktop/SdC/TPs-SisCom/drv3 modules
make[1]: Entering directory &apos;/usr/src/linux-headers-5.15.0-91-generic&apos;
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv3/drv3.o
  MODPOST /home/florxha/Desktop/SdC/TPs-SisCom/drv3/Module.symvers
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv3/drv3.mod.o
  LD [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv3/drv3.ko
  BTF [M] /home/florxha/Desktop/SdC/TPs-SisCom/drv3/drv3.ko
Skipping BTF generation for /home/florxha/Desktop/SdC/TPs-SisCom/drv3/drv3.ko due to unavailability of vmlinux
make[1]: Leaving directory &apos;/usr/src/linux-headers-5.15.0-91-generic&apos;
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ sudo insmod drv3.ko
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ dmesg | tail
[   21.036290] ath: Country alpha2 being used: AR
[   21.036292] ath: Regpair used: 0x3b
[   21.036293] ath: regdomain 0x8020 dynamically updated by country element
[   21.125066] IPv6: ADDRCONF(NETDEV_CHANGE): wlp1s0: link becomes ready
[   21.195311] kauditd_printk_skb: 14 callbacks suppressed
[   21.195314] audit: type=1400 audit(1717254894.567:26): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cups-browsed&quot; pid=1272 comm=&quot;cups-browsed&quot; capability=23  capname=&quot;sys_nice&quot;
[   21.251400] logitech-hidpp-device 0003:046D:4054.0008: HID++ 4.5 device connected.
[   21.522274] input: Echo Dot-165 (AVRCP) as /devices/virtual/input/input44
[  266.513448] drv3: module verification failed: signature and/or required key missing - tainting kernel
[  266.513814] SdeC_drv3 Registrado exitosamente..!!
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ echo &quot;Hola driver...&quot; &gt; /dev/SdeC_drv3
bash: /dev/SdeC_drv3: Permission denied
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ sudo -s
root@florxha-Inspiron-7375:/home/florxha/Desktop/SdC/TPs-SisCom/drv3# echo &quot;Hola driver...&quot; &gt; /dev/SdeC_drv3
root@florxha-Inspiron-7375:/home/florxha/Desktop/SdC/TPs-SisCom/drv3# sudo dmesg | tail
[   21.195311] kauditd_printk_skb: 14 callbacks suppressed
[   21.195314] audit: type=1400 audit(1717254894.567:26): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cups-browsed&quot; pid=1272 comm=&quot;cups-browsed&quot; capability=23  capname=&quot;sys_nice&quot;
[   21.251400] logitech-hidpp-device 0003:046D:4054.0008: HID++ 4.5 device connected.
[   21.522274] input: Echo Dot-165 (AVRCP) as /devices/virtual/input/input44
[  266.513448] drv3: module verification failed: signature and/or required key missing - tainting kernel
[  266.513814] SdeC_drv3 Registrado exitosamente..!!
[  314.462580] Driver3_SdeC: open()
[  314.462602] Driver3_SdeC: write() - Hola driver...

[  314.462605] Driver3_SdeC: close()
root@florxha-Inspiron-7375:/home/florxha/Desktop/SdC/TPs-SisCom/drv3# exit
exit
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ sudo rmmod drv3.ko
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv3</b></font>$ dmesg | tail
[   21.195314] audit: type=1400 audit(1717254894.567:26): apparmor=&quot;DENIED&quot; operation=&quot;capable&quot; profile=&quot;/usr/sbin/cups-browsed&quot; pid=1272 comm=&quot;cups-browsed&quot; capability=23  capname=&quot;sys_nice&quot;
[   21.251400] logitech-hidpp-device 0003:046D:4054.0008: HID++ 4.5 device connected.
[   21.522274] input: Echo Dot-165 (AVRCP) as /devices/virtual/input/input44
[  266.513448] drv3: module verification failed: signature and/or required key missing - tainting kernel
[  266.513814] SdeC_drv3 Registrado exitosamente..!!
[  314.462580] Driver3_SdeC: open()
[  314.462602] Driver3_SdeC: write() - Hola driver...

[  314.462605] Driver3_SdeC: close()
[  395.942186] SdeC_drv3 dice Adios mundo cruel..!!
</pre>

## Trabajamos con drv4
Como siempre, lo compilamos y hacemos las verificaciones de rutina.
A partir de cat y echo, debemos observar los detalles de lo que ocurre:


<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv4</b></font>$ make
make -C /lib/modules/5.15.0-91-generic/build M=/home/florxha/Desktop/SdC/TPs-SisCom/drv4 modules
make[1]: Entering directory &apos;/usr/src/linux-headers-5.15.0-91-generic&apos;
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv4/drv4.o
  MODPOST /home/florxha/Desktop/SdC/TPs-SisCom/drv4/Module.symvers
  CC [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv4/drv4.mod.o
  LD [M]  /home/florxha/Desktop/SdC/TPs-SisCom/drv4/drv4.ko
  BTF [M] /home/florxha/Desktop/SdC/TPs-SisCom/drv4/drv4.ko
Skipping BTF generation for /home/florxha/Desktop/SdC/TPs-SisCom/drv4/drv4.ko due to unavailability of vmlinux
make[1]: Leaving directory &apos;/usr/src/linux-headers-5.15.0-91-generic&apos;
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv4</b></font>$ sudo insmod drv4.ko
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv4</b></font>$ dmesg | tail -n1
[  561.539792] SdeC_drv4: Registrado exitosamente..!!
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv4</b></font>$ echo -n “H” &gt; /dev/SdeC_drv4 
bash: /dev/SdeC_drv4: Permission denied
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv4</b></font>$ ls -l /dev/SdeC_drv4 
crw------- 1 root root 510, 0 Jun  1 12:23 <span style="background-color:#2E3436"><font color="#FCE94F"><b>/dev/SdeC_drv4</b></font></span>
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv4</b></font>$ sudo chmod 666 /dev/SdeC_drv4 
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv4</b></font>$ sudo -s
root@florxha-Inspiron-7375:/home/florxha/Desktop/SdC/TPs-SisCom/drv4# echo -n &quot;H&quot; &gt; /dev/SdeC_drv4 
root@florxha-Inspiron-7375:/home/florxha/Desktop/SdC/TPs-SisCom/drv4# cat /dev/SdeC_drv4 
Hroot@florxha-Inspiron-7375:/home/florxha/Desktop/SdC/TPs-SisCom/drv4# exit
exit
(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv4</b></font>$ cat /dev/SdeC_drv4 
H(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv4</b></font>$ 
</pre>

<pre>(base) <font color="#8AE234"><b>florxha@florxha-Inspiron-7375</b></font>:<font color="#729FCF"><b>~/Desktop/SdC/TPs-SisCom/drv4</b></font>$ dmesg | tail -n 4
[  894.681764] SdeC_drv4: open()
[  894.681774] SdeC_drv4: read()
[  894.681786] SdeC_drv4: read()
[  894.681793] SdeC_drv4: close()
</pre>