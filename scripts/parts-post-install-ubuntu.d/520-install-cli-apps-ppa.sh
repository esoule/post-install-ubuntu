#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	local ubuntu_rel="$( lsb_release --short --release )"

	PACKAGE_LIST="
git
git-man
strip-nondeterminism
"

	if ! [ "${ubuntu_rel}" = "20.04" ] ; then
		PACKAGE_LIST="
${PACKAGE_LIST}
coan
"
	fi

	apt -y install ${PACKAGE_LIST}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
