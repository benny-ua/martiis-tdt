AC_INIT(tuxbox-enigma,0.0.1)
AM_INIT_AUTOMAKE(tuxbox-enigma,0.0.1)

TUXBOX_APPS
TUXBOX_APPS_DIRECTORY
TUXBOX_BOXTYPE

AC_PROG_CC
AC_PROG_CXX
AC_PROG_RANLIB

AC_ARG_WITH(webif,
	[  --with-webif=NAME webif type [[standard,expert,...]]],
	[WEBIF="$withval"],[WEBIF="expert"])
	
AC_SUBST(WEBIF)
AM_CONDITIONAL(WEBIF_STANDARD, test "$WEBIF" != "expert")
AM_CONDITIONAL(WEBIF_EXPERT, test "$WEBIF" = "expert")

AC_ARG_WITH(epg,
	[  --with-epg=NAME epg type [[standard,private,...]]],
	[EPG="$withval"],[EPG="standard"])
	
AC_SUBST(EPG)
AM_CONDITIONAL(EPG_STANDARD,test "$EPG" != "private")
AM_CONDITIONAL(EPG_PRIVATE,test "$EPG" = "private")

AC_ARG_WITH(mhw-epg,
	[  --with-mhw-epg          enable capture of mhw epg (default off)],
	[MHW_EPG="$withval"],[MHW_EPG="no"])

AC_ARG_WITH(flashtool,
	[  --with-flashtool=NAME type flashtool [[standard,expert]]],
	[FLASHTOOL="$withval"],[FLASHTOOL="standard"])

AC_SUBST(FLASHTOOL)
AM_CONDITIONAL(FLASHTOOL_STANDARD,test "$FLASHTOOL" != "expert")
AM_CONDITIONAL(FLASHTOOL_EXPERT,test "$FLASHTOOL" = "expert")

AC_ARG_WITH(reiserfs,
	[  --with-reiserfs=NAME type reiserfs [[yes,no]]],
	[REISERFS="$withval"],[REISERFS="no"])

AC_SUBST(REISERFS)
AM_CONDITIONAL(REISERFS_NO,test "$REISERFS" != "yes")
AM_CONDITIONAL(REISERFS_YES,test "$REISERFS" = "yes")

AC_ARG_WITH(ext-flashtool,
	[  --with-ext-flashtool=NAME type ext-flashtool [[yes,no]]],
	[EXTFLASHTOOL="$withval"],[EXTFLASHTOOL="no"])

AC_SUBST(EXTFLASHTOOL)
AM_CONDITIONAL(EXTFLASHTOOL_NO,test "$EXTFLASHTOOL" != "yes")
AM_CONDITIONAL(EXTFLASHTOOL_YES,test "$EXTFLASHTOOL" = "yes")

AC_ARG_WITH(enigma-debug,
	[  --with-enigma-debug=NAME type enigma-debug [[yes,no]]],
	[ENIGMA_DEBUG="$withval"],[ENIGMA_DEBUG="no"])

AC_SUBST(ENIGMA_DEBUG)
AM_CONDITIONAL(ENIGMA_DEBUG_NO,test "$ENIGMA_DEBUG" != "yes")
AM_CONDITIONAL(ENIGMA_DEBUG_YES,test "$ENIGMA_DEBUG" = "yes")

AC_ARG_ENABLE(sqlite,
	[  --enable-sqlite          enable sql storage (default off)],
	[SQLITE="$enableval"],[SQLITE="no"])

AC_SUBST(SQLITE)
AM_CONDITIONAL(ENABLE_SQLITE,test "$SQLITE" = "yes")

TUXBOX_APPS_DVB
TUXBOX_APPS_DRIVER

#TUXBOX_APPS_LIB_PKGCONFIG(FREETYPE,freetype2)
TUXBOX_APPS_LIB_CONFIG(FREETYPE,freetype-old-config)
TUXBOX_APPS_LIB_PKGCONFIG(ID3TAG,id3tag)
TUXBOX_APPS_LIB_PKGCONFIG(MAD,mad)
TUXBOX_APPS_LIB_PKGCONFIG(MD5SUM,tuxbox-md5sum)
TUXBOX_APPS_LIB_PKGCONFIG(PLUGINS,tuxbox-plugins)
TUXBOX_APPS_LIB_PKGCONFIG(PNG,libpng)
TUXBOX_APPS_LIB_PKGCONFIG(SIGC,sigc++-1.2)
TUXBOX_APPS_LIB_PKGCONFIG(XMLTREE,tuxbox-xmltree)
TUXBOX_APPS_LIB_PKGCONFIG(TUXTXT,tuxbox-tuxtxt)
TUXBOX_APPS_LIB_PKGCONFIG(VORBISIDEC,vorbisidec)
if test "$enable_sqlite" = "yes" ; then
	TUXBOX_APPS_LIB_PKGCONFIG(SQLITE,sqlite3)
