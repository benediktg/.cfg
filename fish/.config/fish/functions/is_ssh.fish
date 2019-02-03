function is_ssh
    if string match -qr '^[1-9][0-9]*$' "$argv[1]"
        set p $argv[1]
    else
        set p $fish_pid
    end
    cat /proc/$p/stat | read pid name x ppid y
    if string match -qr 'sshd' $name
        echo "Is SSH: $pid $name"
        return 0
    end
    if test $ppid -le 1
        echo "Adam is $pid $name"
        return 1
    end
    is_ssh $ppid
end
