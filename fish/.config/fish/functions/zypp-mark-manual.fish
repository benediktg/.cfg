function zypp-mark-manual
	for line in $argv
        sudo sed -i "/^$line\$/d" /var/lib/zypp/AutoInstalled
    end
end
