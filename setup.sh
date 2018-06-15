#!/bin/sh

if [ ! -f /etc/local/.config/skip-smart.devices ]; then
	echo "# devices to skip should be added in the below format:
# /dev/disk/by-id/ata-ST4000DM000-1F2168_W300XXXX
" >/etc/local/.config/skip-smart.devices
fi
