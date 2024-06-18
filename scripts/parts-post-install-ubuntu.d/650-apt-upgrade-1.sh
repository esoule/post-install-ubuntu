#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}" || exit 1
. "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	apt-get -y update

	apt-get -y upgrade

	true
}

. "./scripts/inc-sh/common-run-main.inc.sh"
. "./scripts/inc-sh/common-post.inc.sh"
