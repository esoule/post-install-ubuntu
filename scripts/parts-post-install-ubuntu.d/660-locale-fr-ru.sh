#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	# Enable fr_CA.UTF-8 in /etc/locale.gen
	locale-gen fr_CA.UTF-8

	# Enable ru_RU.UTF-8 in /etc/locale.gen
	locale-gen ru_RU.UTF-8

	dpkg-reconfigure -f noninteractive locales

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
