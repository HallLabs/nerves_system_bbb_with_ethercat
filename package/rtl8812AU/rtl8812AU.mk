################################################################################
#
# rtl8812AU
#
################################################################################

RTL8812AU_VERSION = v2
RTL8812AU_SITE = $(NERVES_DEFCONFIG_DIR)/package/rtl8812AU/source
RTL8812AU_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))
