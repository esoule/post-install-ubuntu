#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	local virt_str="$( lspci | grep -i pci | grep -o -i '\(vmware\|virtualbox\)' | head -n 1 )"

	if [ -z "${virt_str}" ] ; then
		return 0
	fi

	PACKAGE_LIST="
open-vm-tools
open-vm-tools-desktop
"

	apt -y install ${PACKAGE_LIST}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
