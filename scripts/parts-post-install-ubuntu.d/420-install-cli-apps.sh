#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	PACKAGE_LIST="
apt-file
p7zip
p7zip-full
unifdef
unrar
"

	apt -y install ${PACKAGE_LIST}

	# after apt-file installation
	apt -y update
	apt-file update

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
