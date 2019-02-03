function install-vscode-extensions
    xargs -a ~/.config/Code/User/extensions.txt -l1 code --install-extension
end
