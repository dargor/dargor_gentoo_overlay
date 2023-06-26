# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1 pypi

DESCRIPTION="Base classes and utils for writing flake8 plugins"
HOMEPAGE="https://github.com/afonasev/flake8-plugin-utils"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/flake8[${PYTHON_USEDEP}]
"
