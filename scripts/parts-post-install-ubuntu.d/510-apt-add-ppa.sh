#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	local ubuntu_rel="$( lsb_release --short --release )"

	add-apt-repository --yes ppa:git-core/ppa

	if ! [ "${ubuntu_rel}" = "20.04" ] ; then
		add-apt-repository --yes ppa:esoule/esrepo

		add-apt-repository --yes ppa:esoule/coan
	fi

	apt -y update

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
