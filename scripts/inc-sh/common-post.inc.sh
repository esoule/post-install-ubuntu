#!/bin/bash
set +x
cd "${PROJECT_HOME}"
if which etckeeper >/dev/null ; then
	etckeeper commit "committing changes in /etc after post-install-ubuntu $( basename "$0" )"
fi
printf '\n\n\n\n'    >&2
true
