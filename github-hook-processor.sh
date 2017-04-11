#!/bin/bash

die() {
	echo >&2 "$@"
	exit 1
}

[ "$#" -eq 1 ] || die "usage: ${0} <reponame>"

REPO_NAME="${1}"
SCRIPT_PATH="/usr/lib/github-hook-processor/${REPO_NAME}.sh"

if [[ -x "${SCRIPT_PATH}" ]] ; then
	if [[ -x "/usr/bin/sudo" ]] ; then
		/usr/bin/sudo "${SCRIPT_PATH}"
	else
		"${SCRIPT_PATH}"
	fi
else
	die "Cannot find script ${SCRIPT_PATH} or not executeable!"
fi
