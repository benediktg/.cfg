function load-gnome-terminal-papercolor-scheme
    set cid (dconf read /org/gnome/terminal/legacy/profiles:/default | tr -d \')
    set p /org/gnome/terminal/legacy/profiles:/:$cid

    dconf write $p/background-color "'#EEEEEE'"
    dconf write $p/bold-color-same-as-fg "true"
    dconf write $p/foreground-color "'#444444'"
    dconf write $p/palette "['#EEEEEE', '#AF0000', '#008700', '#5F8700', '#0087AF', '#878787', '#005F87', '#444444', '#BCBCBC', '#D70000', '#D70087', '#8700AF', '#D75F00', '#D75F00', '#005FAF', '#005F87']"
    dconf write $p/use-theme-colors "false"
end

