#!/usr/bin/fish
function update_completions
    systemd-run --user --nice 19 fish -c fish_update_completions
end
