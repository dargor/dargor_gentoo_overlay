# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Vowpal Wabbit fast online learning code (vw command)"
HOMEPAGE="https://github.com/VowpalWabbit/vowpal_wabbit https://vowpalwabbit.org"
SRC_URI="https://github.com/VowpalWabbit/vowpal_wabbit/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="flatbuffers python"
RESTRICT="test"

# rapidjson, spdlog and libfmt: see ext_libs/ext_libs.cmake
DEPEND="
	dev-libs/boost
	sys-libs/zlib
	~dev-libs/rapidjson-1.1.0
	flatbuffers? ( dev-libs/flatbuffers )
	~dev-libs/spdlog-1.8.2
	~dev-libs/libfmt-7.1.3
	python? ( dev-python/vowpalwabbit[flatbuffers?] )
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/vowpal_wabbit-${PV}/"

src_prepare() {
	rm -r ext_libs/{fmt,rapidjson,spdlog} || die
	sed -i -e 's/-O3//g' CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	local mycmakeargs=(
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-DCMAKE_VERBOSE_MAKEFILE=ON
		-DBUILD_PYTHON=OFF
		-DBUILD_FLATBUFFERS=$(usex flatbuffers ON OFF)
		-DBUILD_TESTS=OFF
		-DRAPIDJSON_SYS_DEP=ON
		-DSPDLOG_SYS_DEP=ON
		-DFMT_SYS_DEP=ON
	)
	cmake_src_configure
}
