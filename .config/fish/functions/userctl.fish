#!/usr/bin/fish
function userctl --wraps=systemctl --description 'systemctl --user'
    systemctl --user $argv; 
end
