function config --wraps=git --description 'Dotfile git wrapper'
    /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME $argv;
end
