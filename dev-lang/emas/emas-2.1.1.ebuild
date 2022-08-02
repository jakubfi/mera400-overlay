# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="MERA-400 modern syntax assembler"
HOMEPAGE="http://mera400.pl/EMAS"
LICENSE="GPL-2"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/jakubfi/emas.git"
	EGIT_BRANCH="master"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="http://mera400.pl/releases/${PN}/${P}.tar.gz"
	KEYWORDS="-* ~amd64 ~x86"
fi

SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/emelf
	dev-libs/emawp
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
	cmake_src_configure
}
