# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..9} )

inherit distutils-r1

DESCRIPTION="Flake8 plugin for return expressions checking"
HOMEPAGE="https://github.com/afonasev/flake8-return"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/flake8-3.2.1[${PYTHON_USEDEP}]
	>=dev-python/flake8-plugin-utils-1.3.2[${PYTHON_USEDEP}]
"
