# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{8..12} )
inherit distutils-r1 pypi

DESCRIPTION="Python library for creating and reading constant databases"
HOMEPAGE="https://github.com/bbayles/python-pure-cdb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
