function fish_prompt
    set last_status $status
    printf '[%s@%s:%s%s%s] ' (whoami) (hostname) (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)

    # Sets the color of the last part of the prompt
    # according to the status of the last command
    set_color red
    switch $last_status
        case 0
            set_color green
    end
    echo -n "% "
    set_color normal
end
