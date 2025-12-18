FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
           file://som_rm10.cfg \
	   "

SRC_URI += " \
            file://0001-Modify-for-ADVANTECH-SOM-RM10-support-it-in-Ast2600-.patch \
            file://0002-Enable-VUART-DMA-mode.patch \
            file://0003-Add-battery-sensing-solution.patch \
           "

