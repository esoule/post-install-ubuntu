#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	EMPTY=""

	apt-get -y install \
		unattended-upgrades \
		${EMPTY}

	edit_unattended_upgrade_file /etc/apt/apt.conf.d/50unattended-upgrades

	true
}

edit_unattended_upgrade_file()
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

	sed -i \
		-e 's|\s*//\s*Unattended-Upgrade::MinimalSteps "[^"]\+";|Unattended-Upgrade::MinimalSteps "true";|' \
		-e 's|\s*//\s*Unattended-Upgrade::Remove-Unused-Kernel-Packages "[^"]\+";|Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";|' \
		-e 's|\s*//\s*Unattended-Upgrade::Remove-Unused-Dependencies "[^"]\+";|Unattended-Upgrade::Remove-Unused-Dependencies "true";|' \
		-e 's|\s*//\s*Unattended-Upgrade::SyslogEnable "[^"]\+";|Unattended-Upgrade::SyslogEnable "true";|' \
		"${tmp_cfg}"

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
