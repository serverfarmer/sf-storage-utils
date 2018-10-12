#!/bin/sh

if [ ! -f /etc/local/.config/skip-smart.devices ]; then
	echo "# devices to skip should be added in the below format:
# /dev/disk/by-id/ata-ST4000DM000-1F2168_W300XXXX
" >/etc/local/.config/skip-smart.devices
fi

if [ ! -f /etc/local/.config/skip-smart.raid ]; then
	echo "# devices to skip should be added in the below format:
# sas-ST3600057SS_6SLXXXXX
#
# NO EMPTY LINES IN THIS FILE!
#" >/etc/local/.config/skip-smart.raid
fi
