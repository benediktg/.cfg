function rcut -w cut -d 'cut from right to left'
    rev | cut $argv | rev
end
