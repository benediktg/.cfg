function fish_prompt
    set last_status $status
    if not set -qU fish_color_root
        set -U fish_color_root red
    end

    echo -n '['
    if test $USER = root
        set_color $fish_color_root
    else
        set_color $fish_color_user
    end
    echo -n $USER
    set_color normal

    if set -qx SSH_CONNECTION
        set -Ux FISH_IS_SSH_CONNECTION
    end
    if set -qU FISH_IS_SSH_CONNECTION
        if not set -qg FISH_COLOR_HOST
            set -g FISH_COLOR_HOST (echo -n $hostname | sha256sum | head -c 6)
        end
        set_color $FISH_COLOR_HOST
        echo -n '@'(prompt_hostname)
    end

    set_color normal
    echo -n ':'
    if test $USER = root
        set_color $fish_color_cwd_root
    else
        set_color $fish_color_cwd
    end
    echo -n (prompt_pwd)
    set_color normal
    echo -n '] '

    # Sets the color of the last part of the prompt
    # according to the status of the last command
    set_color red
    switch $last_status
        case 0
            set_color green
    end
    if test $USER = root
        echo -n '# '
    else
        echo -n '% '
    end
    set_color normal
end
