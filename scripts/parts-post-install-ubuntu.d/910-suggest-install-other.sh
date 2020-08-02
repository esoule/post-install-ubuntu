#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"

main_func()
{
	set +x

	printf '\n\n\n'

	echo "If you want to install lightdm, run this:"
	echo ""
	echo "    sudo apt --no-install-recommends install lightdm"
	echo ""
	echo "If you want to install thunderbird, run this:"
	echo ""
	echo "    sudo apt install thunderbird"
	echo ""
	echo "If you want to install libreoffice, run this:"
	echo ""
	echo "    sudo apt install libreoffice"

	printf '\n\n\n'

	set -x
	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
