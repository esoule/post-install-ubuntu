#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	apt -y install openssh-server

	systemctl --no-pager status ssh

	edit_sshd_config_file /etc/ssh/sshd_config

	systemctl --no-pager restart ssh

	true
}

edit_sshd_config_file()
{
	local orig_cfg=
	local tmp_cfg=

	orig_cfg="${1}"
	tmp_cfg="/tmp/$(basename "${1}" )"

	if ! [ -e "${orig_cfg}" ] ; then
		echo "WARNING: File ${orig_cfg} is missing ($0)"  >&2
		return 0
	fi

	cp "${orig_cfg}" "${tmp_cfg}"

	if grep -q UseDNS ${tmp_cfg} ; then
		sed -i \
			-e 's/^\s*UseDNS\b.*/UseDNS no/' \
			-e 's/^\s*#\s*UseDNS\b.*/UseDNS no/' \
			-- "${tmp_cfg}"
	else
		echo "UseDNS no" >>"${tmp_cfg}"
	fi

	diff -q "${orig_cfg}" "${tmp_cfg}" >/dev/null
	local rv=$?

	if [ "${rv}" = 1 ] ; then
		install -v -m 0644 -o root -g root "${tmp_cfg}" "${orig_cfg}"
	fi

	rm -f "${tmp_cfg}"

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
