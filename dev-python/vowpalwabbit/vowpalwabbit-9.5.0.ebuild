# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# does not work with DISTUTILS_USE_PEP517 for now, fails in eclass at
#   rm "${reg_scriptdir}"/{"${EPYTHON}",python3,python,pyvenv.cfg} || die
PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Vowpal Wabbit fast online learning code (python module)"
HOMEPAGE="https://github.com/VowpalWabbit/vowpal_wabbit https://vowpalwabbit.org"
SRC_URI="https://github.com/VowpalWabbit/vowpal_wabbit/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="flatbuffers"
RESTRICT="test"

BDEPEND="
	dev-util/cmake
"

DEPEND="
	dev-libs/boost[python,${PYTHON_USEDEP}]
	sys-libs/zlib
	dev-libs/rapidjson
	flatbuffers? ( dev-libs/flatbuffers )
	dev-libs/spdlog
	dev-libs/libfmt
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	sci-libs/scikit-learn[${PYTHON_USEDEP}]
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/vowpal_wabbit-${PV}/"

DOCS=(
	"python/README.rst"
)

src_prepare() {
	default
	# https://github.com/VowpalWabbit/vowpal_wabbit/wiki/Dependencies
	# string-view-lite and eigen can't be system (yet ?)
	rm -r ext_libs/{boost_math,fmt,rapidjson,spdlog,zlib} || die
	sed -i -e 's/-O3//g' CMakeLists.txt || die
}

python_compile() {
	# https://github.com/VowpalWabbit/vowpal_wabbit/wiki/Building
	CMAKE_BUILD_TYPE="Release"
	local mycmakeargs=(
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-DCMAKE_VERBOSE_MAKEFILE=ON
		-DBUILD_PYTHON=ON
		-DPY_VERSION=${EPYTHON/python/}
		-DBUILD_FLATBUFFERS=$(usex flatbuffers ON OFF)
		-DBUILD_TESTING=OFF
		-DVW_BOOST_MATH_SYS_DEP=ON
		-DVW_ZLIB_SYS_DEP=ON
		-DRAPIDJSON_SYS_DEP=ON
		-DSPDLOG_SYS_DEP=ON
		-DFMT_SYS_DEP=ON
		-DVW_INSTALL=OFF
	)
	local cmake_options=""
	for arg in "${mycmakeargs[@]}"; do
		cmake_options="${cmake_options};${arg}"
	done
	esetup.py --cmake-options "${cmake_options#;}" build
}
