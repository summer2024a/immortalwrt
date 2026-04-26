# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013-2016 OpenWrt.org

include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=amlogic
BOARDNAME:=Amlogic ARM SoCs
FEATURES:=ext4 display ramdisk rootfs-part rtc squashfs usb usbgadget
SUBTARGETS:=cortexa53

KERNEL_PATCHVER:=6.12

KERNELNAME:=zImage dtbs

# S905w2: quad Cortex-A53

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools
DEFAULT_PACKAGES += partx-utils mkf2fs automount cpufreq

$(eval $(call BuildTarget))
