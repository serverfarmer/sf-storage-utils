#!/bin/sh

ls /dev/disk/by-id/ata-* /dev/disk/by-id/usb-* 2>/dev/null |grep -v -- -part |grep -v VBOX |grep -v VMware |grep -v CF_CARD |grep -v DVD
