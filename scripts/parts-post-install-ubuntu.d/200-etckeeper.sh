#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	EMPTY=""

	apt-get -y install \
		git \
		git-man \
		etckeeper \
		${EMPTY}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
