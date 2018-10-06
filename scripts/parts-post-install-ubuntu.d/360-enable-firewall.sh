#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	DRY_RUN="--dry-run"
	DRY_RUN=""

	sudo ufw ${DRY_RUN} enable

	sudo ufw ${DRY_RUN} allow in OpenSSH comment "Added by post-install-ubuntu $( basename "$0" )"

	sudo ufw ${DRY_RUN} status

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
