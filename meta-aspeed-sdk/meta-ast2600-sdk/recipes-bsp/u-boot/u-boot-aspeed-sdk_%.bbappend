FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

inherit socsec-sign otptool

SRC_URI:append:ast-mmc = " \
    file://u-boot-env.txt \
    "

# save unsigned binaries
do_compile:append:ast-secure() {
    install -d ${B}/unsigned-bin
    install -m 0644 ${B}/spl/u-boot-spl-nodtb.bin ${B}/unsigned-bin
    install -m 0644 ${B}/spl/u-boot-spl.dtb ${B}/unsigned-bin
    install -m 0644 ${B}/u-boot-nodtb.bin ${B}/unsigned-bin
    install -m 0644 ${B}/u-boot.dtb ${B}/unsigned-bin
}

# install unsigned binaries to SYSROOT_DIRS and allow recipes which depend on u-boot to use its
# installed artifacts from RECIPE_SYSROOT instead of DEPLOY_DIR_IMAGE
do_install:append:ast-secure() {
    install -d ${D}/sysroot-only
    install -m 0644 ${B}/unsigned-bin/* ${D}/sysroot-only
}

SRC_URI += "file://som_rm10_uboot.cfg \
            file://0001-Modify-for-RM10-support.patch \
            file://0002-SET-SOM-RM10-GPIOI6-OUTPUT-LOW-INIT.patch \
            file://0003-Add-the-MAC-Address-from-FRU-EEPROM-to-OFFSET-0x1000.patch \
            file://0004-Super-IO-decode-to-0x4F-patch.patch \
            "

