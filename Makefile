# $NetBSD$

# XXX
MAKE_JOBS_SAFE=		no
# XXX version 1.0 according to script
# version -3 according to readme
# XXX

DISTNAME=		${GITHUB_PROJECT}-${GITHUB_TAG}
PKGNAME=		${GITHUB_PROJECT}-0.0.3
CATEGORIES=		devel
MASTER_SITES=		${MASTER_SITE_GITHUB:=christianhujer/}
GITHUB_PROJECT=		aceunit
GITHUB_TAG=		0e606eab20373de01fa5f70559db37035489e49a

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://nelkinda.com/products/aceunit/
COMMENT=		Advanced C and Embedded Unit test framework
LICENSE=		modified-bsd

# objdump (so, binutils)
# or nm
# or readelf

USE_TOOLS+=		bash:run gmake
FORCE_C_STD=		c90
TOOLS_PLATFORM.bash=	# undef, to avoid too-old vendor bash
REPLACE_BASH=		bin/aceunit
BUILD_TARGET=		lib-all		# all?
#TEST_TARGET=		test-all

post-extract:
	[ ${PKGMANDIR} = "share/man" ] || ${MV} -f ${WRKSRC}/share/man ${WRKSRC}/${PKGMANDIR}

.include "../../mk/bsd.pkg.mk"
