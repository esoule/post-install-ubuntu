#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	# Enable en_CA.UTF-8 in /etc/locale.gen
	locale-gen en_CA.UTF-8

	dpkg-reconfigure -f noninteractive locales

	update-locale LANG="en_CA.UTF-8" LANGUAGE="en_CA:en"

	dpkg-reconfigure -f noninteractive locales

	# Load apt files with translations
	apt -y update

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
