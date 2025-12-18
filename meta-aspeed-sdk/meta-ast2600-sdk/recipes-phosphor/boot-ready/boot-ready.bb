SUMMARY = "Boot Ready GPIO Service"
DESCRIPTION = "Set GPIOG5 high to signal BMC boot complete"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit obmc-phosphor-systemd

SRC_URI += "file://boot-ready-gpio.service"

SYSTEMD_SERVICE:${PN} = "boot-ready-gpio.service"

do_install:append() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/boot-ready-gpio.service ${D}${systemd_system_unitdir}
}

FILES:${PN} += "${systemd_system_unitdir}/boot-ready-gpio.service"

