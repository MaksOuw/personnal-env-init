init:
	mkdir -p ~/workspace
	@if [ ! -d ~/workspace/dotfiles ]; then \
		git clone git@github.com:MaksOuw/dotfiles ~/workspace/dotfiles; \
	fi

symlink:
	mv ~/.bashrc ~/.bashrc.old
	ln -s ~/workspace/dotfiles/.bashrc ~/.bashrc
	ln -s ~/workspace/dotfiles/.bashrc.d ~/.bashrc.d
	ln -s ~/workspace/dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/workspace/dotfiles/.vimrc ~/.vimrc
	ln -s ~/workspace/dotfiles/.config/starship.toml ~/.config/starship.toml
	ln -s ~/workspace/dotfiles/.fonts ~/.fonts

install: init symlink

