set -x EDITOR vim
set -x BROWSER firefox
set -x GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
set -x GOPATH $HOME/.local/go

set -x LS_COLORS (dircolors -c | string split ' ')[3]
if string match -qr '^([\'"]).*\1$' -- $LS_COLORS
    set LS_COLORS (string match -r '^.(.*).$' $LS_COLORS)[2]
end

set -x PATH \
    $HOME/bin \
    $HOME/.local/bin \
    /snap/bin \
    $GOPATH/bin \
    $HOME/.cargo/bin \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/bin \
    /usr/sbin \
    /bin \
    /sbin
