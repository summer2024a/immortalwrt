# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013-2016 OpenWrt.org
# Copyright (C) 2016 Yousong Zhou

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

FAT32_BLOCK_SIZE=1024
FAT32_BLOCKS=$(shell echo $$(($(CONFIG_AMLOGIC_SD_BOOT_PARTSIZE)*1024*1024/$(FAT32_BLOCK_SIZE))))

DEVICE_VARS := AMLOGIC_DTS AMLOGIC_DTS_DIR

define Build/amlogic-sdcard
	rm -f $@.boot
	mkfs.fat $@.boot -C $(FAT32_BLOCKS)

	mcopy -i $@.boot boot.scr ::boot.scr
	mcopy -i $@.boot $(IMAGE_KERNEL) ::uImage
	./gen_amlogic_sdcard_img.sh $@ \
		$@.boot \
		$(IMAGE_ROOTFS) \
		$(CONFIG_AMLOGIC_SD_BOOT_PARTSIZE) \
		$(CONFIG_TARGET_ROOTFS_PARTSIZE)
	rm -f $@.boot
endef

# why \x00\x00\x00\x00 for zImage-initramfs
define Device/Default
  PROFILES := Default
  KERNEL_NAME := zImage
  KERNEL := kernel-bin | uImage none
  IMAGES := sdcard.img.gz
  IMAGE/sdcard.img.gz := amlogic-sdcard | append-metadata | gzip
  AMLOGIC_DTS_DIR := amlogic/
  AMLOGIC_DTS = $$(AMLOGIC_DTS_DIR)$$(SOC)-$(lastword $(subst _, ,$(1)))
endef

define Device/FitImage
	KERNEL = kernel-bin | fit none $$(DTS_DIR)/$$(AMLOGIC_DTS).dtb
	KERNEL_NAME := Image
endef

define Device/FitImageLzma
  KERNEL = kernel-bin | lzma | fit lzma $$(DTS_DIR)/$$(AMLOGIC_DTS).dtb
endef

define Device/FitImageGzip
  KERNEL = kernel-bin | gzip | fit gzip $$(DTS_DIR)/$$(AMLOGIC_DTS).dtb
endef

include $(SUBTARGET).mk

$(eval $(call BuildImage))
