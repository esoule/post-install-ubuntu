#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	local ubuntu_rel="$( lsb_release --short --release )"

	PACKAGE_LIST=""

	if [ "${ubuntu_rel}" = "16.04" ] ; then
		PACKAGE_LIST="
${PACKAGE_LIST}
libqt5libqgtk2
"
	fi

	PACKAGE_LIST="
${PACKAGE_LIST}
qt5-style-plugins
kdiff3
kio-extras
kio-extras-data
konsole
krename
krusader
kwrite
meld
"

	apt -y install ${PACKAGE_LIST}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
