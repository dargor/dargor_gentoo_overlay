# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit go-module

DESCRIPTION="Transforms JSON into assignments to grep for what you want"
HOMEPAGE="https://github.com/tomnomnom/gron"

EGO_SUM=(

	# go.sum
	"github.com/fatih/color v1.7.0"
	"github.com/fatih/color v1.7.0/go.mod"
	"github.com/mattn/go-colorable v0.0.9"
	"github.com/mattn/go-colorable v0.0.9/go.mod"
	"github.com/mattn/go-isatty v0.0.4"
	"github.com/mattn/go-isatty v0.0.4/go.mod"
	"github.com/nwidger/jsoncolor v0.0.0-20170215171346-75a6de4340e5"
	"github.com/nwidger/jsoncolor v0.0.0-20170215171346-75a6de4340e5/go.mod"
	"github.com/pkg/errors v0.8.0"
	"github.com/pkg/errors v0.8.0/go.mod"

	# https://github.com/mattn/go-isatty/blob/master/go.sum
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"

)
go-module_set_globals

SRC_URI="https://github.com/tomnomnom/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT BSD-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

DOCS=(
	"ADVANCED.mkd"
	"CHANGELOG.mkd"
	"README.mkd"
)

src_compile() {
	go build -mod=readonly -ldflags "-X main.gronVersion=${PV}" || die
}

src_install() {
	dobin gron
	exeinto /usr/bin
	newexe "${FILESDIR}/ungron" ungron
	einstalldocs
}
