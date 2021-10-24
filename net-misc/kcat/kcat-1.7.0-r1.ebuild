# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="Generic command line non-JVM Apache Kafka producer and consumer"
HOMEPAGE="https://github.com/edenhill/kcat"
SRC_URI="https://github.com/edenhill/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+avro +json"

DEPEND="
	>=dev-libs/librdkafka-0.9.4
	avro? (
		dev-libs/avro-c
		dev-libs/libserdes
	)
	json? (
		dev-libs/yajl
	)
"
RDEPEND="${DEPEND}"

src_configure() {
	tc-export AR CC CXX LD NM OBJDUMP PKG_CONFIG STRIP

	local myeconf=(
		--prefix="${EPREFIX}/usr"
		--build="${CBUILD}"
		--host="${CHOST}"
		--mandir="${EPREFIX}/usr/share/man"
		--infodir="${EPREFIX}/usr/share/info"
		--datadir="${EPREFIX}/usr/share"
		--sysconfdir="${EPREFIX}/etc"
		--localstatedir="${EPREFIX}/var"
		--libdir="${EPREFIX}/usr/$(get_libdir)"
		--no-cache
		--no-download
		--disable-debug-symbols
		$(use_enable avro)
		$(use_enable json)
	)

	./configure ${myeconf[@]} || die
}

src_install() {
	default
	doman ${PN}.1
}
