function lskern --description 'Shows running and installed kernels'
    set_color bryellow
    uname -r | cut -d'-' -f-2
    set_color normal
    rpm -q kernel-default | cut -d'-' -f3- | cut -d'.' -f-4
end
