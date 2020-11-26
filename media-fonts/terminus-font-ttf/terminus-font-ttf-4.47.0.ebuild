# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit font

DESCRIPTION="A clean fixed font for the console and X11, TTF version"
HOMEPAGE="https://files.ax86.net/terminus-ttf/"
SRC_URI="
	center-tilde? ( https://files.ax86.net/terminus-ttf/files/${PV}/variants/terminus-ttf-td1-${PV}.zip )
	distinct-l?   ( https://files.ax86.net/terminus-ttf/files/${PV}/variants/terminus-ttf-ll2-${PV}.zip )
	vanilla?      ( https://files.ax86.net/terminus-ttf/files/${PV}/terminus-ttf-${PV}.zip )
"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+center-tilde distinct-l vanilla"

REQUIRED_USE="
	^^ (
		center-tilde
		distinct-l
		vanilla
	)
"

DEPEND="app-arch/unzip"
RDEPEND=""

FONT_SUFFIX="ttf"
DOCS=( COPYING )

src_unpack() {
	default
	if use center-tilde; then
		mv "${WORKDIR}/terminus-ttf-td1-${PV}" "${WORKDIR}/${P}" || die
	elif use distinct-l; then
		mv "${WORKDIR}/terminus-ttf-ll2-${PV}" "${WORKDIR}/${P}" || die
	else
		mv "${WORKDIR}/terminus-ttf-${PV}" "${WORKDIR}/${P}" || die
	fi
}
