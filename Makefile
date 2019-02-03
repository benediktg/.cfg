.PHONY: all
all: stow

.PHONY: stow
stow:
	@stow -t ~ -S base bin fish vim
	fish -c install-diff-so-fancy
	@echo "Run the following tasks:"
	@echo fish -c install-fundle
	@echo fish -c install-vim-plug


.PHONY: desktop
desktop: stow
	@stow -t ~ -S desktop vscode
	@echo "Run the following tasks:"
	@echo fish -c install-vscode-extensions

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
