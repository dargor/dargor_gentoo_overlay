# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Sound Open Firmware (SOF) binary files"

HOMEPAGE="https://www.sofproject.org https://github.com/thesofproject/sof https://github.com/thesofproject/sof-bin"
SRC_URI="https://github.com/thesofproject/sof-bin/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S=${WORKDIR}/sof-bin-${PV}
QA_PREBUILT="*"

src_install() {

	insinto /lib/firmware/intel/sof
	doins -r v$(ver_cut 1-2).x/sof-v${PV}/*

	insinto /lib/firmware/intel/sof-tplg
	doins -r v$(ver_cut 1-2).x/sof-tplg-v${PV}/*

	for bin in v$(ver_cut 1-2).x/tools-v${PV}/*; do
		dobin ${bin}
	done

}
