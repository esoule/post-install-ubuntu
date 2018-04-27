# /etc/profile.d/freetype2.sh
#
# Classic subpixel mode (default in 2.6)
#
if [ -z "${FREETYPE_PROPERTIES}" ] ; then
	FREETYPE_PROPERTIES="truetype:interpreter-version=35"
	export FREETYPE_PROPERTIES
fi

