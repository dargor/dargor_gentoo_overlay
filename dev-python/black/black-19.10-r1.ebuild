# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

MY_PV="19.3b0"
S="${WORKDIR}/${PN}-${MY_PV}"

inherit distutils-r1

DESCRIPTION="The uncompromising Python code formatter"
HOMEPAGE="https://github.com/psf/black https://black.readthedocs.io/en/stable/"
SRC_URI="https://github.com/psf/${PN}/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/appdirs[${PYTHON_USEDEP}]
	>=dev-python/attrs-18.1.0[${PYTHON_USEDEP}]
	>=dev-python/click-6.5[${PYTHON_USEDEP}]
	>=dev-python/pathspec-0.6[${PYTHON_USEDEP}]
	<dev-python/pathspec-1[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	>=dev-python/toml-0.9.4[${PYTHON_USEDEP}]
	>=dev-python/typed-ast-1.4.0[${PYTHON_USEDEP}]
"

python_install() {
	distutils-r1_python_install
	# depends on dev-python/aiohttp-cors, which is hard masked
	rm "${ED}"/usr/bin/blackd || die
}
