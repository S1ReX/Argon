include theos/makefiles/common.mk

BUNDLE_NAME = ArgonPrefs
ArgonPrefs_FILES = ArgonPrefs.mm
ArgonPrefs_INSTALL_PATH = /Library/PreferenceBundles
ArgonPrefs_FRAMEWORKS = UIKit
ArgonPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ArgonPrefs.plist$(ECHO_END)
