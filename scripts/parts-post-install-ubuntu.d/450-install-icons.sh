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
gnome-icon-theme-extras
nuvola-icon-theme
"
	fi

	PACKAGE_LIST="
${PACKAGE_LIST}
adwaita-icon-theme
breeze-icon-theme
elementary-icon-theme
gnome-brave-icon-theme
gnome-dust-icon-theme
gnome-human-icon-theme
gnome-humility-icon-theme
gnome-icon-theme-gartoon-redux
gnome-icon-theme-gartoon
gnome-icon-theme-gperfection2
gnome-icon-theme-nuovo
gnome-icon-theme-suede
gnome-icon-theme-symbolic
gnome-icon-theme-yasis
gnome-icon-theme
gnome-illustrious-icon-theme
gnome-noble-icon-theme
gnome-wine-icon-theme
gnome-wise-icon-theme
hicolor-icon-theme
human-icon-theme
humanity-icon-theme
lubuntu-icon-theme
lxde-icon-theme
mate-icon-theme
moblin-icon-theme
oxygen-icon-theme
oxygen5-icon-theme
silicon-theme
sugar-icon-theme
suru-icon-theme
tangerine-icon-theme
tango-icon-theme-common
tango-icon-theme-extras
tango-icon-theme
ubuntu-mate-icon-themes
ubuntustudio-icon-theme
xubuntu-icon-theme
"

	apt -y install ${PACKAGE_LIST}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
