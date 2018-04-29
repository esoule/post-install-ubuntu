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
oxygen5-icon-theme
"
	fi

	if [ "${ubuntu_rel}" = "18.04" ] ; then
		PACKAGE_LIST="
${PACKAGE_LIST}
fonts-liberation2
fonts-noto-color-emoji
oxygen-icon-theme
"
	fi

	PACKAGE_LIST="
${PACKAGE_LIST}
breeze-icon-theme
clearlooks-phenix-theme
fonts-crosextra-caladea
fonts-crosextra-carlito
fonts-dejavu
fonts-liberation
fonts-linuxlibertine
fonts-noto
fonts-roboto
oxygen-cursor-theme
oxygen-cursor-theme-extra
"

	apt -y install ${PACKAGE_LIST}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
