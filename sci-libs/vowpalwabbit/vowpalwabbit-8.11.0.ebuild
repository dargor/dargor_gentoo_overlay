# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

# TODO add (optional) python support
#      https://github.com/VowpalWabbit/vowpal_wabbit/wiki/Dependencies
#      https://github.com/VowpalWabbit/vowpal_wabbit/wiki/Building

DESCRIPTION="Vowpal Wabbit fast online learning code"
HOMEPAGE="https://github.com/VowpalWabbit/vowpal_wabbit https://vowpalwabbit.org"
SRC_URI="https://github.com/VowpalWabbit/vowpal_wabbit/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-libs/boost
	sys-libs/zlib
	dev-libs/rapidjson
	dev-libs/flatbuffers
	dev-libs/spdlog
	dev-libs/libfmt
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/vowpal_wabbit-${PV}/"

src_prepare() {
	cmake_src_prepare
	sed -i -e 's/-O3//g' CMakeLists.txt || die
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	local mycmakeargs=(
		-DRAPIDJSON_SYS_DEP=On
		-DBUILD_FLATBUFFERS=On
		-DSPDLOG_SYS_DEP=On
		-DFMT_SYS_DEP=On
	)
	cmake_src_configure
}
