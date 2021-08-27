test 3 -eq (string split . $FISH_VERSION)[1]; or exit
test -d $HOME/.fisher; or exit
set -g fisher_path $HOME/.fisher
source $fisher_path/conf.d/fisher_path.fish
