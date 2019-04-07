#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	EMPTY=""

	apt -y install apt-file

	# after apt-file installation
	apt -y update
	apt-file update

	apt -y install \
		htop \
		lm-sensors \
		mc \
		ncdu \
		p7zip \
		p7zip-full \
		pinfo \
		tree \
		unifdef \
		unrar \
		${EMPTY}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
