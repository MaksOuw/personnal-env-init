init:
	mkdir ~/workspace
	git clone git@github.com:MaksOuw/dotfiles ~/workspace/dotfiles

symlink:
	mv ~/.bashrc ~/.bashrc.old
	ln -s ~/workspace/dotfiles/.bashrc ~/.bashrc
	ln -s ~/workspace/dotfiles/.bashrc.d ~/.bashrc.d
	ln -s ~/workspace/dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/workspace/dotfiles/.vimrc ~/.vimrc
	ln -s ~/workspace/dotfiles/config/powerline ~/.config/powerline

install: init powerline symlink

powerline:
	sudo pip install git+git://github.com/Lokaltog/powerline
	wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
	wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
	sudo mv PowerlineSymbols.otf /usr/share/fonts/
	fc-cache -vf /usr/share/fonts/
	sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
	mv ~/.config/powerline ~/.config/powerline-old

