#!/bin/bash
if [[ -e ~/.local/bin/virtualenvwrapper_lazy.sh ]]; then
    source ~/.local/bin/virtualenvwrapper_lazy.sh
    export PROJECT_HOME="$HOME/Projekte"
fi
