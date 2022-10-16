# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit unpacker wrapper

DESCRIPTION="Microsoft SQL Server command-line tools"
HOMEPAGE="https://docs.microsoft.com/en-us/sql/tools"
SRC_URI="https://packages.microsoft.com/debian/11/prod/pool/main/m/mssql-tools/mssql-tools_$(ver_rs 4 -)_amd64.deb"

LICENSE="mssql-tools"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""
RESTRICT="bindist mirror strip"

RDEPEND="
	dev-db/msodbcsql:17
"

S="${WORKDIR}"
QA_PREBUILT="opt/mssql-tools/*"

src_install() {
	dodoc -r usr/share/doc
	doins -r opt
	for bin in bcp sqlcmd; do
		fperms +x /opt/mssql-tools/bin/$bin
		make_wrapper $bin /opt/mssql-tools/bin/$bin
	done
}
