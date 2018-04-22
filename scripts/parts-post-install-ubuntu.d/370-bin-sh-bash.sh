#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	debconf-show dash
	ls -lad /bin/sh

	echo "dash dash/sh boolean false" | debconf-set-selections

	dpkg-reconfigure -f noninteractive dash

	debconf-show dash
	ls -lad /bin/sh

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
