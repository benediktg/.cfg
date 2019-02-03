function lskern --description 'Shows running and installed kernels'
    set_color yellow
    uname -r | cut -d'-' -f-2
    set_color normal
    rpm -q kernel-default | cut -d'-' -f3- | rev | cut -d'.' -f2- | rev | sort -r
end
