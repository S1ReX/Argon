include $(THEOS_MAKE_PATH)/common.mk

TWEAK_NAME = Argon
Argon_FILES = Tweak.xm
Argon_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
SUBPROJECTS += argonprefs
