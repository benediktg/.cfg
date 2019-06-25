function vi -w vim
    if type -q -f nvim
        nvim $argv
    else
        vim $argv
    end
end
