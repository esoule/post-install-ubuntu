#!/bin/bash
set +x
echo "" >&2
echo "" >&2
cd "${PROJECT_HOME}"
if which etckeeper >/dev/null ; then
	etckeeper commit "committing changes in /etc after post-install-ubuntu $( basename "$0" )"
fi
true
