#!/bin/bash
set +x

true
# shellcheck disable=SC2154
cd "${PROJECT_HOME}" || exit 1

if command -v etckeeper >/dev/null ; then
	etckeeper commit "committing changes in /etc after post-install-ubuntu $( basename "$0" )"
fi
printf '\n\n\n\n'    >&2
true
