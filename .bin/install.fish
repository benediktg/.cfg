#!/usr/bin/fish

test -d $HOME/.cfg; or git clone --bare git@github.com:benediktg/.cfg.git $HOME/.cfg

function config
   /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME $argv
end

mkdir -p $HOME/.config-backup
config checkout
if test $status -ne 0
    echo "Backing up pre-existing dot files."
    config checkout 2>&1 |\
        egrep "\s+\." |\
        awk {'print $2'} |\
        xargs -I{} mv {} $HOME/.config-backup/{}
    config checkout
end
config config status.showUntrackedFiles no
