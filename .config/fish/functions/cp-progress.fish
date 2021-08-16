function cp-progress --wraps=cp
    cp $argv & progress --monitor --pid $last_pid 
end
