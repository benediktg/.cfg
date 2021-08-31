function _install_fisher
    set -U fisher_path "~/.fisher"
    test -d $fisher_path || mkdir $fisher_path
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    config checkout -- ~/.config/fish/fish_plugins
    fisher update
end
