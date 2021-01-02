# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

MY_PV="e0fe1c5d7b155ba7be05debca690023bdc2ef564"
S="${WORKDIR}/${PN}-${MY_PV}"

inherit distutils-r1

DESCRIPTION="Dargor's most common routines"
HOMEPAGE="https://github.com/dargor/dargor-py"
SRC_URI="https://github.com/dargor/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pandas"

RDEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	pandas? (
		dev-python/pandas[${PYTHON_USEDEP}]
	)
	dev-python/pygments[${PYTHON_USEDEP}]
"

python_prepare_all() {
	# depends on geoip2
	rm dargor/geoip.py || die
	distutils-r1_python_prepare_all
}
