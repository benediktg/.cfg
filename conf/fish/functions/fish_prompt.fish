function fish_prompt
    set last_status $status

    echo -n '['

    if test $USER = root
        set_color red
    end

    echo -n $USER
    set_color normal

    if set -qx SSH_CONNECTION
        if not set -qg HOST_COLOR
            set -g HOST_COLOR (echo -n $HOSTNAME | sha256sum | head -c 6)
        end
        set_color $HOST_COLOR
        echo -n "@$HOSTNAME"
    end

    echo -n ':'
    set_color $fish_color_cwd
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
    echo -n "% "
    set_color normal
end
