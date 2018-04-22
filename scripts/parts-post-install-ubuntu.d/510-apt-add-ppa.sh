#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	add-apt-repository --yes ppa:git-core/ppa

	add-apt-repository --yes ppa:esoule/esrepo

	add-apt-repository --yes ppa:esoule/coan

	apt -y update

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
