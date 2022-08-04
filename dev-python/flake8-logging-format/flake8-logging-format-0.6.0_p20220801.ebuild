# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit vcs-snapshot distutils-r1

DESCRIPTION="Flake8 extension to validate (lack of) logging format strings"
HOMEPAGE="https://github.com/globality-corp/flake8-logging-format"
COMMIT="f3cdb24468241ebe85e41b0bd2e8958c76b4dec6"
SRC_URI="https://github.com/globality-corp/flake8-logging-format/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=dev-python/flake8-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/nose-1.3.7[${PYTHON_USEDEP}]
"
