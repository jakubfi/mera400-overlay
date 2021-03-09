# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="MERA-400 emulation and tools meta package"
HOMEPAGE="http://mera400.pl"
LICENSE="GPL-2"

KEYWORDS="-* ~amd64 ~x86"

SLOT="0"
IUSE=""

RDEPEND="
	dev-lang/assem
	dev-lang/emas
	dev-util/emlin
	dev-util/emdas
	dev-util/emcrk
	app-emulation/em400
	sys-boot/bootw
"
DEPEND=""
