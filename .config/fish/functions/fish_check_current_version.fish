function fish_check_current_version
    test 3 -eq (string split . $FISH_VERSION)[1]
end
