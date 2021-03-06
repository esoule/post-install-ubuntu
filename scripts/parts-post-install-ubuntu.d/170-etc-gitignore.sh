#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	if [ -r /etc/.gitignore ] ; then
		return 0
	fi

	install -v -m 0600 -o root -g root ./files/etc-gitignore /etc/.gitignore.tmp

	mv /etc/.gitignore.tmp /etc/.gitignore

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
