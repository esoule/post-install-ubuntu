#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	local machine="$( uname -m )"

	local ubuntu_rel="$( lsb_release --short --release )"

	apt -y install libc6 libstdc++6 libgcc1 zlib1g libncurses5

	if [ "${machine}" = x86_64 ] ; then
		apt -y install libc6:i386 libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386
	fi

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
