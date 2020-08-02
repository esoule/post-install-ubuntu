#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	EMPTY=""

	local ubuntu_rel="$( lsb_release --short --release )"

	PACKAGE_LIST=""

	PACKAGE_LIST="
${PACKAGE_LIST}
lightdm-gtk-greeter
lightdm-gtk-greeter-settings
numlockx
"

	# NOTE: Do not install thunderbird here. It is big, and not needed on servers

	apt -y install ${PACKAGE_LIST}

	apt -y install \
		remmina \
		remmina-plugin-rdp \
		remmina-plugin-vnc \
		${EMPTY}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
