# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="MERA-400 emulation and tools meta package"
HOMEPAGE="http://mera400.pl"
LICENSE="GPL-2"

KEYWORDS="-* ~amd64 ~x86 ~x86-fbsd"

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
