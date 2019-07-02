# environment {{{1
if is_ssh >/dev/null
    set -x FISH_IS_SSH_CONNECTION true
end
# }}}1
# fundle plugins {{{1
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'edc/bass'
fundle init
# }}}1
