# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..9} )

inherit cmake python-single-r1

DESCRIPTION="Vowpal Wabbit fast online learning code"
HOMEPAGE="https://github.com/VowpalWabbit/vowpal_wabbit https://vowpalwabbit.org"
SRC_URI="https://github.com/VowpalWabbit/vowpal_wabbit/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="flatbuffers python"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="
	dev-libs/boost[python?]
	sys-libs/zlib
	dev-libs/rapidjson
	flatbuffers? ( dev-libs/flatbuffers )
	dev-libs/spdlog
	dev-libs/libfmt
	python? (
		$(python_gen_cond_dep '
			dev-libs/boost[${PYTHON_USEDEP}]
			dev-python/numpy[${PYTHON_USEDEP}]
			dev-python/pandas[${PYTHON_USEDEP}]
			dev-python/scipy[${PYTHON_USEDEP}]
			sci-libs/scikit-learn[${PYTHON_USEDEP}]
		')
		${PYTHON_DEPS}
	)
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/vowpal_wabbit-${PV}/"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_prepare() {
	cmake_src_prepare
	sed -i -e 's/-O3//g' CMakeLists.txt || die
}

src_configure() {
	CMAKE_BUILD_TYPE="Release"
	local mycmakeargs=(
		-DBUILD_PYTHON=$(usex python ON OFF)
		-DBUILD_FLATBUFFERS=$(usex flatbuffers ON OFF)
		-DRAPIDJSON_SYS_DEP=ON
		-DSPDLOG_SYS_DEP=ON
		-DFMT_SYS_DEP=ON
	)
	if use python; then
		mycmakeargs+=(
			-DPY_VERSION=${EPYTHON/python/}
		)
	fi
	cmake_src_configure
}

src_install() {
	cmake_src_install
	if use python; then
		python_domodule "${S}"/python/vowpalwabbit/
		cp "${S%/}"_build/python/pylibvw.so "${D}"/"$(python_get_sitedir)"/ || die
		python_optimize
	fi
}
