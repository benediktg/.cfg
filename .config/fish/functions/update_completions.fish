function update_completions --wraps='systemd-run --user --nice 19 fish -c fish_update_completions' --description 'alias update_completions systemd-run --user --nice 19 fish -c fish_update_completions'
  systemd-run --user --nice 19 fish -c fish_update_completions $argv; 
end
