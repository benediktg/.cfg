function cdt --wraps='cd (mktemp -d)' --description 'alias cdt cd (mktemp -d)'
  cd (mktemp -d) $argv; 
end
