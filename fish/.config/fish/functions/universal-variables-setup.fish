function universal-variables-setup
    # abbreviations {{{1
    abbr -a cdt 'cd (mktemp -d)'
    abbr -a dc cd
    abbr -a kin 'kinit geib -R; or kinit geib'
    abbr -a nvi nvim
    abbr -a syc 'systemctl'
    abbr -a sycu 'systemctl --user'
    # }}}1
    # environment {{{1
    if type -q -f nvim
        set -Ux EDITOR nvim
    else
        set -Ux EDITOR vim
    end
    set -Ux BROWSER firefox
    set -Ux GOPATH $HOME/.local/go

    set -Ux LS_COLORS \
        'rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'
    set -Ux GCC_COLORS \
        'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

    set -U fish_user_paths \
        $HOME/bin \
        $HOME/.local/bin \
        /snap/bin \
        $GOPATH/bin \
        $HOME/.cargo/bin
    # }}}1
    # prompt settings {{{1
    set -U __fish_git_prompt_color_branch yellow
    set -U __fish_git_prompt_showdirtystate yes
    set -U __fish_git_prompt_showstashstate yes
    set -U __fish_git_prompt_showupstream yes

    set -U fish_color_autosuggestion 93a1a1
    set -U fish_color_cancel '-r'
    set -U fish_color_command 586e75
    set -U fish_color_comment 93a1a1
    set -U fish_color_cwd green
    set -U fish_color_cwd_root red
    set -U fish_color_end 268bd2
    set -U fish_color_error dc322f
    set -U fish_color_escape bryellow '--bold'
    set -U fish_color_history_current '--bold'
    set -U fish_color_host (echo $hostname | sha256sum | head -c 6)
    set -U fish_color_match '--background=brblue'
    set -U fish_color_normal normal
    set -U fish_color_operator bryellow
    set -U fish_color_param 657b83
    set -U fish_color_quote 839496
    set -U fish_color_redirection 6c71c4
    set -U fish_color_root red '--bold'
    set -U fish_color_search_match bryellow '--background=white'
    set -U fish_color_selection white '--bold' '--background=brblack'
    set -U fish_color_status red
    set -U fish_color_user green '--bold'
    set -U fish_color_valid_path '--underline'

    set -U fish_key_bindings fish_default_key_bindings

    set -U fish_pager_color_completion green
    set -U fish_pager_color_description B3A06D yellow
    set -U fish_pager_color_prefix cyan '--underline'
    set -U fish_pager_color_progress brwhite '--background=cyan'

    set -U fish_prompt_pwd_dir_length 2
    # }}}1
end
