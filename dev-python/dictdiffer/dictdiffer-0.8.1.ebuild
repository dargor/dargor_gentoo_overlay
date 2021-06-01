# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..9} )

inherit distutils-r1

DESCRIPTION="Dictdiffer is a module that helps you to diff and patch dictionaries"
HOMEPAGE="https://pypi.org/project/dictdiffer https://github.com/inveniosoftware/dictdiffer"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

BDEPEND="
	>=dev-python/setuptools-3.1.0[${PYTHON_USEDEP}]
"

python_prepare_all() {
	sed -i -e '/pytest-runner/d' setup.py || die
	distutils-r1_python_prepare_all
}
