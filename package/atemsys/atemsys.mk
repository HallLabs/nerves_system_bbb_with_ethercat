################################################################################
#
# atemsys
#
################################################################################

ATEMSYS_VERSION = 1.0
ATEMSYS_SITE = $(NERVES_DEFCONFIG_DIR)/package/atemsys/source
ATEMSYS_SITE_METHOD = local

$(eval $(kernel-module))
$(eval $(generic-package))
