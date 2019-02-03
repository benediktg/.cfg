function fish_prompt
    set last_status $status

    echo -n '['
    switch $USER
        case root
            set_color $fish_color_root
        case '*'
            set_color $fish_color_user
    end
    echo -n $USER
    set_color normal

    if set -qx FISH_IS_SSH_CONNECTION
        set_color $fish_color_host
        echo -n '@'(prompt_hostname)
    end

    set_color normal
    echo -n ':'
    switch $USER
        case root
            set_color $fish_color_cwd_root
        case '*'
            set_color $fish_color_cwd
    end
    echo -n (prompt_pwd)
    set_color normal
    echo -n '] '

    switch $last_status
        case 0
            set_color green
        case '*'
            set_color red
    end
    switch $USER
        case root
            echo -n '# '
        case '*'
            echo -n '% '
    end
    set_color normal
end
