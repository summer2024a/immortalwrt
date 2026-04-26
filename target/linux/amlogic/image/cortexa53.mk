# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013-2016 OpenWrt.org
# Copyright (C) 2016 Yousong Zhou

KERNEL_LOADADDR:=0x3080000

define Device/meson
  $(call Device/FitImage)
  AMLOGIC_DTS_DIR := amlogic/
  KERNEL_NAME := Image
endef

define Device/meson-s4
  SOC := meson-s4-s905w2
  $(Device/meson)
endef

define Device/tanix_tx3-mini-plus
  DEVICE_VENDOR := Tanix
  DEVICE_MODEL := Tx3 Mini Plus
  SUPPORTED_DEVICES += tx3-mini-plus
  $(Device/meson-s4)
endef
TARGET_DEVICES += tanix_tx3-mini-plus
