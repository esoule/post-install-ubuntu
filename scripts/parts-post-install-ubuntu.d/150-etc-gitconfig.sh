#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	cp ./files/etc-gitconfig /etc/gitconfig.tmp

	chmod 0644 /etc/gitconfig.tmp
	chown root:root /etc/gitconfig.tmp
	mv /etc/gitconfig.tmp /etc/gitconfig

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
