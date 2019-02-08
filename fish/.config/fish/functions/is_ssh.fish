function is_ssh
    if string match -qr '^[1-9][0-9]*$' -- "$argv[1]"
        set pid $argv[1]
    else
        set pid $fish_pid
    end
    ps -o ppid=,cmd= $pid | read ppid name
    if string match -qr 'sshd' -- "$name"
        echo "Is SSH: $pid $name"
        return 0
    end
    if test "$ppid" -le 1
        echo "Adam is $pid $name"
        return 1
    end
    is_ssh $ppid
end
