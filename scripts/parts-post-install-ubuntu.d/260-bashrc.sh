#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	sha1_ref="c4d853993e323432cb84359de2c319b9a767b729"

	sha1_file="$( cat /etc/skel/.bashrc | sha1sum -b - | awk '{ print $1 }' )"

	if [ "${sha1_file}" = "${sha1_ref}" ] ; then
		install -v -m 0644 -o root -g root \
			./files/system/etc/skel/.bashrc \
			/etc/skel/.bashrc
	fi

	sha1_ref="17d380175c89fb145357edd7f1356f6274bfc762"

	sha1_file="$( cat /root/.bashrc | sha1sum -b - | awk '{ print $1 }' )"

	if [ "${sha1_file}" = "${sha1_ref}" ] ; then
		install -v -m 0644 -o root -g root \
			./files/system/root/.bashrc \
			/root/.bashrc
	fi
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
