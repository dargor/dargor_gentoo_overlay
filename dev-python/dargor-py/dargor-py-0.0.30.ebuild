# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

MY_PV="112474afad2b9c32f082aa4917fbc2d9865a0817"
S="${WORKDIR}/${PN}-${MY_PV}"

inherit distutils-r1

DESCRIPTION="Dargor's most common routines"
HOMEPAGE="https://github.com/dargor/dargor-py"
SRC_URI="https://github.com/dargor/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+uvloop"

RDEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	uvloop? (
		dev-python/uvloop[${PYTHON_USEDEP}]
	)
"
