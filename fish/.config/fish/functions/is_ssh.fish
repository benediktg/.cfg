function is_ssh
    if test (string match -r '^[1-9][0-9]*$' "$argv[1]")
        set p $argv[1]
    else
        set p $fish_pid
    end
    cat /proc/$p/stat | read pid name x ppid y
    if test (string match -r 'sshd' $name)
        echo "Is SSH: $pid $name"
        return 0
    end
    if test $ppid -le 1
        echo "Adam is $pid $name"
        return 1
    end
    is_ssh $ppid
end
