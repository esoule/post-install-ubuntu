#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"

sudo echo "Project directory is ${PROJECT_HOME}"

sudo run-parts --verbose '--regex=.*[.]sh$' "./scripts/parts-post-install-ubuntu.d" </dev/null

cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-post.inc.sh"
true
