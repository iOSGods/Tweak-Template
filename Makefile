ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest
#CFLAGS = -fobjc-arc
#THEOS_PACKAGE_DIR_NAME = debs

include @@THEOS@@/makefiles/common.mk

TWEAK_NAME = @@PROJECTNAME@@
@@PROJECTNAME@@_FILES = Tweak.xm
@@PROJECTNAME@@_FRAMEWORKS = UIKit
@@PROJECTNAME@@_LDFLAGS += -Wl,-segalign,4000

include $(THEOS_MAKE_PATH)/tweak.mk

@@KILL_RULE@@
SUBPROJECTS += @@PROJECTNAME@@
include $(THEOS_MAKE_PATH)/aggregate.mk
