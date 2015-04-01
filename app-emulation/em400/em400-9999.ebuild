# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils

DESCRIPTION="MERA-400 emulator"
HOMEPAGE="http://mera400.pl/EM400"
LICENSE="GPL-2"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/jakubfi/em400.git"
	EGIT_BRANCH="master"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="http://mera400.pl/sources/${PN}/${P}.tar.bz2"
	KEYWORDS="-* ~amd64 ~x86 ~x86-fbsd"
fi

SLOT="0"
IUSE=""

RDEPEND="
	sys-libs/readline
	sys-libs/ncurses
	dev-util/emdas
	dev-util/emcrk
"
DEPEND="
	${RDEPEND}
	sys-devel/bison
	sys-devel/flex
"

DOCS="README.md TODO cfg/*"

src_unpack() {
	if [[ ${PV} == "9999" ]] ; then
		git-r3_src_unpack
	else
		unpack ${P}.tar.bz2
	fi
}

src_configure() {
	cmake-utils_src_configure
}

pkg_postinst() {
	elog ""
	elog "To run EM400 you need a working configuration file in ~/.em400"
	elog "Configuration template and sample configuration files are provided in"
	elog "${ROOT}usr/share/doc/${PF}"
	elog ""
}
