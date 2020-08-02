# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

MY_PV="95bfa9c96a8894523923093164c8b2432036ea3b"
S="${WORKDIR}/${PN}-${MY_PV}"

inherit distutils-r1

DESCRIPTION="My most common routines"
HOMEPAGE="https://github.com/dargor/dargor-py"
SRC_URI="https://github.com/dargor/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/uvloop[${PYTHON_USEDEP}]
"
