function adb-push
    # Usage:
    # adb-push <directory-on-computer-to-send> <directory-on-device-to-receive-it>
    # Example:
    # adb-push ~/backups/DCIM /sdcard

    set -l source $argv[1]
    set -l target (basename $argv[1])
    set -l destination (echo $argv[2] | grep '/$')
    # If ${destination} ends with '/', remove the trailing '/'
    if test -n $destination
        set destination (string trim -r -c '/' $destination)
    end

    # If ${source} is a directory, make directories on device before pushing them
    if test -d $source
        cd $source; or exit 1
        cd ..
        set target $target/
        find $target -type d -exec adb shell mkdir $destination/{} \;
    end

    adb push $source $destination/$target
end
