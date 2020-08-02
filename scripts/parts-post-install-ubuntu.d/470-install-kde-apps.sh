#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	EMPTY=""

	local ubuntu_rel="$( lsb_release --short --release )"

	PKG_libqt5libqgtk2=""
	if [ "${ubuntu_rel}" = "16.04" ] ; then
		PKG_libqt5libqgtk2="libqt5libqgtk2"
	fi

	apt -y install \
		kdiff3 \
		konsole \
		krename \
		kwrite \
		${EMPTY}

	apt -y install \
		${PKG_libqt5libqgtk2} \
		qt5-style-plugins \
		kio-extras \
		kio-extras-data \
		krusader \
		${EMPTY}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
