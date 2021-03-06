#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	local ubuntu_rel=

	ubuntu_rel="$( lsb_release --short --release )"

	if [ "${ubuntu_rel}" = 18.04 ] || [ "${ubuntu_rel}" = 20.04 ] ; then
		install -v -m 0644 -o root -g root ./files/system/etc/profile.d/freetype2.sh /etc/profile.d/freetype2.sh
	fi
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
