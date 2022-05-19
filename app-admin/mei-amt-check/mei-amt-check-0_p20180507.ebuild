# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit vcs-snapshot linux-info toolchain-funcs

DESCRIPTION="AMT status checker"
HOMEPAGE="https://github.com/mjg59/mei-amt-check/"
COMMIT="ec921d1e0a2ac770e7835589a28b85bc2f15200c"
SRC_URI="https://github.com/mjg59/mei-amt-check/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CONFIG_CHECK="~INTEL_MEI_ME"
ERROR_INTEL_MEI_ME="Need to activate INTEL_MEI_ME to run this tool"

src_prepare() {
	default
	sed -i -e "/CC :=/d" Makefile || die
}

src_compile() {
	CC=$(tc-getCC) emake all
}

src_install() {
	dosbin ${PN}
	dodoc README.md
}
