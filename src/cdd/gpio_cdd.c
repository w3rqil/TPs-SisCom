#include <linux/module.h>
#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/fs.h>
#include <linux/uaccess.h>
#include <linux/gpio.h>
#include <linux/timer.h>
#include <linux/jiffies.h>

#define DEVICE_NAME "cdd_signals"
#define CLASS_NAME "cdd"
#define GPIO_SIGNAL_1 17  // GPIO pin for signal 1
#define GPIO_SIGNAL_2 27  // GPIO pin for signal 2

static int majorNumber;
static struct class* cddClass = NULL;
static struct device* cddDevice = NULL;
static int selected_signal = 1;
static struct timer_list signal_timer;
static int signal_value = 0;

static ssize_t dev_read(struct file *, char *, size_t, loff_t *);
static ssize_t dev_write(struct file *, const char *, size_t, loff_t *);
static int dev_open(struct inode *, struct file *);
static int dev_release(struct inode *, struct file *);
static void signal_timer_callback(struct timer_list *);

static struct file_operations fops = {
    .open = dev_open,
    .read = dev_read,
    .write = dev_write,
    .release = dev_release,
};

static int __init cdd_init(void) {
    printk(KERN_INFO "CDD: Initializing the CDD\n");

    // Registering the device
    majorNumber = register_chrdev(0, DEVICE_NAME, &fops);
    if (majorNumber < 0) {
        printk(KERN_ALERT "CDD failed to register a major number\n");
        return majorNumber;
    }
    printk(KERN_INFO "CDD: Registered correctly with major number %d\n", majorNumber);

    // Register the device class
    cddClass = class_create(THIS_MODULE, CLASS_NAME);
    if (IS_ERR(cddClass)) {
        unregister_chrdev(majorNumber, DEVICE_NAME);
        printk(KERN_ALERT "Failed to register device class\n");
        return PTR_ERR(cddClass);
    }
    printk(KERN_INFO "CDD: Device class registered correctly\n");

    // Register the device driver
    cddDevice = device_create(cddClass, NULL, MKDEV(majorNumber, 0), NULL, DEVICE_NAME);
    if (IS_ERR(cddDevice)) {
        class_destroy(cddClass);
        unregister_chrdev(majorNumber, DEVICE_NAME);
        printk(KERN_ALERT "Failed to create the device\n");
        return PTR_ERR(cddDevice);
    }
    printk(KERN_INFO "CDD: Device class created correctly\n");

    // Initialize GPIOs
    gpio_request(GPIO_SIGNAL_1, "sysfs");
    gpio_direction_input(GPIO_SIGNAL_1);
    gpio_export(GPIO_SIGNAL_1, false);

    gpio_request(GPIO_SIGNAL_2, "sysfs");
    gpio_direction_input(GPIO_SIGNAL_2);
    gpio_export(GPIO_SIGNAL_2, false);

    // Initialize the timer
    timer_setup(&signal_timer, signal_timer_callback, 0);
    mod_timer(&signal_timer, jiffies + msecs_to_jiffies(1000));

    return 0;
}

static void __exit cdd_exit(void) {
    del_timer(&signal_timer);
    gpio_unexport(GPIO_SIGNAL_1);
    gpio_free(GPIO_SIGNAL_1);
    gpio_unexport(GPIO_SIGNAL_2);
    gpio_free(GPIO_SIGNAL_2);
    device_destroy(cddClass, MKDEV(majorNumber, 0));
    class_unregister(cddClass);
    class_destroy(cddClass);
    unregister_chrdev(majorNumber, DEVICE_NAME);
    printk(KERN_INFO "CDD: Goodbye from the CDD\n");
}

static int dev_open(struct inode *inodep, struct file *filep) {
    printk(KERN_INFO "CDD: Device has been opened\n");
    return 0;
}

static int dev_release(struct inode *inodep, struct file *filep) {
    printk(KERN_INFO "CDD: Device successfully closed\n");
    return 0;
}

static ssize_t dev_read(struct file *filep, char *buffer, size_t len, loff_t *offset) {
    int error_count = 0;
    char message[256] = {0};
    int message_len = 0;

    // Read the current signal value
    if (selected_signal == 1) {
        signal_value = gpio_get_value(GPIO_SIGNAL_1);
    } else {
        signal_value = gpio_get_value(GPIO_SIGNAL_2);
    }

    message_len = snprintf(message, sizeof(message), "Signal %d value: %d\n", selected_signal, signal_value);

    // Copy the message to the user buffer
    error_count = copy_to_user(buffer, message, message_len);

    if (error_count == 0) {
        printk(KERN_INFO "CDD: Sent %d characters to the user\n", message_len);
        return 0;
    } else {
        printk(KERN_INFO "CDD: Failed to send %d characters to the user\n", error_count);
        return -EFAULT;
    }
}

static ssize_t dev_write(struct file *filep, const char *buffer, size_t len, loff_t *offset) {
    char message[256] = {0};
    if (copy_from_user(message, buffer, len)) {
        printk(KERN_INFO "CDD: Failed to receive %zu characters from the user\n", len);
        return -EFAULT;
    }

    sscanf(message, "%d", &selected_signal);
    printk(KERN_INFO "CDD: Selected signal %d\n", selected_signal);

    return len;
}

static void signal_timer_callback(struct timer_list *t) {
    mod_timer(&signal_timer, jiffies + msecs_to_jiffies(1000));
}

module_init(cdd_init);
module_exit(cdd_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Tu Nombre");
MODULE_DESCRIPTION("A simple character device driver for sensing two signals");
MODULE_VERSION("0.1");
