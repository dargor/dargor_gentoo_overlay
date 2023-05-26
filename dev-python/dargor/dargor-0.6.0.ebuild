# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Dargor's most common routines"
HOMEPAGE="https://github.com/dargor/dargor-py"
SRC_URI="https://github.com/dargor/dargor-py/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	sys-apps/util-linux
"

S="${WORKDIR}/dargor-py-${PV}/"
