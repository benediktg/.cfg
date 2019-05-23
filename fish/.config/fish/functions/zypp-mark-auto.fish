function zypp-mark-auto
    for package in $argv
        sudo sed -i "\$ a $package" /var/lib/zypp/AutoInstalled
    end
end
