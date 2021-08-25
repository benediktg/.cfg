function pbcopy --wraps="xclip"
    xclip -selection clipboard $argv;
end
