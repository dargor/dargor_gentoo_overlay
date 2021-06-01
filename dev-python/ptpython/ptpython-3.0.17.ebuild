# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..9} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="Python REPL build on top of prompt_toolkit"
HOMEPAGE="https://pypi.org/project/ptpython/ https://github.com/prompt-toolkit/ptpython"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ipython"

RDEPEND="
	dev-python/appdirs[${PYTHON_USEDEP}]
	dev-python/black[${PYTHON_USEDEP}]
	ipython? (
		dev-python/ipython[${PYTHON_USEDEP}]
	)
	>=dev-python/jedi-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/prompt_toolkit-3.0.18[${PYTHON_USEDEP}]
	<dev-python/prompt_toolkit-3.1.0[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
"

python_install() {
	distutils-r1_python_install
	if ! use ipython; then
		rm "${D}"/usr/bin/ptipython* || die
	fi
}