fi
TUXBOX_APPS_LIB_PKGCONFIG(FRIBIDI,fribidi)
TUXBOX_APPS_LIB_PKGCONFIG(CONFIGFILE,tuxbox-configfile)
#TUXBOX_APPS_LIB_PKGCONFIG(CURL,curl)
TUXBOX_APPS_LIB_PKGCONFIG(CURL,libcurl)
TUXBOX_APPS_LIB_PKGCONFIG(NET,tuxbox-net)
TUXBOX_APPS_LIB_PKGCONFIG(TUXBOX,tuxbox)
TUXBOX_APPS_LIB_PKGCONFIG(ALSA,alsa)

CPPFLAGS="$CPPFLAGS -fno-exceptions -fno-rtti -D_REENTRANT -DHAVE_DREAMBOX_HARDWARE -DDISABLE_DBOX_RC -DDISABLE_DREAMBOX_RC -DUSE_IFUPDOWN $NET_CFLAGS "

CPPFLAGS="$CPPFLAGS -DDVB_NG_API"
CPPFLAGS="$CPPFLAGS -DENABLE_PRIVATE_EPG"
#CPPFLAGS="$CPPFLAGS -DENABLE_FLASHTOOL"
CPPFLAGS="$CPPFLAGS -DUSE_EXTERNAL_FLASHTOOL"
CPPFLAGS="$CPPFLAGS -DDEBUG"
#CPPFLAGS="$CPPFLAGS -DENABLE_REISERFS"
#CPPFLAGS="$CPPFLAGS -DENABLE_MHW_EPG"
#CPPFLAGS="$CPPFLAGS -DENABLE_EXPERT_WEBIF"
#CPPFLAGS="$CPPFLAGS -DENABLE_SQLITE"
#CPPFLAGS="$CPPFLAGS -DTUXTXT_CFG_STANDALONE"
#CPPFLAGS="$CPPFLAGS -DDISABLE_LCD"
#CPPFLAGS="$CPPFLAGS -DDISABLE_CI"
#CPPFLAGS="$CPPFLAGS -DTUXTXT_DEBUG"

CPPFLAGS="$CPPFLAGS $FREETYPE_CFLAGS $ID3TAG_CFLAGS $MAD_CFLAGS $MD5SUM_CFLAGS $TUXTXT_CFLAGS"
CPPFLAGS="$CPPFLAGS $PLUGINS_CFLAGS $PNG_CFLAGS $SIGC_CFLAGS $TUXBOX_CFLAGS $XMLTREE_CFLAGS"
LDFLAGS="-pthread $LDFLAGS"

TUXBOX_APPS_GETTEXT

AC_OUTPUT([
Makefile
boot/Makefile
boot/showlogo/Makefile
boot/bootmenue/Makefile
boot/bootmenue/skins/Makefile
boot/chttpd/Makefile
data/Makefile
data/fonts/Makefile
data/htdocs/Makefile
data/htdocs/stylesheets/Makefile
data/pictures/Makefile
data/pictures/chk_stone/Makefile
data/pictures/chk_stone/mainmenu/Makefile
data/pictures/chk_silver/Makefile
data/pictures/chk_silver/mainmenu/Makefile
data/pictures/chk_v2/Makefile
data/pictures/countries/Makefile
data/pictures/neutrino/Makefile
data/pictures/mainmenu/Makefile
data/pictures/shortcut/Makefile
data/pictures/keypics/Makefile
data/pictures/small/Makefile
data/pictures/carbon/Makefile
data/pictures/blueqt/Makefile
data/resources/Makefile
data/skins/Makefile
data/sysconfig/Makefile
data/templates/Makefile
data/lirc/Makefile
doc/Makefile
hotplug/Makefile
flashtool/Makefile
include/Makefile
include/lib/Makefile
include/lib/base/Makefile
include/lib/codecs/Makefile
include/lib/driver/Makefile
include/lib/dvb/Makefile
include/lib/gdi/Makefile
include/lib/gui/Makefile
include/lib/socket/Makefile
include/lib/system/Makefile
lib/Makefile
lib/base/Makefile
lib/driver/Makefile
lib/codecs/Makefile
lib/dvb/Makefile
lib/dvb/lowlevel/Makefile
lib/gdi/Makefile
lib/gui/Makefile
lib/socket/Makefile
lib/system/Makefile
lib/picviewer/Makefile
lib/movieplayer/Makefile
po/Makefile
src/Makefile
enigma.pc
])

