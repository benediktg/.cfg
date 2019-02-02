function extract
    if [ $argv ]
        if [ -f $argv ]
            switch $argv
                case '*.tar' '*.tar.bz2' '*.tar.gz' '*.tar.xz' '*.tbz2' '*.tgz'
                    tar -xvf $argv
                case '*.bz2'
                    bunzip2 $argv
                case '*.rar'
                    unrar x $argv
                case '*.gz'
                    gunzip $argv
                case '*.zip'
                    unzip $argv
                case '*.Z'
                    uncompress $argv
                case '*.7z'
                    7z x $argv
                case '*'
                    printf "\"%s\" cannot be extracted with this command\n" $argv
            end
        else
            echo '"$argv" is not a valid file'
        end
    else
        echo 'This command expects a parameter'
    end
end

complete -c extract -x -a "(
    __fish_complete_suffix .tar.bz2
    __fish_complete_suffix .tar.gz
    __fish_complete_suffix .tar.xz
    __fish_complete_suffix .bz2
    __fish_complete_suffix .rar
    __fish_complete_suffix .gz
    __fish_complete_suffix .tar
    __fish_complete_suffix .tbz2
    __fish_complete_suffix .tgz
    __fish_complete_suffix .zip
    __fish_complete_suffix .Z
    __fish_complete_suffix .7z
)"
