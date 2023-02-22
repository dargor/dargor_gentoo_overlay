# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1 pypi

DESCRIPTION="Interrogate a codebase for docstring coverage"
HOMEPAGE="https://github.com/econchick/interrogate"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="png"

DEPEND="
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/py[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
	png? (
		media-gfx/cairosvg[${PYTHON_USEDEP}]
	)
"

RDEPEND="${DEPEND}"

DOCS=(
	"README.rst"
)
