#!/bin/bash
set -eux

test -d ~/.cfg || git clone --bare git@github.com:benediktg/.cfg.git ~/.cfg
git --git-dir="$HOME/.cfg" --work-tree="$HOME" checkout -f
git --git-dir="$HOME/.cfg" --work-tree="$HOME" config status.showUntrackedFiles no
