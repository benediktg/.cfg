function pipsi-upgrade-all
    find ~/.local/venvs -path '*/bin/pip' -exec {} install -U pip \;
    pipsi list | grep 'Package "' | cut -d'"' -f2 | xargs -L1 pipsi upgrade
end
