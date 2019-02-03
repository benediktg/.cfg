if status is-interactive
    set -g __fish_git_prompt_color_branch yellow
    set -g __fish_git_prompt_showdirtystate yes
    set -g __fish_git_prompt_showstashstate yes
    set -g __fish_git_prompt_showupstream yes

    set -g fish_color_autosuggestion 93a1a1
    set -g fish_color_cancel -r
    set -g fish_color_command 586e75
    set -g fish_color_comment 93a1a1
    set -g fish_color_cwd green
    set -g fish_color_cwd_root red
    set -g fish_color_end 268bd2
    set -g fish_color_error dc322f
    set -g fish_color_escape 'bryellow' '--bold'
    set -g fish_color_history_current --bold
    set -g fish_color_host (echo -n $hostname | sha256sum | head -c 6)
    set -g fish_color_match '--background=brblue'
    set -g fish_color_normal normal
    set -g fish_color_operator bryellow
    set -g fish_color_param 657b83
    set -g fish_color_quote 839496
    set -g fish_color_redirection 6c71c4
    set -g fish_color_root red
    set -g fish_color_search_match 'bryellow' '--background=white'
    set -g fish_color_selection 'white' '--bold' '--background=brblack'
    set -g fish_color_status red
    set -g fish_color_user brgreen
    set -g fish_color_valid_path --underline

    set -g fish_key_bindings fish_default_key_bindings

    set -g fish_pager_color_completion green
    set -g fish_pager_color_description 'B3A06D' 'yellow'
    set -g fish_pager_color_prefix 'cyan' '--underline'
    set -g fish_pager_color_progress 'brwhite' '--background=cyan'

    set -g fish_prompt_pwd_dir_length 2
end
