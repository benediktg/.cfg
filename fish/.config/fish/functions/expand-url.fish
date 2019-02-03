function expand-url
    curl -sI $argv[1] | sed -n 's/Location: *//p'
end
