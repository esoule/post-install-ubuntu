#!/bin/sh
set -u

install_file_attr()
{
	local mode="$1"
	local owner="$2"
	local group="$3"
	local dstfile="$4"
	local srcfile="$5"

	local new_tmp_file="${dstfile}.new.tmp"

	rm -f "${new_tmp_file}"
	cp -v "${srcfile}" "${new_tmp_file}"
	chmod "${mode}" "${new_tmp_file}"
	chown "${owner}:${group}" "${new_tmp_file}"
	mv -v "${new_tmp_file}" "${dstfile}"
	return 0
}

install_file_attr "$@"
