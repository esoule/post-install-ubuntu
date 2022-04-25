#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	EMPTY=""

	local virt_str=

	virt_str="$( lspci | grep -i pci | grep -o -i '\(vmware\|virtualbox\)' | head -n 1 )"

	if [ -z "${virt_str}" ] ; then
		return 0
	fi

	apt -y install \
		open-vm-tools \
		${EMPTY}

	# FIXME: TODO: install open-vm-tools-desktop only on systems with GUI

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
