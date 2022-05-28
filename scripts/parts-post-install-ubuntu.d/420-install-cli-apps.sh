#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	local ubuntu_rel=

	EMPTY=""

	ubuntu_rel="$( lsb_release --short --release )"

	apt -y install \
		htop \
		lm-sensors \
		mc \
		ncdu \
		p7zip \
		p7zip-full \
		pinfo \
		screen \
		tmux \
		tree \
		unrar \
		${EMPTY}

	# FIXME: unifdef depends on cpp, brings in cpp cpp-9 gcc-9-base libisl22 libmpc3. Do not install on server at all

	if [ "${ubuntu_rel}" = 18.04 ] || [ "${ubuntu_rel}" = 20.04 ] ; then
		apt -y install \
			exfat-fuse \
			exfat-utils \
			${EMPTY}
	fi
	if [ "${ubuntu_rel}" = 22.04 ] ; then
		apt -y install \
			exfat-fuse \
			exfatprogs \
			${EMPTY}
	fi

	apt -y install \
		ntfs-3g \
		${EMPTY}

	# FIXME: TODO: install VPN only on Kubuntu and other OSes with GUI
	# openconnect brings in:
	#  libopenconnect5 libpcsclite1 libstoken1 libtomcrypt1 libtommath1
	#  openconnect vpnc-scripts
	#
	# network-manager-openconnect brings in 31 MB of this stuff:
	#  dns-root-data dnsmasq-base libbluetooth3 libidn11 libjansson4
	#  libmbim-glib4 libmbim-proxy libmm-glib0 libndp0 libnl-route-3-200 libnm0
	#  libopenconnect5 libpcsclite1 libqmi-glib5 libqmi-proxy libstoken1
	#  libteamdctl0 libtomcrypt1 libtommath1 modemmanager network-manager
	#  network-manager-openconnect network-manager-pptp openconnect ppp
	#  pptp-linux usb-modeswitch usb-modeswitch-data vpnc-scripts wpasupplicant

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
