#!/bin/bash
PROJECT_HOME="$( cd "$( dirname "$0" )" && cd ../.. && pwd )"
cd "${PROJECT_HOME}"
source "./scripts/inc-sh/common-pre.inc.sh"
require_root_or_exit

main_func()
{
	DRY_RUN="--dry-run"
	DRY_RUN=""

	sudo ufw ${DRY_RUN} allow proto tcp from any to any port 443 comment 'HTTPS'
	sudo ufw ${DRY_RUN} allow proto udp from any to any port 443 comment 'HTTPS'

	sudo ufw ${DRY_RUN} allow proto tcp from any to any port 80 comment 'HTTP'
	sudo ufw ${DRY_RUN} allow proto udp from any to any port 80 comment 'HTTP'

	sudo ufw ${DRY_RUN} allow proto tcp from any to any port 20:21 comment 'FTP'

	sudo ufw ${DRY_RUN} allow proto tcp from any to any port 69 comment 'TFTP TCP'
	sudo ufw ${DRY_RUN} allow proto udp from any to any port 69 comment 'TFTP UDP'

	sudo ufw ${DRY_RUN} allow proto tcp from any to any port 50176:52223 comment 'Ephemeral ports TCP'
	sudo ufw ${DRY_RUN} allow proto udp from any to any port 50176:52223 comment 'Ephemeral ports UDP'

	sudo ufw ${DRY_RUN} allow proto tcp from any to any port 5001:5020 comment 'iperf TCP'
	sudo ufw ${DRY_RUN} allow proto udp from any to any port 5001:5020 comment 'iperf UDP'

	sudo ufw ${DRY_RUN} status

	true
}

source "./scripts/inc-sh/common-run-main.inc.sh"
source "./scripts/inc-sh/common-post.inc.sh"
