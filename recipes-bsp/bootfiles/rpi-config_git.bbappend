FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += " file://config.txt "

do_deploy:append() {
    install -d ${DEPLOYDIR}/bcm2835-bootfiles
    install -m 0644 ${WORKDIR}/config.txt ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}
