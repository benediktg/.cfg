function r_create-subvolume
    fish_is_root_user || begin; echo "kein root"; return 1; end 
    set location (realpath $argv[1])
    set owner (stat -c '%U:%G' $location)
    set backup "$location._"
    if test lsof $location &>/dev/null
        echo "$location wird von einem Programm verwendet"
        return 1
    end
    cd $location/..
    mv $location $backup
    btrfs subvolume create $location
    chown $owner $location
    cp -ax --reflink=always $backup/. $location
    rm -rf $backup
end
