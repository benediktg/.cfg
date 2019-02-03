.PHONY: all
all: stow

.PHONY: stow
stow:
	@stow -t ~ -S base bin fish vim
	curl -fLo ~/.config/fish/functions/fundle.fish --create-dirs https://git.io/fundle
	fish -c 'fundle install'
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugUpdate +qa
	curl -fLo ~/.local/bin/diff-so-fancy --create-dirs https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
	chmod +x ~/.local/bin/diff-so-fancy

.PHONY: desktop
desktop: stow
	@stow -t ~ -S desktop vscode

.PHONY: unstow
unstow:
	@stow -t ~ -D base bin fish vim desktop vscode
	-rm ~/.config/fish/functions/fundle.fish
	-rm -rf ~/.config/fish/fundle
	-rm ~/.vim/autoload/plug.vim
	-rm -rf ~/.vim/plugged

.PHONY: undesktop
undesktop: unstow
	@stow -t ~ -D desktop vscode
