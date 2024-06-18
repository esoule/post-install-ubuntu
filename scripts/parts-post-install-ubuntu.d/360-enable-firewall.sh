#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}" || exit 1
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	DRY_RUN="--dry-run"
	DRY_RUN=""

	# NOTE: ask the user to enable it interactively
	# sudo ufw ${DRY_RUN} enable

	sudo ufw ${DRY_RUN} allow in OpenSSH comment "Added by post-install-ubuntu $( basename "$0" )"

	sudo ufw ${DRY_RUN} status

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
