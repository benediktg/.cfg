function mv-progress --wraps=mv
    mv $argv & progress --monitor --pid $last_pid 
end
