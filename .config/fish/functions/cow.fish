function cow --wraps=cp
    cp -a --reflink=always $argv
end
