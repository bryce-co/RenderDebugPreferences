TARGET = iphone:11.2:10.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = RenderDebugPreferences

RenderDebugPreferences_FILES  = $(wildcard Sources/*.m)
RenderDebugPreferences_INSTALL_PATH = /Library/PreferenceBundles
RenderDebugPreferences_FRAMEWORKS = UIKit
RenderDebugPreferences_PRIVATE_FRAMEWORKS = Preferences
RenderDebugPreferences_CFLAGS = -fobjc-arc
RenderDebugPreferences_RESOURCE_DIRS = Resources

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/RenderDebugPreferences.plist$(ECHO_END)
