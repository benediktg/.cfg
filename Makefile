.PHONY: all
all: stow

.PHONY: stow
stow:
	@stow -t ~ -S stow base bin fish vim
	curl -fLo ~/.config/fish/functions/fundle.fish --create-dirs https://git.io/fundle
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -fLo ~/.local/bin/diff-so-fancy --create-dirs https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
	fish -c 'fundle install'
	vim +PlugUpdate +qa
	chmod +x ~/.local/bin/diff-so-fancy

.PHONY: desktop
desktop: stow
	@stow -t ~ -S desktop vscode

.PHONY: unstow
unstow:
	@stow -t ~ -D stow base bin fish vim desktop vscode

.PHONY: undesktop
undesktop: unstow
	@stow -t ~ -D desktop vscode
