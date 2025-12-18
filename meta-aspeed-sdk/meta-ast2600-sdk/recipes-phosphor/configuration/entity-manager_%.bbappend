FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI:append = " \
                   file://ast2600-evb.json \
                   file://blacklist.json \
                   file://advantech-som-rm10_psu.json \
                 "

do_install:append() {
     install -d ${D}/usr/share/entity-manager/configurations
     install -m 0444 ${WORKDIR}/ast2600-evb.json ${D}/usr/share/entity-manager/configurations
     install -m 0444 ${WORKDIR}/advantech-som-rm10_psu.json ${D}/usr/share/entity-manager/configurations
     install -m 0444 ${WORKDIR}/blacklist.json -D -t ${D}${datadir}/entity-manager
}

SRCREV = "cc5b2affcbdff0770f3486174cf4de13b3eab17b"

