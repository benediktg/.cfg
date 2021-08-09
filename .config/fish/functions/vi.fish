#!/usr/bin/fish
function vi --wraps=vim --description 'vim'
    vim $argv; 
end
