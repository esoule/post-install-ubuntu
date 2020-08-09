#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	apt -y install openssh-server

	systemctl --no-pager status ssh

	if grep -q '^\s*UseDNS no\s*$' /etc/ssh/sshd_config ; then
		return 0
	fi

	local tmp_cfg=/etc/ssh/sshd_config.001.tmp

	install -v -m 0644 -o root -g root /etc/ssh/sshd_config "${tmp_cfg}"

	if grep -q UseDNS ${tmp_cfg} ; then
		sed -i -e 's/^\s*UseDNS\b.*/UseDNS no/' -e 's/^\s*#\s*UseDNS\b.*/UseDNS no/' ${tmp_cfg}
	else
		echo UseDNS no >>${tmp_cfg}
	fi

	install -v -m 0644 -o root -g root "${tmp_cfg}" /etc/ssh/sshd_config
	rm "${tmp_cfg}"

	systemctl --no-pager restart ssh

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
