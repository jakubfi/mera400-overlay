# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="MERA-400 disassembler"
HOMEPAGE="http://mera400.pl/EMDAS"
LICENSE="GPL-2"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jakubfi/emdas"
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
	dev-libs/emelf
	dev-libs/emawp
"
DEPEND="
	${RDEPEND}
"

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
