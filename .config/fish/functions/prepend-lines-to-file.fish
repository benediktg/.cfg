function prepend-lines-to-file
    test -f $argv[-1] || return 1
    set temp (mktemp)
    for line in $argv[..-2]
        echo $line >> $temp
    end
    cat $argv[-1] >> $temp
    mv $temp $argv[-1]
end
