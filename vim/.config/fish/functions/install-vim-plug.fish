function install-vim-plug
    if test ! -f ~/.vim/autoload/plug.vim
        curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    end
    vim +PlugUpdate +qa
end
