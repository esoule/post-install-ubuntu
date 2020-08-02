#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	EMPTY=""

	local ubuntu_rel="$( lsb_release --short --release )"

	PKG_oxygen_icon_theme=""
	if [ "${ubuntu_rel}" = "16.04" ] ; then
		PKG_oxygen_icon_theme="oxygen5-icon-theme"
	else
		PKG_oxygen_icon_theme="oxygen-icon-theme"
	fi

	apt -y install \
		fonts-dejavu \
		ubuntu-wallpapers \
		${PKG_oxygen_icon_theme} \
		oxygen-cursor-theme \
		${EMPTY}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
