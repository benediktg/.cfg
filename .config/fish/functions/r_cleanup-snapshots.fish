function r_cleanup-snapshots
    fish_is_root_user || begin; echo "kein root"; return 1; end 
    set volume (findSubvolume $argv[1]) || return 1
    for snapshot in $volume/.snapshots/*/snapshot
        btrfs property set $snapshot ro false
        rm -r $snapshot/$argv[1]
        btrfs property set $snapshot ro true
    end
end
