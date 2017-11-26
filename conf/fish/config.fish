# Fish git prompt configuration
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

# Disable the default greetings string
set fish_greeting

# Some default applications
set -x EDITOR vim
set -x BROWSER firefox
set -x GOPATH $HOME/.local/go
set -x PATH $PATH \
    $HOME/bin $HOME/.local/bin \
    $GOPATH/bin $HOME/.linuxbrew/bin

# Pretty tree
alias tree "tree -C"

# Pretty gcc and g++
set -x GCC_COLORS 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

function fish_right_prompt
    printf '%s ' (__fish_git_prompt)
end

alias g 'git'

fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'edc/bass'
fundle init
