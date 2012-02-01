inherit eutils versionator
EAPI=4
DESCRIPTION="PhpStorm"
HOMEPAGE="http://www.jetbrains.com/phpstorm/"

majorv = $(get_major_version )
if [$majorv -gt 100]; then
	SRC_URI="http://download.jetbrains.com/webide/PhpStorm-EAP-${PV}.tar.gz"
	KEYWORDS="~x86 ~amd64"
else
	SRC_URI="http://download.jetbrains.com/webide/PhpStorm-${PV}.tar.gz"
	KEYWORDS="x86 amd64"
fi

RESTRICT="strip mirror"
DEPEND=">=virtual/jre-1.6"
SLOT="0"
S=${WORKDIR}
src_install() {
	dodir /opt/${PN}

	cd PhpStorm*/
	insinto /opt/${PN}
	doins -r *

	fperms a+x /opt/${PN}/bin/phpstorm.sh || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "Chmod failed"
	dosym /opt/${PN}/bin/phpstorm.sh /usr/bin/phpstorm
	
	mv "bin/webide.png" "bin/phpstorm.png"
	doicon "bin/phpstorm.png"
	make_desktop_entry ${PN} "PHP Storm" "phpstorm"
}
pkg_postinst() {
    elog "Run /usr/bin/phpstorm"
}

