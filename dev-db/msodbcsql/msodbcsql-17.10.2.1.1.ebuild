# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit unpacker

DESCRIPTION="Microsoft ODBC Driver 17 for SQL Server"
HOMEPAGE="https://docs.microsoft.com/en-us/sql/connect/odbc"
SRC_URI="https://packages.microsoft.com/debian/11/prod/pool/main/m/msodbcsql17/msodbcsql17_$(ver_rs 4 -)_amd64.deb"

LICENSE="msodbcsql17"
SLOT="17"
KEYWORDS="-* ~amd64"
IUSE=""
RESTRICT="bindist mirror strip"

RDEPEND="
	dev-db/unixODBC
	dev-libs/openssl
	virtual/krb5
"

S="${WORKDIR}"
QA_PREBUILT="opt/microsoft/msodbcsql17/*"

DRIVER_NAME="ODBC Driver 17 for SQL Server"
ODBCINST_INI="/opt/microsoft/msodbcsql17/etc/odbcinst.ini"

src_install() {
	dodoc -r usr/share/doc
	doins -r opt
}

pkg_postinst() {
	ebegin "Installing ${DRIVER_NAME}"
	/usr/bin/odbcinst -i -d -f "${ODBCINST_INI}"
	rc=$?
	eend $rc
	[ $rc -eq 0 ] || die
}

pkg_prerm() {
	ebegin "Uninstalling ${DRIVER_NAME}"
	/usr/bin/odbcinst -u -d -n "${DRIVER_NAME}"
	rc=$?
	eend $rc
	[ $rc -eq 0 ] || die
}
