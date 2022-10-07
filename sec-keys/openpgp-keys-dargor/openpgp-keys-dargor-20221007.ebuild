# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="OpenPGP keys used by Dargor"
HOMEPAGE="https://github.com/dargor/dargor_gentoo_overlay"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

S="${WORKDIR}"

src_install() {
	local files=(
		"${FILESDIR}"/dargor.asc
		"${FILESDIR}"/dargor-numberly.asc
	)

	insinto /usr/share/openpgp-keys
	newins - dargor.asc < <(cat "${files[@]}" || die)
}
