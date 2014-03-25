ARCHS = amrv7 amrv7s arm64
GO_EASY_ON_ME = 1
include theos/makefiles/common.mk

TWEAK_NAME = MathPass
MathPass_FILES = Tweak.xm
MathPass_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
