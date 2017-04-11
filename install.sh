#!/bin/bash

die() {
	echo >&2 "$@"
	exit 1
}

MY_PATH="`dirname \"$0\"`"
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"
if [ -z "$MY_PATH" ] ; then
	die "Cannot determine script execution path"
fi

cp "${MY_PATH}/github-hook-processor.sh" "/usr/local/bin/"
chmod 0755 "/usr/local/bin/github-hook-processor.sh"
mkdir -p "/usr/lib/github-hook-processor/"
