DRIVER_NAME := goodix
KERNEL_SOURCE_DIR ?= ../kernel

EXTRA_CFLAGS +=

obj-m := goodix.o
goodix-y := goodix_ts.o goodix_fwupload.o

modules:
	$(MAKE) -C $(KERNEL_SOURCE_DIR) O=out KCPPFLAGS="$(EXTRA_CFLAGS)" M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNEL_SOURCE_DIR) M=$(PWD) modules_install

install: modules_install

clean:
	$(MAKE) -C $(KERNEL_SOURCE_DIR) M=$(PWD) clean
	