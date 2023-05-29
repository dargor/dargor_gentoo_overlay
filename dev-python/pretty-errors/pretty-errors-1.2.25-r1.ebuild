# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..12} )

MY_PV="f61574e7fec2b7118fee5a59de61a8a734459ca1"
MY_PN="PrettyErrors"
S="${WORKDIR}/${MY_PN}-${MY_PV}"

inherit distutils-r1

DESCRIPTION="Prettifies Python exception output to make it legible"
HOMEPAGE="https://github.com/onelivesleft/PrettyErrors"
SRC_URI="https://github.com/onelivesleft/${MY_PN}/archive/${MY_PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-python/colorama[${PYTHON_USEDEP}]
"
