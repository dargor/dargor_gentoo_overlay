# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Sound Open Firmware (SOF) binary files"

HOMEPAGE="https://www.sofproject.org https://github.com/thesofproject/sof https://github.com/thesofproject/sof-bin"
SRC_URI="https://github.com/thesofproject/sof-bin/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

BDEPEND="
	net-misc/rsync
"

S=${WORKDIR}/sof-bin-${PV}
QA_PREBUILT="*"

src_install() {
	FW_DEST=${D}/lib/firmware/intel
	TOOLS_DEST=${D}/usr/bin

	mkdir -p "${FW_DEST}" "${TOOLS_DEST}" || die
	FW_DEST="${FW_DEST}" TOOLS_DEST="${TOOLS_DEST}" \
		${S}/install.sh v${PV}.x/v${PV} || die
}
