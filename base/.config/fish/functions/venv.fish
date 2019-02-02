function venv
    python3 -m venv $argv[1]
    source $argv[1]/bin/activate.fish
end
