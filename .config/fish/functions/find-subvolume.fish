function find-subvolume
    fish_is_root_user || begin; echo "kein root"; return 1; end 
    set dir (realpath $argv[1])
    while test $dir != "/" -a ! -d $dir/.snapshots
        set dir (realpath $dir/..)
    end
    test -d $dir/.snapshots && echo $dir || return 1
end
