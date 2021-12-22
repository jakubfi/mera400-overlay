# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake

DESCRIPTION="Assembler for MERA-400"
HOMEPAGE="http://mera400.pl/EMAS"
LICENSE="GPL-2"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jakubfi/emas"
	EGIT_BRANCH="master"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="http://mera400.pl/releases/${PN}/${P}.tar.gz"
	KEYWORDS="-* ~amd64 ~x86 ~x86-fbsd"
fi

SLOT="0"
IUSE="vim-syntax"

RDEPEND="
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

src_install() {
	cmake_src_install
	if use vim-syntax; then
		insinto /usr/share/vim/vimfiles/syntax
		doins vim/syntax/emas.vim
		insinto /usr/share/vim/vimfiles/ftdetect
		doins vim/ftdetect/emas.vim
	fi
}
