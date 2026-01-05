# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="CROOK-5 configuration editor"
HOMEPAGE="https://mera400.pl/CROOK https://mera400.pl/Tablica_konfiguracji_MERY-400"
LICENSE="GPL-2"

EGIT_REPO_URI="https://github.com/jakubfi/krokonf"
EGIT_BRANCH="master"
SRC_URI=""
KEYWORDS=""

SLOT="0"
IUSE=""

QTMIN=5.15.2

DEPEND="
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
"
RDEPEND="${DEPEND}"
BDEPEND=""
