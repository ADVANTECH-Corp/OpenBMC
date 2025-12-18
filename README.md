![ADVANTECH](Advantech.png)

# Advantech OpenBMC – SOM-RM10

OpenBMC platform support for the **Advantech SOM-RM10** module based on
**ASPEED AST2600** (tested with ASPEED SDK **v09.06**).

This repository provides **board-specific OpenBMC enablement** for
hardware bring-up and verification, including:

- Yocto meta layers
- Machine configuration
- Device Tree sources
- Kernel and BMC drivers
- Platform configuration files

The primary purpose of this project is **hardware bring-up, validation,
and feature development** on Advantech SOM platforms.

## Below are OpenBMC environment setting from OpenBMC github
### 1) Prerequisite

See the
[Yocto documentation](https://docs.yoctoproject.org/ref-manual/system-requirements.html#required-packages-for-the-build-host)
for the latest requirements

#### Ubuntu

```sh
sudo apt install git python3-distutils gcc g++ make file wget \
    gawk diffstat bzip2 cpio chrpath zstd lz4 bzip2
```

### 2) Download the source

```sh
git clone https://github.com/ADVANTECH-Corp/OpenBMC.git SOM-RM10
cd SOM-RM10
```

### 3) Target your hardware & Build

```sh
git checkout som-rm10/aspeedSDK_v09.06
. setup ast2600-default
bitbake obmc-phosphor-image
```

### 4) Deploy BMC image
Image will locate at below:
SOM-RM10/build/ast2600-default/tmp/deploy/images/ast2600-default

- BMC SPI ROM image : image-bmc
- WebUI update image : obmc-phosphor-image-ast2600-default.static.mtd.tar

## Platform Development Note

The SOM-RM10 platform support is **initially derived from the
`ast2600-default` reference machine** provided by OpenBMC.

The `ast2600-default` configuration is used **only as a development
template** during early bring-up. A **dedicated machine configuration**
(`som-rm10`) is maintained for this platform.
