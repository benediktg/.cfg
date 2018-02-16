set -x EDITOR vim
set -x BROWSER firefox
set -x GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
set -x GOPATH $HOME/.local/go
if test -d $HOME/bin
    set -x PATH (string match -v $HOME/bin $PATH) $HOME/bin
end
if test -d $HOME/.local/bin
    set -x PATH (string match -v $HOME/.local/bin $PATH) $HOME/.local/bin
end
if test -d $GOPATH/bin
    set -x PATH (string match -v $GOPATH/bin $PATH) $GOPATH/bin
end
if test -d $HOME/.cargo/bin
    set -x PATH (string match -v $HOME/.cargo/bin $PATH) $HOME/.cargo/bin
end
if test -d $HOME/.linuxbrew/bin
    set -x PATH (string match -v $HOME/.linuxbrew/bin $PATH) $HOME/.linuxbrew/bin
end

setup_universal_variables
