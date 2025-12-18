FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://0001-Removed-power-capping-support.patch \
            file://0002-Hide-languge-uncessary-inventory-items-backup-image-.patch \
            file://0003-Removed-backup-image-item-in-the-overview-session.patch \
            file://0004-Added-support-UEFI-boot.patch \
            file://0005-Removed-uncessary-items.patch \
            file://0006-Event-Log-Modify-the-Event-Log-secstion-for-WEBUI.patch \
            file://0007-Hide-NCSI-Link-status-for-now-keep-tracking-for-real.patch \
            file://0008-All_event_log-package-downloads-json-file.patch \
            file://0009-Removied-the-Language-item-in-the-login-secssion.patch \
            file://0010-Hide-serial-number-and-Tag-in-the-overview-of-the-He.patch \
            file://0011-Added-the-BOOT-operation-solution-in-the-Webui.patch \
            file://0012-Removed-unecessary-items-in-the-Inventory-session.patch \
            "

