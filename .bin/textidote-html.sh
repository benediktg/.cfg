#!/bin/bash
if [ -x /usr/bin/notify-send ]; then
  err() { notify-send -a TeXtidote -i /opt/textidote/textidote-icon.svg "$*"; exit 1; }
else
  err() { printf "%s\n" "$*" >&2; exit 1; }
fi

[ $# -lt 1 ] && err "At least one file should be provided as input"
dir=$(dirname "$1")

pushd "$dir" || err "$dir does not exist"
textidote --check de --output html "$@" > /tmp/textidote.html
popd || exit

xdg-open /tmp/textidote.html &
