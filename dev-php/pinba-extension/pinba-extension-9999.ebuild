# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=3
PHP_EXT_NAME="pinba"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
inherit php-ext-source-r2 git autotools
DESCRIPTION="Pinba is a realtime monitoring/statistics server for PHP using MySQL as a read-only interface."
HOMEPAGE="http://pinba.org/"
EGIT_REPO_URI="git://github.com/tony2001/pinba_extension.git"
LICENSE="PHP-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND="dev-lang/php
		dev-util/re2c
		dev-libs/protobuf"
RDEPEND="${DEPEND}"
src_prepare() {
	php-ext-source-r2_src_prepare
	eautoreconf
}