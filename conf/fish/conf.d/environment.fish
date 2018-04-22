set -x EDITOR vim
set -x BROWSER firefox
set -x GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
set -x GOPATH $HOME/.local/go

set -l _path_dirs \
    $HOME/.dotfiles/bin \
    $HOME/bin \
    $HOME/.local/bin \
    $GOPATH/bin \
    $HOME/.cargo/bin \
    $HOME/.linuxbrew/bin
for d in $_path_dirs
    if test -d $d; and not contains $d $PATH
        set -x PATH $PATH $d
    end
end

setup_universal_variables
