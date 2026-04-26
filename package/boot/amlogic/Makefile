include $(TOPDIR)/rules.mk
PKG_NAME:=amlogic 
PKG_VERSION:=1.0 
PKG_RELEASE:=1
 
# 显式声明覆盖规则（防止继承冲突）
OVERRIDE_TARGETS := InstallDev
 
include $(INCLUDE_DIR)/package.mk
 
define Package/amlogic
    SECTION:=boot 
    CATEGORY:=Boot
    TITLE:=Amlogic boot script for SD/USB 
    DEPENDS:=@TARGET_amlogic
    # 标记为仅构建时依赖（不安装到设备）
    BUILDONLY:=1
endef 
 
define Build/InstallDev 
    # 确保目录存在
    $(INSTALL_DIR) $(STAGING_DIR_IMAGE)
    # 使用安装宏替代直接cp（兼容OpenWrt构建系统）
    $(INSTALL_DATA) ./files/boot.ini $(STAGING_DIR_IMAGE)/boot.scr
endef 
 
$(eval $(call BuildPackage,amlogic))