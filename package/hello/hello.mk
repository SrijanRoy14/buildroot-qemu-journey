HELLO_VERSION = 1.0
HELLO_SITE = $(BR2_EXTERNAL_EMLI_PATH)/package/hello/src
HELLO_SITE_METHOD = local
HELLO_LICENSE = MIT

define HELLO_BUILD_CMDS
    $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define HELLO_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/hello $(TARGET_DIR)/usr/bin/hello
endef

$(eval $(generic-package))
