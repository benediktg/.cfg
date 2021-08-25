function pbpaste --wraps="xclip"
    xclip -selection clipboard -o $argv;
end
