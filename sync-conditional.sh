#!/bin/bash
#
# target:
# - directory not found -> permanent error, report and abort
# - found, just not mounted at this time -> failed condition, silently fail
#
# each source:
# - found, but not nounted -> risk of overwriting target directory with empty source, silently fail
# - not found -> failed condition, but also silently fail for backups integrity
#

if [ "$3" = "" ]; then
	echo "usage: $0 <script> <target-mountpoint> <source-mountpoint> [...]"
	exit 1
fi

script=/etc/local/sync/tasks/$1
target=$2

if ! [[ $1 =~ ^[a-zA-Z0-9._-]+$ ]]; then
	echo "error: parameter $1 not conforming task name format"
	exit 1
elif ! [[ $2 =~ ^[a-zA-Z0-9/._-]+$ ]]; then
	echo "error: parameter $2 not conforming directory name format"
	exit 1
elif [ ! -x $script ]; then
	echo "error: script $script not found"
	exit 1
elif [ ! -d $target ]; then
	echo "error: target directory $target not found"
	exit 1
elif [ "`df |grep $target$`" = "" ]; then
	exit 0
fi

shift
shift

for mount in "$@"; do
	if ! [[ $mount =~ ^[a-zA-Z0-9/._-]+$ ]]; then
		echo "error: parameter $mount not conforming directory name format"
		exit 1
	elif [ ! -d $mount ] || [ "`df |grep $mount$`" = "" ]; then
		exit 0
	fi
done

echo "# starting rsync to $target at `date +'%Y-%m-%d %H:%M:%S'` #"
$script $target
echo "# finished rsync to $target at `date +'%Y-%m-%d %H:%M:%S'` #"
echo ""
