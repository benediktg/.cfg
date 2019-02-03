function resize-picture
    for i in $argv
        if test -f $i
            convert $i -adaptive-resize 2000x2000\> resized_$i
        end
    end
end
