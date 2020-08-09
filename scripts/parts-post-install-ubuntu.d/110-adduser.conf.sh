#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	local orig_cfg=/etc/adduser.conf
	local tmp_cfg=/etc/adduser.conf.001.tmp

	install -v -m 0644 -o root -g root ${orig_cfg} ${tmp_cfg}

	sed -i -e 's/^\s*DIR_MODE=0[0-7][0-7][0-7]\s*$/DIR_MODE=0750/g' ${tmp_cfg}

	diff -q ${orig_cfg} ${tmp_cfg} >/dev/null
	local rv=$?

	if [ "${rv}" = 1 ] ; then
		mv ${tmp_cfg} ${orig_cfg}
	fi

	rm -f ${tmp_cfg}

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
