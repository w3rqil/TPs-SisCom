cd ../src/cdd/
make
sudo insmod gpio_cdd.ko
sudo mknod /dev/cdd_signals c 240 0
sudo chmod 666 /dev/cdd_signals
