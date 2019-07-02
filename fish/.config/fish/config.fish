# environment {{{1
if is_ssh >/dev/null
    set -x FISH_IS_SSH_CONNECTION true
end
# }}}1
# fundle plugins {{{1
# fundle auto-install {{{
if not functions -q fundle
    curl -sfLo ~/.config/fish/functions/fundle.fish --create-dirs https://raw.githubusercontent.com/tuvistavie/fundle/master/functions/fundle.fish
    and fish -c 'fundle install'
    and exec fish
end
# }}}
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'edc/bass'
fundle init
# }}}1
