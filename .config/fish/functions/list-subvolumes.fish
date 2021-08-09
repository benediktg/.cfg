function list-subvolumes
  btrfs subvolume list / | rg -v "docker|snapshot"
end
