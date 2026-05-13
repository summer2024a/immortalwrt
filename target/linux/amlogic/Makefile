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

# 大型配置下偶发 “Inconsistent kallsyms data”，官方建议的链接期变通。
KERNEL_MAKE_FLAGS += KALLSYMS_EXTRA_PASS=1

# 合并 generic + 板级片段后，内核升级会出现未声明的新符号；仅 syncconfig 会停住等交互。
# olddefconfig 本身非交互，无需 yes 管道（单线程 -j1 下管道偶发异常）。
# package-metadata 的 m+ 易把 MTD 块层压成 m，导致 mtdcore 链到 vmlinux 时缺符号；显式打开 MTD_BLOCK 后再 olddefconfig。
# Kernel/Configure/Default 的 .vermagic 仍来自修改前的 .config.set，此处用最终 .config 重算并回写 .config.set/.config.prev，避免 vermagic/增量不一致。
define Kernel/Configure
	$(call Kernel/Configure/Default)
	echo 'CONFIG_MTD_BLOCK=y' >> $(LINUX_DIR)/.config
	+$(KERNEL_MAKE) olddefconfig
	cp $(LINUX_DIR)/.config $(LINUX_DIR)/.config.set
	cp $(LINUX_DIR)/.config $(LINUX_DIR)/.config.prev
	grep '=[ym]' $(LINUX_DIR)/.config | LC_ALL=C sort | $(MKHASH) md5 > $(LINUX_DIR)/.vermagic
endef

DEFAULT_PACKAGES += uboot-envtools
DEFAULT_PACKAGES += partx-utils mkf2fs automount cpufreq

$(eval $(call BuildTarget))
