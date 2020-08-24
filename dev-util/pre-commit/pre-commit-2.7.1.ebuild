# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# missing for 3.8 : dev-python/nodeenv
PYTHON_COMPAT=( python3_{6,7} )

inherit distutils-r1

DESCRIPTION="Framework for managing and maintaining multi-language pre-commit hooks"
HOMEPAGE="https://github.com/pre-commit/pre-commit https://pre-commit.com"
SRC_URI="https://github.com/pre-commit/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/cfgv-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/identify-1.0.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/importlib_metadata[${PYTHON_USEDEP}]
	' python3_{6,7})
	$(python_gen_cond_dep '
		dev-python/importlib_resources[${PYTHON_USEDEP}]
	' python3_6)
	>=dev-python/nodeenv-0.11.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	dev-python/toml[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-20.0.8[${PYTHON_USEDEP}]
"
