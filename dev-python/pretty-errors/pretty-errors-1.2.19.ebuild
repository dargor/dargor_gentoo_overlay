# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

MY_PV="7211063784ca12d2ff8263420661a1a61d57002d"
MY_PN="PrettyErrors"
S="${WORKDIR}/${MY_PN}-${MY_PV}"

inherit distutils-r1

DESCRIPTION="Prettify Python exception output to make it legible"
HOMEPAGE="https://pypi.org/project/pretty-errors https://github.com/onelivesleft/PrettyErrors"
SRC_URI="https://github.com/onelivesleft/${MY_PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/colorama[${PYTHON_USEDEP}]
"
