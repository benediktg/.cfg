#!/usr/bin/fish
function g --wraps=git --description 'git'
  git $argv; 
end
