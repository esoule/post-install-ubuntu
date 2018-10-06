#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	set +x

	printf '\n\n\n'

	echo "Run this command interactively to install lightdm"
	echo ""
	echo "sudo apt --no-install-recommends install lightdm"

	printf '\n\n\n'

	set -x
	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
