#!/usr/bin/fish

test -d $HOME/.cfg
or git clone --bare git@github.com:benediktg/.cfg.git $HOME/.cfg

function config
    /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME $argv
end

config checkout -f
config config status.showUntrackedFiles no
