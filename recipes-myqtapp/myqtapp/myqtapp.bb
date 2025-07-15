DESCRIPTION = "My custom Qt 5.15 app with Home and Splash Screens"
LICENSE = "MIT"

LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit qmake5 systemd

DEPENDS += "qtbase qtdeclarative qtquickcontrols2 qtvirtualkeyboard"

SRC_URI = " \
  file://firstapp.pro \
  file://main.cpp \
  file://main.qml \
  file://home_screen.qml \
  file://qml.qrc \
  file://firstapp_en_IN.ts \
  file://images/ \
  file://myqtapp.service \
"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${bindir}
    install -m 0755 firstapp ${D}${bindir}/firstapp

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/myqtapp.service ${D}${systemd_system_unitdir}
}

# Tell Yocto this recipe installs a systemd service
SYSTEMD_SERVICE:${PN} = "myqtapp.service"

# If your systemd service needs to be enabled by default
FILES:${PN} += "${systemd_system_unitdir}/myqtapp.service"