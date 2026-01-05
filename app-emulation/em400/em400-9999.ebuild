# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="MERA-400 emulator"
HOMEPAGE="http://mera400.pl/EM400"
LICENSE="GPL-2"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jakubfi/em400"
	EGIT_BRANCH="master"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="http://mera400.pl/releases/${PN}/${P}.tar.gz"
	KEYWORDS="-* ~amd64 ~x86 ~x86-fbsd"
fi

SLOT="0"
IUSE=""

RDEPEND="
	sys-libs/readline:0=
	sys-libs/ncurses:0=
	dev-util/emdas
	dev-util/emcrk
	dev-libs/emawp
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
		unpack ${P}.tar.gz
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
	elog "If you want to run CROOK-5 operating system in EM400, see this article:"
	elog "http://mera400.pl/CROOK-5_w_EM400 (in Polish)"
	elog ""
}
