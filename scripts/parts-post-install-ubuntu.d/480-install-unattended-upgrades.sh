#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	local ubuntu_rel="$( lsb_release --short --release )"

	PACKAGE_LIST=""

	PACKAGE_LIST="
${PACKAGE_LIST}
unattended-upgrades
"

	apt -y install ${PACKAGE_LIST}

	edit_unattended_upgrade_file /etc/apt/apt.conf.d/50unattended-upgrades

	true
}

edit_unattended_upgrade_file()
{
	local orig_cfg="${1}"
	local tmp_cfg="/tmp/$(basename "${1}" )"

	cp "${orig_cfg}" "${tmp_cfg}"

	sed -i \
		-e 's|\s*//\s*Unattended-Upgrade::MinimalSteps "false";|Unattended-Upgrade::MinimalSteps "true";|' \
		-e 's|\s*//\s*Unattended-Upgrade::Remove-Unused-Kernel-Packages "false";|Unattended-Upgrade::Remove-Unused-Kernel-Packages "true";|' \
		-e 's|\s*//\s*Unattended-Upgrade::Remove-Unused-Dependencies "false";|Unattended-Upgrade::Remove-Unused-Dependencies "true";|' \
		-e 's|\s*//\s*Unattended-Upgrade::SyslogEnable "false";|Unattended-Upgrade::SyslogEnable "true";|' \
		"${tmp_cfg}"

	diff -q "${orig_cfg}" "${tmp_cfg}" >/dev/null
	local rv=$?

	if [ "${rv}" = 1 ] ; then
		./scripts/helpers/install_file_attr.sh 0644 root root "${orig_cfg}" "${tmp_cfg}"
	fi

	rm -f "${tmp_cfg}"

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
