#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"

echo "Project directory is ${PROJECT_HOME}"

require_root_or_exit

run-parts --verbose scripts/post_inst.d </dev/null

cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-post.inc.sh"
true
