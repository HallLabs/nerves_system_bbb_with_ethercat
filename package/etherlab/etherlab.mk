################################################################################
#
# etherlab
#
################################################################################

ETHERLAB_VERSION = 2698:9e65f782e8a1
ETHERLAB_SITE = http://hg.code.sf.net/p/etherlabmaster/code
ETHERLAB_SITE_METHOD = hg
ETHERLAB_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
ETHERLAB_LICENSE_FILES = COPYING COPYING.LESSER
ETHERLAB_INSTALL_STAGING = YES
ETHERLAB_AUTORECONF = YES

ETHERLAB_CONF_OPTS = \
	--with-linux-dir=$(LINUX_DIR)

ETHERLAB_CONF_OPTS += $(if $(BR2_PACKAGE_ETHERLAB_GENERIC),--enable-generic,--disable-generic)
ETHERLAB_CONF_OPTS += $(if $(BR2_PACKAGE_ETHERLAB_8139TOO),--enable-8139too,--disable-8139too)
ETHERLAB_CONF_OPTS += $(if $(BR2_PACKAGE_ETHERLAB_E100),--enable-e100,--disable-e100)
ETHERLAB_CONF_OPTS += $(if $(BR2_PACKAGE_ETHERLAB_E1000),--enable-e1000,--disable-e1000)
ETHERLAB_CONF_OPTS += $(if $(BR2_PACKAGE_ETHERLAB_E1000E),--enable-e1000e,--disable-e1000e)
ETHERLAB_CONF_OPTS += $(if $(BR2_PACKAGE_ETHERLAB_R8169),--enable-r8169,--disable-r8169)

define ETHERLAB_CREATE_MISSING_FILES
	touch $(@D)/ChangeLog
endef
ETHERLAB_POST_PATCH_HOOKS += ETHERLAB_CREATE_MISSING_FILES

$(eval $(kernel-module))

# The master directory is shared between the kernel module and library builds
# so erase the .o files so that the kernel versions aren't reused.
define ETHERLAB_KERNEL_CLEANUP
	# $(RM) $(@D)/master/*.o
	$(RM) $(@D)/master/soe_errors.o
endef
ETHERLAB_POST_BUILD_HOOKS += ETHERLAB_KERNEL_CLEANUP

$(eval $(autotools-package))
