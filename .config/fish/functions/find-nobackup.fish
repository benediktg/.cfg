function find-nobackup
    test -d $argv; or set argv $PWD
    find $argv -name .nobackup 2>&1 | rg -v ': (No Permission|Keine Berechtigung)$'
end
