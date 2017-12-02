set -x EDITOR vim
set -x BROWSER firefox
set -x GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
set -x GOPATH $HOME/.local/go
set -x PATH $PATH \
    $HOME/bin $HOME/.local/bin \
    $GOPATH/bin $HOME/.linuxbrew/bin
