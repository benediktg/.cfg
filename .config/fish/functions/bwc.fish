function bwc
    # adapted from https://github.com/ceedee666/devenv-dotfiles/blob/master/.scripts/bwc
    function copy_uname_and_passwd
        # Print the name of the selected login
        echo Name: (printf "%s" $argv | jq -r ".name")
        echo "> Copying Username"
        # Copy the username to the clipboard
        printf "%s" $argv | jq -r ".login.username" | pbcopy
        echo "> Press any key to copy password..."
        # Wait for user input before coping the password
        read
        echo "> Copying Password"
        # Copy the password to the clipboard
        printf "%s" $argv | jq -r ".login.password" | pbcopy
    end


    # Search for passwords using the search term
    set logins (bw list items --search $argv)

    if test (printf "%s" $logins | jq ". | length") -eq 1
        set login (printf "%s" $logins | jq ".[0]")
    else
        set name (printf "%s" $logins | jq -r ".[].name" | fzf --reverse)
        set login (printf "%s" $logins | jq ".[] | select(.name == \"$name\")")

        copy_uname_and_passwd $login
    end
end
