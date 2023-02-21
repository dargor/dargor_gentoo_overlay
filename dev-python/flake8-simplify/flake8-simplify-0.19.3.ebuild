# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="A flake8 plugin that helps you to simplify code"
HOMEPAGE="https://github.com/MartinThoma/flake8-simplify"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P/-/_}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${P/-/_}"

RDEPEND="
	dev-python/astor[${PYTHON_USEDEP}]
	dev-python/flake8[${PYTHON_USEDEP}]
"
