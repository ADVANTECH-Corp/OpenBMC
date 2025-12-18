FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Removed-power-capping-support.patch \
            file://0002-Remove-bond0-from-network-link-status.patch \
            file://0003-BUG-iDesign-4095167-BMC-WebUI-Operations-Server-powe.patch \
            file://0004-Fixed-bootoverride-to-none-with-one-time-only.patch \
            "

