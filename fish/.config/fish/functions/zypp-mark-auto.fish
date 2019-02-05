function zypp-mark-auto
	for package in $argv
sudo sed -i "\$ a $package" /var/lib/zypp/AutoInstalled
end
echo $argv | xargs sudo zypper in -f
end
