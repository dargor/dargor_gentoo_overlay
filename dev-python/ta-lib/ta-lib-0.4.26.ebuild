# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )
inherit distutils-r1

DESCRIPTION="Python wrapper for TA-Lib"
HOMEPAGE="https://github.com/mrjbq7/ta-lib"
SRC_URI="https://github.com/mrjbq7/ta-lib/archive/TA_Lib-${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="test"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	sci-libs/ta-lib
"

BDEPEND="
	${RDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]
"

S="${WORKDIR}/ta-lib-python-TA_Lib-${PV}/"

python_prepare_all() {
	rm talib/_ta_lib.c || die
	distutils-r1_python_prepare_all
}
