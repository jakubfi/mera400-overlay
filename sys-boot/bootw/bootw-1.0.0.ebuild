# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="CROOK-5 bootloader for MERA-400"
HOMEPAGE="http://mera400.pl/BOOTW"
LICENSE="GPL-2"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/jakubfi/bootw.git"
	EGIT_BRANCH="master"
	SRC_URI=""
	KEYWORDS=""
else
	SRC_URI="http://mera400.pl/releases/${PN}/${P}.tar.gz"
	KEYWORDS="-* ~amd64 ~x86"
fi

SLOT="0"
IUSE=""

DEPEND="
	dev-lang/emas
"

DOCS="README.md"

src_unpack() {
	if [[ ${PV} == "9999" ]] ; then
		git-r3_src_unpack
	else
		unpack ${P}.tar.gz
	fi
}

src_install() {
	insinto /usr/share/mera400/
	doins bootw.bin
}

pkg_postinst() {
	elog ""
	elog "BOOTW can bootstrap CROOK-5 from the first winchester disk (line 28) connected to MULTIX on channel 1."
	elog "To load CROOK-5 with BOOTW from a disk image in EM400 use:"
	elog ""
	elog " em400 -p ${ROOT}usr/share/mera400/bootw.bin"
	elog ""
}
