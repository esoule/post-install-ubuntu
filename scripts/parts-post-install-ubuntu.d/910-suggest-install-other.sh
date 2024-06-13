#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"

main_func()
{
	set +x

	printf '\n\n\n'

	echo "If you want to install lightdm, run this:"
	echo ""
	echo "    sudo apt-get install lightdm-gtk-greeter lightdm-gtk-greeter-settings \\"
	echo "            ubuntu-wallpapers"
	echo ""
	echo "    sudo apt-get --no-install-recommends install lightdm"
	echo ""
	echo "If you want to install thunderbird, run this:"
	echo ""
	echo "    sudo apt-get install thunderbird"
	echo ""
	echo "If you want to install libreoffice, run this:"
	echo ""
	echo "    sudo apt-get install libreoffice"
	echo ""
	echo "If you want to install tshark, run this:"
	echo ""
	echo "    sudo apt-get install tshark"
	echo ""
	echo "If you want to install wireshark, run this:"
	echo ""
	echo "    sudo apt-get install wireshark"
	echo ""
	echo "If you want to enable firewall, run this:"
	echo ""
	echo "    sudo ufw enable"

	printf '\n\n\n'

	set -x
	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
