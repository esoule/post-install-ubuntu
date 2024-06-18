#!/bin/bash
set -u
cd "${PROJECT_HOME}" || exit 1

DEBIAN_FRONTEND=noninteractive
SYSTEMD_PAGER=
export DEBIAN_FRONTEND SYSTEMD_PAGER

require_root_or_exit()
{
	if [ "$( id -u )" != 0 ] ; then
		set +x
		echo "ERROR: $0: Please run this script as root" >&2
		exit 1
	fi
	return 0
}

main_func()
{
	true
}

run_main_function()
{
	local script_name="$0"
	(
		set -x
		true "${script_name}"
		main_func
	) </dev/null
}
