#!/bin/bash
set -e
set -o pipefail
set -u
set -x

test -d "$HOME/.cfg" || git clone --bare git@github.com:benediktg/.cfg.git "$HOME/.cfg"
alias config='git --git-dir="$HOME/.cfg" --work-tree="$HOME"'
config checkout -f
config config status.showUntrackedFiles no
