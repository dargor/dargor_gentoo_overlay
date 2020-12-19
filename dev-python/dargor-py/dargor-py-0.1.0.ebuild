# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )

MY_PV="75ec45bd5bc48a17ffe8d394f4e8815b1fbbcabf"
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
