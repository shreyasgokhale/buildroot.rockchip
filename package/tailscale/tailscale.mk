################################################################################
#
# tailscale
#
################################################################################

TAILSCALE_VERSION = 1.56.1
TAILSCALE_SITE = https://pkgs.tailscale.com/stable
TAILSCALE_SOURCE = tailscale_$(TAILSCALE_VERSION)_arm64.tgz
TAILSCALE_SITE_METHOD = wget
TAILSCALE_INSTALL_TARGET = YES
TAILSCALE_DEPENDENCIES = systemd

define TAILSCALE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/tailscale $(TARGET_DIR)/usr/bin/tailscale
	$(INSTALL) -D -m 0755 $(@D)/tailscaled $(TARGET_DIR)/usr/sbin/tailscaled
	$(INSTALL) -D -m 0755 $(@D)/systemd/tailscaled.service  $(TARGET_DIR)/lib/systemd/system/tailscaled.service
	$(INSTALL) -D -m 0755 $(@D)/systemd/tailscaled.defaults $(TARGET_DIR)/etc/default/tailscaled 
endef

$(eval $(generic-package))
