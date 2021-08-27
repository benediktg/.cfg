fish_check_current_version; or exit
test -d $HOME/.fisher; or exit
set -g fisher_path $HOME/.fisher
source $fisher_path/conf.d/fisher_path.fish
