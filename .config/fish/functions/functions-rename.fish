function functions-rename
    set -l old_func $argv[1]
    set -l new_func $argv[2]
    if test $old_func = $new_func
        return
    end

    functions --copy $old_func $new_func
    functions --erase $old_func

    set -l saved_func $HOME/.config/fish/functions/$old_func.fish
    if test -f $saved_func
        funcsave $new_func
        rm $saved_func
    end
end
