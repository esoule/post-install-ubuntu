#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	if [ -d /etc/local ] ; then
		return 0
	fi

	rm -rf /etc/local
	install -d -m 0755 /etc/local
	if [ -d /usr/local/etc ] ; then
		cp -T -a /usr/local/etc /etc/local
	fi

	rm -rf /usr/local/etc
	ln -T -s /etc/local /usr/local/etc

	return 0
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
