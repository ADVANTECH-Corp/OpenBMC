FILESEXTRAPATHS:append := ":${THISDIR}/${PN}"

# Declare port spcific config files
OBMC_CONSOLE_TTYS = "ttyS13"
CONSOLE_CLIENT = "2200"


SRC_URI += "file://server.ttyS13.conf"
SRC_URI += "file://obmc-console@.service"


CONSOLE_SERVER_CONF_FMT = "file://server.{0}.conf"
CONSOLE_CLIENT_CONF_FMT = "file://client.{0}.conf"
CONSOLE_CLIENT_SERVICE_FMT = "obmc-console-ssh@{0}.service"

SRC_URI += " \
             ${@compose_list(d, 'CONSOLE_SERVER_CONF_FMT', 'OBMC_CONSOLE_TTYS')} \
             ${@compose_list(d, 'CONSOLE_CLIENT_CONF_FMT', 'CONSOLE_CLIENT')} \
           "
SRC_URI += "file://server.ttyS13.conf"
SRC_URI += "file://client.2200.conf"

SYSTEMD_SERVICE:${PN} += " \
        ${PN}@${OBMC_CONSOLE_TTYS}.service \
        obmc-console-ssh@${CONSOLE_CLIENT}.service \
        "

PACKAGECONFIG:append = " concurrent-servers"

do_install:append() {
    # Remove OpenBMC obmc-console default rules
    rm -rf ${D}${nonarch_base_libdir}/udev/rules.d/80-obmc-console-uart.rules
    # Install the console client configurations
    install -m 0644 ${WORKDIR}/${PN}@.service ${D}${systemd_system_unitdir}
    install -m 0755 -d ${D}${sysconfdir}/${BPN}
    install -m 0644 ${WORKDIR}/*.conf ${D}${sysconfdir}/${BPN}/

}
