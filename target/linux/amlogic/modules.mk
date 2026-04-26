# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2013-2016 OpenWrt.org

define KernelPackage/auxdisplay-tm16xx-i2c
    SUBMENU:=$(OTHER_MENU)
    TITLE:=Auxdisplay tm16xx i2c support
    DEPENDS:=@TARGET_amlogic
    KCONFIG:= \
	CONFIG_TM16XX_I2C
    FILES:=$(LINUX_DIR)/drivers/auxdisplay/tm16xx_i2c.ko
    AUTOLOAD:=$(call AutoLoad,50, tm16xx_i2c)
endef

define KernelPackage/auxdisplay-tm16xx-i2c/description
 Support for auxdisplay tm16xx i2c
endef

$(eval $(call KernelPackage,auxdisplay-tm16xx-i2c))
