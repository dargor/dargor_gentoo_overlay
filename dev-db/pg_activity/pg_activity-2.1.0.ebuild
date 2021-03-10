# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=( python3_{7..9} )

inherit distutils-r1

DESCRIPTION="Realtime PostgreSQL database server monitoring tool"
HOMEPAGE="https://github.com/dalibo/pg_activity https://pypi.org/project/pg-activity/"
SRC_URI="https://github.com/dalibo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"
SLOT="0"
LICENSE="POSTGRESQL"

RDEPEND="
	dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/blessed[${PYTHON_USEDEP}]
	dev-python/humanize[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/psycopg:2[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
"

src_install() {
	distutils-r1_src_install
	doman docs/man/${PN}.1
}
