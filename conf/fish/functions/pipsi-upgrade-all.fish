function pipsi-upgrade-all
    pipsi list \
        | ag 'Package ' \
        | cut -d' ' -f4 \
        | cut -d'"' -f2 \
        | xargs -L1 pipsi upgrade
end
