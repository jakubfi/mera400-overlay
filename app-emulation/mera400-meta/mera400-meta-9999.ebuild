# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="MERA-400 emulation meta package"
HOMEPAGE="http://mera400.pl"
LICENSE="GPL-2"


if [[ ${PV} == "9999" ]] ; then
	KEYWORDS=""
else
	KEYWORDS="-* ~amd64 ~x86 ~x86-fbsd"
fi

SLOT="0"
IUSE=""

RDEPEND="
	dev-lang/assem
	dev-lang/emas
	dev-util/emlin
	dev-util/emdas
	dev-util/emcrk
	app-emulation/em400
"
DEPEND=""
