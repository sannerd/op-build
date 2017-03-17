################################################################################
#
# hostboot_binaries
#
################################################################################

HOSTBOOT_BINARIES_VERSION ?= 1cebabf48aeed71808311bcfb6ae4c434b537734
HOSTBOOT_BINARIES_SITE ?= $(call github,sannerd,hostboot-binaries,$(HOSTBOOT_BINARIES_VERSION))
HOSTBOOT_BINARIES_LICENSE = Apache-2.0
HOSTBOOT_BINARIES_LICENSE_FILES = LICENSE

HOSTBOOT_BINARIES_INSTALL_IMAGES = YES
HOSTBOOT_BINARIES_INSTALL_TARGET = NO

#BIN_FILENAME ?= $(if $(BR2_OPENPOWER_POWER9),$(BR2_HOSTBOOT_BINARY_WINK_FILENAME:hdr.bin.ecc=.bin),$(BR2_HOSTBOOT_BINARY_WINK_FILENAME))
BIN_FILENAME ?= $(subst hdr.bin.ecc,bin,$(BR2_HOSTBOOT_BINARY_WINK_FILENAME))

define HOSTBOOT_BINARIES_INSTALL_IMAGES_CMDS
     $(INSTALL) -D $(@D)/cvpd.bin  $(STAGING_DIR)/hostboot_binaries/cvpd.bin
     $(INSTALL) -D $(@D)/$(BIN_FILENAME) $(STAGING_DIR)/hostboot_binaries/
     $(INSTALL) -D $(@D)/$(BR2_HOSTBOOT_BINARY_SBEC_FILENAME) $(STAGING_DIR)/hostboot_binaries/
     $(INSTALL) -D $(@D)/$(BR2_HOSTBOOT_BINARY_SBE_FILENAME)  $(STAGING_DIR)/hostboot_binaries/
endef

$(eval $(generic-package))
