# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="MERA-400 EMELF object files tools and access library"
HOMEPAGE="http://mera400.pl/EMELF"
LICENSE="GPL-2"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/jakubfi/emelf.git"
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
"
DEPEND="
	${RDEPEND}
"

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
