function update-vim-plugins
    for i in ~/.vim/pack/plugins/start/*
        c submodule update --remote $i
    end
end
