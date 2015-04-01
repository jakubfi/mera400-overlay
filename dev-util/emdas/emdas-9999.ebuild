EAPI=5

inherit cmake-utils

DESCRIPTION="MERA-400 disassembler"
HOMEPAGE="http://mera400.pl/EMDAS"
LICENSE="GPL-2"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/jakubfi/emdas.git"
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
	dev-libs/emelf
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

