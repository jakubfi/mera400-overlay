# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit cmake-utils

DESCRIPTION="MERA-400 classic syntax assembler"
HOMEPAGE="http://mera400.pl/ASSEM"
LICENSE="GPL-2"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jakubfi/assem"
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
"
DEPEND="
	sys-devel/bison
	sys-devel/flex
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
