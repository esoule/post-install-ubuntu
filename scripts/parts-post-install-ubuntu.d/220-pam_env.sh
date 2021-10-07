#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	local tmp_cfg=/tmp/pam_env.conf.001.tmp
	cp /etc/security/pam_env.conf "${tmp_cfg}"

	if ! grep -q -E GVFS_DISABLE_FUSE "${tmp_cfg}" ; then
		printf '%s\t%s\n' 'GVFS_DISABLE_FUSE' 'DEFAULT=1' >>"${tmp_cfg}"
	fi

	if ! grep -q -E QT_QUICK_BACKEND "${tmp_cfg}" ; then
		printf '%s\t%s\n' 'QT_QUICK_BACKEND' 'DEFAULT=software' >>"${tmp_cfg}"
	fi

	install -v -C -m 0644 -o root -g root "${tmp_cfg}" /etc/security/pam_env.conf

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
