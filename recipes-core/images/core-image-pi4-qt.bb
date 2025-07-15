DESCRIPTION = "Custom Yocto image for Raspberry Pi 4 with Qt 5.15, Virtual Keyboard, and my custom app"
LICENSE = "MIT"

inherit core-image

IMAGE_INSTALL += " \
  packagegroup-core-boot \
  packagegroup-core-ssh-openssh \
  qtbase qtbase-plugins qtdeclarative qtquickcontrols2 qtvirtualkeyboard \
  tslib tslib-calibrate tslib-tests \
  myqtapp \
"