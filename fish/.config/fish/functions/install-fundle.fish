function install-fundle
    if test -f ~/.config/fish/functions/fundle.fish
        fundle self-update
    else
        curl -sfLo ~/.config/fish/functions/fundle.fish --create-dirs https://git.io/fundle
        fundle install
    end
end
