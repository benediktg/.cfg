function install-diff-so-fancy
    curl -sfLo ~/.local/bin/diff-so-fancy --create-dirs \
        https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
    chmod +x ~/.local/bin/diff-so-fancy
end
