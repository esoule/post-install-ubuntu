#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	if ! [ -d /etc/logrotate.d ] ; then
		install -v -d -m 0755 /etc/logrotate.d
	fi

	./scripts/helpers/install_file_attr.sh 0644 root root /etc/logrotate.d/100-local-dateext ./files/system/etc/logrotate.d/100-local-dateext
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
