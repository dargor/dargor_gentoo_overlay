# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

MY_PV="8b58260f00b0aab789e940f5ee190fa9c3c10925"
MY_PN="PrettyErrors"
S="${WORKDIR}/${MY_PN}-${MY_PV}"

inherit distutils-r1

DESCRIPTION="Prettifies Python exception output to make it legible"
HOMEPAGE="https://github.com/onelivesleft/PrettyErrors"
SRC_URI="https://github.com/onelivesleft/${MY_PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/colorama[${PYTHON_USEDEP}]
"
