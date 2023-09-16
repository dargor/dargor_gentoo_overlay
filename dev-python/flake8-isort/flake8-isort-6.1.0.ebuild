# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1 pypi

DESCRIPTION="Flake8 plugin that integrates isort"
HOMEPAGE="https://github.com/gforcada/flake8-isort"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/flake8[${PYTHON_USEDEP}]
	dev-python/isort[${PYTHON_USEDEP}]
"
